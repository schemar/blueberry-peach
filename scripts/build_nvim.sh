#!/usr/bin/env bash

set -exuo pipefail
cd "$(dirname "$0")"

CATPPUCCIN_REF="${CATPPUCCIN_REF:-"05e8787020dcfdb937bf2ff23855ea2415b4e072"}"
CATPPUCCIN_DIR="${CATPPUCCIN_DIR:-"../dependencies/catppuccin"}"

if [ ! -d "$CATPPUCCIN_DIR" ]; then
  git clone --depth 1 https://github.com/catppuccin/nvim.git "$CATPPUCCIN_DIR"
fi

cd "$CATPPUCCIN_DIR"
git switch main
git pull
git checkout "$CATPPUCCIN_REF"
cd -

nvim --headless --clean --cmd "set runtimepath^=$PWD/$CATPPUCCIN_DIR" \
  --cmd "set runtimepath+=$PWD" \
  -l lua/compile_catppuccin_light.lua

nvim --headless --clean --cmd "set runtimepath^=$PWD/$CATPPUCCIN_DIR" \
  --cmd "set runtimepath+=$PWD" \
  -l lua/compile_catppuccin_dark.lua
