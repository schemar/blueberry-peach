default: help

# List available recipes
help:
    just --list --unsorted

build:
    ./scripts/build.lua

from_catppuccin input_file output_file:
    ./scripts/from_catppuccin.lua {{ input_file }} {{ output_file }}
