#!/usr/bin/env python3
import csv
import shlex
import sys
from dataclasses import dataclass


def _snake_to_pascal(name: str) -> str:
    parts = name.split("_")
    return "".join(map(lambda p: p.capitalize(), parts))


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
class Field:
    field_id: int
    name: str
    field_type: str
    scale: float
    offset: int
    units: str
    components: list[tuple[str, int]]
    subfields: list[tuple[str, str]]


@dataclass
class Message:
    name: str
    fields: list[Field]

    def handle_row(self, row: list[str]):
        print("MESSAGE", self.name, row)
        assert len(row[2]) > 0 and len(row[3]) > 0


def render_profile(profile_f, types: dict):
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
            assert current.name not in types
            types[current.name] = current
            continue

        if len(row[0]) > 0:
            current = Message(name=row[0], fields=[])
            assert current.name not in types
            types[current.name] = current
            continue

        assert current is not None
        assert len(row[0]) == 0
        current.handle_row(row)

    cmd = shlex.join(sys.argv)
    print("//! This file was generated from a FIT profile. Do not edit by hand.")
    print(f"//! Instead, run this command: '{cmd}'")
    for typ in types.values():
        print()
        typ.render(types)


if __name__ == "__main__":
    types = {}
    for path in sys.argv[1:]:
        with open(path, "r") as f:
            render_profile(f, types)
