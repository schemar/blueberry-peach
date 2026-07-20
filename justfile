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

# Replace catppuccin color names with blueberry peach color names
catppuccin_to_blueberry_peach input_file output_file:
    ./scripts/catppuccin_to_blueberry_peach.lua {{ input_file }} {{ output_file }}

# Convert a catppuccin theme file to a blueberry peach template
catppuccin_to_template input_file output_file: (from_catppuccin input_file output_file) (catppuccin_to_blueberry_peach output_file output_file)
