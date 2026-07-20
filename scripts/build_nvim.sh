#!/usr/bin/env bash

set -exuo pipefail
cd "$(dirname "$0")"

CATPPUCCIN_REF="${CATPPUCCIN_REF:-"05e8787020dcfdb937bf2ff23855ea2415b4e072"}"
CATPPUCCIN_DIR="${CATPPUCCIN_DIR:-"../dependencies/catppuccin"}"

if [ -d "$CATPPUCCIN_DIR" ]; then
  rm -rf "$CATPPUCCIN_DIR"
fi

git clone --revision="${CATPPUCCIN_REF}" https://github.com/catppuccin/nvim.git "$CATPPUCCIN_DIR"

nvim --headless --clean --cmd "set runtimepath^=$PWD/$CATPPUCCIN_DIR" \
  --cmd "set runtimepath+=$PWD" \
  -l lua/compile_catppuccin_light.lua

nvim --headless --clean --cmd "set runtimepath^=$PWD/$CATPPUCCIN_DIR" \
  --cmd "set runtimepath+=$PWD" \
  -l lua/compile_catppuccin_dark.lua
