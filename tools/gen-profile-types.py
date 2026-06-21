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


def _parse_scale(raw: str) -> float | int:
    try:
        return int(raw)
    except:
        return float(raw)


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
    scale: float | int | None
    offset: int | None


@dataclass
class SubField:
    name: str
    field_type: str
    components: list[Component]


WONKY_FIELDS = frozenset({"compressed_speed_distance"})


@dataclass
class Field:
    field_id: int
    name: str
    field_type: str
    is_array: bool
    comment: str
    scale: float | int | None
    offset: int | None
    units: str | None
    components: list[Component]
    subfields: list[SubField]

    def render_def(self, types: dict):
        # XXX: generate code for components
        if self.name in WONKY_FIELDS or len(self.subfields) > 0:
            # XXX: ignore subfields for now.
            return

        zig_type = (
            "f32" if self.scale is not None else _fit_to_zig(self.field_type, types)
        )

        if self.is_array and self.field_type != "string":
            zig_type = f"[]{zig_type}"

        if len(self.comment) > 0:
            print(f"    /// {self.comment}")

        print(f"    {self.name}: ?{zig_type} = null,")

    def render_getter(self, parent_type: str, types: dict):
        # XXX: generate code for components
        if self.name in WONKY_FIELDS or len(self.subfields) > 0:
            # XXX: ignore subfields for now.
            return

        zig_type = (
            "f32" if self.scale is not None else _fit_to_zig(self.field_type, types)
        )

        if self.is_array and self.field_type != "string":
            zig_type = f"[]{zig_type}"

        alloc_param = ", allocator: std.mem.Allocator" if self.needs_allocator() else ""

        if len(self.comment) > 0:
            print(f"    /// {self.comment}")

        print(
            f"    pub fn get{_snake_to_pascal(self.name)}(msg: {parent_type}{alloc_param}) ?{zig_type} {{"
        )
        print(f"        var rf: ?*const decoder.FieldData = null;")
        print("        for (msg.raw_fields) |raw_field| {")
        print(f"            if (raw_field.id == {self.field_id}) {{")
        print("                rf = &raw_field;")
        print("                break;")
        print("            }")
        print("        }")
        print("        if (rf == null) {")
        print("            return null;")
        print("        }")

        # XXX: generate code for components
        if self.name in WONKY_FIELDS or len(self.subfields) > 0:
            # XXX: ignore subfields for now.
            return

        zig_type = (
            "f32" if self.scale is not None else _fit_to_zig(self.field_type, types)
        )

        underlying_fit_type = self.field_type
        if self.field_type in types:
            t = types[self.field_type]
            assert isinstance(t, Enum)
            underlying_fit_type = t.base_type

        if underlying_fit_type == "enum":
            underlying_fit_type = "enumeration"

        if underlying_fit_type == "bool":
            # TODO
            # NOTE: bool is not considered a base type. probably implemented as
            # an enum. needs special handling.
            print("        return null;")
            print("    }")
            return

        print(
            f"        assert(@as(decoder.FieldType, rf.?.*.raw_value.scalar) == .{underlying_fit_type});"
        )

        if self.scale or self.offset:
            if self.is_array:
                print(
                    f"        var ret = try allocator.alloc(f32, rf.?.*.raw_value.array.len);"
                )
                print(f"        for (rf.?.*.raw_value.array,0..) |raw_value, i| {{")
                print(
                    f"            const f: f32 = @floatFromInt(raw_value.{underlying_fit_type});"
                )
                print(
                    f"            ret[i] = (f / {self.scale if self.scale is not None else 1.0}) - {self.offset if self.offset is not None else 0};"
                )
                print("        }")
                print("        return ret;")
            else:
                print(
                    f"        const f: f32 = @floatFromInt(rf.?.*.raw_value.scalar.{underlying_fit_type});"
                )
                print(
                    f"        return (f / {self.scale if self.scale is not None else 1.0}) - {self.offset if self.offset is not None else 0};"
                )
        else:
            if self.is_array:
                print(
                    f"        var ret = try allocator.alloc({_fit_to_zig(self.field_type, types)}, rf.?.*.raw_value.array.len);"
                )
                print(f"        for (rf.?.*.raw_value.array,0..) |raw_value, i| {{")
                print(
                    f"            ret[i] = raw_value.{underlying_fit_type};"
                )
                print("        }")
                print("        return ret;")
            elif underlying_fit_type == "string":
                print(
                    f"        return try allocator.dupeSentinel(u8, rf.?.*.raw_value.scalar.{underlying_fit_type}, 0);"
                )
            elif underlying_fit_type != self.field_type:
                print(
                    f"        return @enumFromInt(rf.?.*.raw_value.scalar.{underlying_fit_type});"
                )
            else:
                print(
                    f"       return rf.?.*.raw_value.scalar.{underlying_fit_type};"
                )

        print("    }")

    def needs_allocator(self):
        return self.field_type == "string" or self.is_array

    def ignored(self, types: dict):
        return any(
            (
                self.field_type == "bool",
                len(self.components) > 0,
                len(self.subfields) > 0,
            )
        )


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
            component_scales = list(map(_parse_scale, row.scale.split(",")))

        component_offsets = [None for _ in component_names]
        if "," in row.offset:
            component_offsets = list(map(int, row.offset.split(",")))

        assert len(component_names) == 0 or (
            len(component_scales)
            == len(component_widths)
            == len(component_names)
            == len(component_offsets)
        )

        components = [
            Component(name=name, width=width, scale=scale, offset=offset)
            for name, width, scale, offset in zip(
                component_names, component_widths, component_scales, component_offsets
            )
        ]

        # XXX: see _fit_to_zig
        field_type = "uint32" if "date_time" in row.field_type else row.field_type

        if len(row.field_id) > 0:
            self.fields.append(
                Field(
                    field_id=int(row.field_id),
                    name=row.field_name,
                    field_type=field_type,
                    is_array=len(row.array) > 0,
                    comment=row.comment,
                    scale=(
                        _parse_scale(row.scale)
                        if len(row.scale) > 0 and "," not in row.scale
                        else None
                    ),
                    offset=(
                        int(row.offset)
                        if len(row.offset) > 0 and "," not in row.offset
                        else None
                    ),
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
                    field_type=field_type,
                    components=components,
                )
            )

    def render(self, types: dict):
        zig_name = _snake_to_pascal(self.name)
        if len(self.comment) > 0:
            print(f"/// {self.comment}")

        print(f"pub const {zig_name} = struct {{")
        print(f"    raw_fields: []const decoder.FieldData,\n")
        self._render_getters(types)
        print()
        self._render_constructor(types)
        print("};")

    def _need_allocator(self, types: dict):
        return any(
            field.needs_allocator() and not field.ignored(types)
            for field in self.fields
        )

    def _render_field_defs(self, types: dict):
        for field in self.fields:
            field.render_def(types)

    def _render_getters(self, types: dict):
        for field in self.fields:
            print()
            field.render_getter(_snake_to_pascal(self.name), types)

    def _render_constructor(self, types: dict):
        zig_name = _snake_to_pascal(self.name)
        print(
            f"    pub fn fromRawFields(raw_fields: []const decoder.FieldData) {zig_name} {{"
        )
        print(f"       return {zig_name}{{.raw_fields=raw_fields}};")
        print("    }")


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
    print('const std = @import("std");')
    print(f'const decoder = @import("../decoder.zig");')
    print("const assert = std.debug.assert;")
    types = {}
    for path in sys.argv[1:]:
        with open(path, "r") as f:
            read_profile(f, types)

    for typ in types.values():
        print()
        typ.render(types)

    print()
    print("const Message = union(MesgNum) {")
    for name, typ in types.items():
        if isinstance(typ, Message):
            original_name = name.removesuffix("_message")
            zig_name = _snake_to_pascal(name)
            print(f"    {original_name}: {zig_name},")

    print("};")
