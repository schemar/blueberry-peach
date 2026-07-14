default: help

# List available recipes
help:
    just --list --unsorted

# Create ports files from templates
build:
    ./scripts/build.lua
    ./scripts/build_nvim.sh

# Replace catppuccin colors with their names in a file
from_catppuccin input_file output_file:
    ./scripts/from_catppuccin.lua {{ input_file }} {{ output_file }}
