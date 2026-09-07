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

push:
    #!/usr/bin/env bash

    set -euo pipefail

    function abort () {
      echo "ERROR: $1" >&2
      exit 1
    }

    echo "Building ports ..."
    just build-all >/dev/null 2>&1

    # Make sure there are no uncommitted changes lingering around:
    git add . && git diff --quiet && git diff --cached --quiet || abort "There are uncommitted changes"

    if ! git config remote.origin.url >/dev/null 2>&1; then
      echo "Adding missing git remote 'origin' ..."
      git remote add origin git@github.com:schemar/blueberry-peach.git
    fi

    if ! git config remote.origin-nvim.url >/dev/null 2>&1; then
      echo "Adding missing git remote 'nvim' ..."
      git remote add origin-nvim git@github.com:schemar/blueberry-peach.nvim.git
    fi

    echo "Pushing to blueberry-peach ..."
    git push origin

    echo "Pushing to blueberry-peach.nvim ..."
    git subtree push --prefix ports/neovim origin-nvim main
