#!/usr/bin/env python3
import csv
import sys
from dataclasses import dataclass

@dataclass
class Enum:
    name: str
    base_type: str
    values: tuple(str, int)

@dataclass
class Field:
    field_id: int
    name: str
    field_type: str

@dataclass
class Message:
    name: str


def main(profile_f):
    reader = csv.reader(profile_f)

    # skip the header
    next(reader)

    for row in reader:
        if row[0:2] == ['', '']:
            continue

        print(row)


if __name__ == "__main__":
    with open(sys.argv[1], "r") as f:
        main(f)
