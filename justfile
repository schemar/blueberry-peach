default: help

# List available recipes
help:
    just --list --unsorted

build:
    ./build.lua

from_catppuccin input_file output_file:
    ./from_catppuccin.lua {{ input_file }} {{ output_file }}
