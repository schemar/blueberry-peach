default: help

# List available recipes
help:
    just --list --unsorted

# Create ports files from templates
build:
    ./scripts/build.lua

build-nvim:
    ./scripts/build_nvim.sh

build-all: build build-nvim

# Replace blueberry peach dark colors with their names in a file
from-blueberry-peach-dark input_file output_file:
    ./scripts/from_blueberry_peach_dark.lua {{ input_file }} {{ output_file }}

# Replace catppuccin mocha colors with their names in a file
from-catppuccin input_file output_file:
    ./scripts/from_catppuccin.lua {{ input_file }} {{ output_file }}

# Replace catppuccin color names with blueberry peach color names
catppuccin-to-blueberry-peach input_file output_file:
    ./scripts/catppuccin_to_blueberry_peach.lua {{ input_file }} {{ output_file }}

# Convert a catppuccin theme file to a blueberry peach template
catppuccin-to-template input_file output_file: (from-catppuccin input_file output_file) (catppuccin-to-blueberry-peach output_file output_file)
