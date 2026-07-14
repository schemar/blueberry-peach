#!/usr/bin/env lua

-- Make nix' lua happy:
package.path = package.path .. ";./?.lua"

local blueberry_peach_light = require("scripts.lua.light")
local blueberry_peach_dark = require("scripts.lua.dark")
local map_blueberry_peach_to_catppuccin = require("scripts.lua.map_blueberry_peach_catppuccin")

-- NeoVim is built from catppuccin directly in a separate build file.
local template_files = {
  {
    source = "./templates/bat/blueberry_peach.tmTheme",
    target = "./ports/bat/blueberry_peach_light.tmTheme",
    colors = blueberry_peach_light,
  },
  {
    source = "./templates/fzf/blueberry_peach.sh",
    target = "./ports/fzf/blueberry_peach_light-fzf-colors.sh",
    colors = blueberry_peach_light,
  },
  {
    source = "./templates/ghostty/blueberry_peach",
    target = "./ports/ghostty/blueberry_peach_light",
    colors = blueberry_peach_light,
  },
  {
    source = "./templates/lazygit/blueberry_peach.yml",
    target = "./ports/lazygit/blueberry_peach_light.yml",
    colors = blueberry_peach_light,
  },
  {
    source = "./templates/sway/blueberry_peach",
    target = "./ports/sway/blueberry_peach_light",
    colors = blueberry_peach_light,
  },
  {
    source = "./templates/tmux/blueberry_peach.conf",
    target = "./ports/tmux/blueberry_peach_light.conf",
    colors = blueberry_peach_light,
  },
  {
    source = "./templates/wezterm/blueberry_peach.toml",
    target = "./ports/wezterm/blueberry_peach_light.toml",
    colors = blueberry_peach_light,
  },
  {
    source = "./templates/zsh_syntax_highlighting/blueberry_peach.sh",
    target = "./ports/zsh_syntax_highlighting/blueberry_peach_light-syntax-highlighting.sh",
    colors = blueberry_peach_light,
  },
  {
    source = "./templates/windows_terminal/blueberry_peach.json",
    target = "./ports/windows_terminal/blueberry_peach_light.json",
    colors = blueberry_peach_light,
  },
  {
    source = "./templates/yazi/blueberry_peach.toml",
    target = "./ports/yazi/blueberry-peach-light.yazi/flavor.toml",
    colors = blueberry_peach_light,
  },
  {
    source = "./templates/bat/blueberry_peach.tmTheme",
    target = "./ports/yazi/blueberry-peach-light.yazi/tmtheme.xml",
    colors = blueberry_peach_light,
  },
  {
    source = "./templates/bat/blueberry_peach.tmTheme",
    target = "./ports/bat/blueberry_peach_dark.tmTheme",
    colors = blueberry_peach_dark,
  },
  {
    source = "./templates/fzf/blueberry_peach.sh",
    target = "./ports/fzf/blueberry_peach_dark-fzf-colors.sh",
    colors = blueberry_peach_dark,
  },
  {
    source = "./templates/ghostty/blueberry_peach",
    target = "./ports/ghostty/blueberry_peach_dark",
    colors = blueberry_peach_dark,
  },
  {
    source = "./templates/lazygit/blueberry_peach.yml",
    target = "./ports/lazygit/blueberry_peach_dark.yml",
    colors = blueberry_peach_dark,
  },
  {
    source = "./templates/sway/blueberry_peach",
    target = "./ports/sway/blueberry_peach_dark",
    colors = blueberry_peach_dark,
  },
  {
    source = "./templates/tmux/blueberry_peach.conf",
    target = "./ports/tmux/blueberry_peach_dark.conf",
    colors = blueberry_peach_dark,
  },
  {
    source = "./templates/wezterm/blueberry_peach.toml",
    target = "./ports/wezterm/blueberry_peach_dark.toml",
    colors = blueberry_peach_dark,
  },
  {
    source = "./templates/windows_terminal/blueberry_peach.json",
    target = "./ports/windows_terminal/blueberry_peach_dark.json",
    colors = blueberry_peach_dark,
  },
  {
    source = "./templates/zsh_syntax_highlighting/blueberry_peach.sh",
    target = "./ports/zsh_syntax_highlighting/blueberry_peach_dark-syntax-highlighting.sh",
    colors = blueberry_peach_dark,
  },
  {
    source = "./templates/yazi/blueberry_peach.toml",
    target = "./ports/yazi/blueberry-peach-dark.yazi/flavor.toml",
    colors = blueberry_peach_dark,
  },
  {
    source = "./templates/bat/blueberry_peach.tmTheme",
    target = "./ports/yazi/blueberry-peach-dark.yazi/tmtheme.xml",
    colors = blueberry_peach_dark,
  },
}

-- Replaces based on catppuccin names in templates:
for _, template_file in pairs(template_files) do
  local file = io.open(template_file.source, "r")
  if file == nil then
    print("Error: Could not open source file " .. template_file.source)
    return
  end

  local content = file:read("*all")
  file:close()

  for key, value in pairs(template_file.colors) do
    content = content:gsub("{{" .. key .. "}}", value)
  end

  file = io.open(template_file.target, "w")
  if file == nil then
    print("Error: Could not open target file " .. template_file.target)
    return
  end
  file:write(content)
  file:close()
end

local file = io.open("./templates/svg/swatch.svg")
if file == nil then
  print("Error: Could not open source file ./templates/svg/swatch.svg")
  return
end

local content = file:read("*all")
file:close()

for blueberry_color, catppuccin_color in pairs(map_blueberry_peach_to_catppuccin) do
  local svg = content:gsub("{{color}}", blueberry_peach_light[catppuccin_color])
  file = io.open("./assets/light_" .. blueberry_color .. ".svg", "w")
  if file == nil then
    print("Error: Could not open target file " .. "./assets/" .. blueberry_color .. ".svg")
    return
  end
  file:write(svg)
  file:close()

  svg = content:gsub("{{color}}", blueberry_peach_dark[catppuccin_color])
  file = io.open("./assets/dark_" .. blueberry_color .. ".svg", "w")
  if file == nil then
    print("Error: Could not open target file " .. "./assets/" .. blueberry_color .. ".svg")
    return
  end
  file:write(svg)
  file:close()
end
