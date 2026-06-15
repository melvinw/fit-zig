#!/usr/bin/env python3
import collections
import csv
import re
import shlex
import sys
from dataclasses import dataclass


def _snake_to_pascal(name: str) -> str:
    parts = name.split("_")
    return "".join(map(lambda p: p.capitalize(), parts))


def _fit_to_zig(typ: str, types: dict) -> str:
    if typ in ("uint8", "uint8z", "byte"):
        return "u8"

    if typ == "sint8":
        return "i8"

    if typ in ("uint16", "uint16z"):
        return "u16"

    if typ == "sint16":
        return "i16"

    if typ in ("uint32", "uint32z"):
        return "u32"

    if typ == "sint32":
        return "i32"

    if typ in ("uint64", "uint64z"):
        return "u64"

    if typ == "sint64":
        return "i64"

    if typ == "float32":
        return "f32"

    if typ == "float64":
        return "f64"

    if typ == "string":
        return "[:0]u8"

    if typ == "bool":
        return "bool"

    if typ in ("date_time", "local_date_time"):
        return "u32"

    assert typ in types, typ
    return _snake_to_pascal(typ)


@dataclass
class Enum:
    name: str
    base_type: str
    values: list[tuple[str, str, str]]
    comment: str

    def handle_row(self, row: list[str]):
        _, _, name, value, comment = row
        assert len(name) > 0 and len(value) > 0
        self.values.append((name, value, comment))

    def render(self, types: dict):
        zig_base_type = None

        if self.base_type in ("uint8", "uint8z", "enum"):
            zig_base_type = "u8"

        if self.base_type == "uint16":
            zig_base_type = "u16"

        if self.base_type in ("uint32", "uint32z"):
            zig_base_type = "u32"

        assert zig_base_type is not None, self.base_type
        zig_name = _snake_to_pascal(self.name)
        if len(self.comment) > 0:
            print(f"/// {self.comment}")

        print(f"pub const {zig_name} = enum({zig_base_type}) {{")
        for name, value, comment in self.values:
            if len(comment) > 0:
                print(f"    /// {comment}")

            if name == "enum" or name[0].isdigit():
                name = f"_{name}"

            print(f"    {name} = {value},")

        print("};")


@dataclass
class Component:
    name: str
    width: int
    scale: float | None


@dataclass
class SubField:
    name: str
    field_type: str
    components: list[Component]


@dataclass
class Field:
    field_id: int
    name: str
    field_type: str
    is_array: bool
    comment: str
    scale: float | None
    offset: int | None
    units: str | None
    components: list[Component]
    subfields: list[SubField]

    def render(self, types: dict):
        if len(self.components) > 0 or len(self.subfields) > 0:
            # ignore subfields and components for now.
            return

        zig_type = _fit_to_zig(self.field_type, types)
        if self.is_array:
            zig_type = f"[]{zig_type}"

        if len(self.comment) > 0:
            print(f"    /// {self.comment}")

        print(f"    {self.name}: {zig_type},")


MessageRow = collections.namedtuple(
    "MessageRow",
    [
        "message_name",
        "field_id",
        "field_name",
        "field_type",
        "array",
        "components",
        "scale",
        "offset",
        "units",
        "component_bits",
        "accumulate",
        "ref_field",
        "ref_value",
        "comment",
        "products",
        "EXAMPLE",
    ],
)


@dataclass
class Message:
    name: str
    fields: list[Field]
    comment: str

    def handle_row(self, raw_row: list[str]):
        assert len(raw_row[2]) > 0 and len(raw_row[3]) > 0
        row = MessageRow(*raw_row)

        component_names = list(filter(lambda s: len(s) > 0, row.components.split(",")))
        component_widths = list(
            map(int, filter(lambda s: len(s) > 0, row.component_bits.split(",")))
        )
        component_scales = [None for _ in component_names]
        if "," in row.scale:
            component_scales = list(map(float, row.scale.split(",")))

        assert len(component_names) == 0 or (
            len(component_scales) == len(component_widths) == len(component_names)
        )

        components = [
            Component(name=name, width=width, scale=scale)
            for name, width, scale in zip(
                component_names, component_widths, component_scales
            )
        ]

        if len(row.field_id) > 0:
            self.fields.append(
                Field(
                    field_id=int(row.field_id),
                    name=row.field_name,
                    field_type=row.field_type,
                    is_array=len(row.array) > 0,
                    comment=row.comment,
                    scale=(
                        float(row.scale)
                        if len(row.scale) > 0 and "," not in row.scale
                        else None
                    ),
                    offset=int(row.offset) if len(row.offset) > 0 else None,
                    units=row.units,
                    components=list(components),
                    subfields=[],
                )
            )
        else:
            last_field = self.fields[-1]
            last_field.subfields.append(
                SubField(
                    name=row.field_name,
                    field_type=row.field_type,
                    components=components,
                )
            )

    def render(self, types: dict):
        zig_name = _snake_to_pascal(self.name)
        if len(self.comment) > 0:
            print(f"/// {self.comment}")

        print(f"pub const {zig_name} = struct {{")
        self._render_field_defs(types)
        print("};")

    def _render_field_defs(self, types: dict):
        for field in self.fields:
            field.render(types)


def read_profile(profile_f, types: dict):
    reader = csv.reader(profile_f)

    # skip the header
    next(reader)

    current = None

    for row in reader:
        if row[0:3] == ["", "", ""]:
            continue

        if len(row) == 5 and len(row[0]) > 0 and len(row[1]) > 0:
            name, base_type, _, _, comment = row
            current = Enum(name=name, base_type=base_type, values=[], comment=comment)
            assert current.name not in types, current.name
            types[current.name] = current
            continue

        if len(row[0]) > 0:
            current = Message(name=f"{row[0]}_message", fields=[], comment=row[-3])
            assert current.name not in types
            types[current.name] = current
            continue

        assert current is not None
        assert len(row[0]) == 0
        current.handle_row(row)


if __name__ == "__main__":
    cmd = shlex.join(sys.argv)
    print("//! This file was generated from a FIT profile. Do not edit by hand.")
    print(f"//! Instead, run this command: '{cmd}'")
    types = {}
    for path in sys.argv[1:]:
        with open(path, "r") as f:
            read_profile(f, types)

    for typ in types.values():
        print()
        typ.render(types)
