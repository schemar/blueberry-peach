default: help

# List available recipes
help:
  just --list --unsorted

build:
  ./build.lua
