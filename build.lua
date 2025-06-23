#!/usr/bin/env lua

local blueberry_peach_light = {
  red = "#C34165",
  maroon = "#C34165",
  yellow = "#8A7400",
  peach = "#AC591C",
  green = "#288043",
  teal = "#007E7D",
  sky = "#007E7D",
  sapphire = "#007E7D",
  blue = "#1675AB",
  lavender = "#1675AB",
  mauve = "#6A67B4",
  pink = "#6A67B4",
  flamingo = "#A352A0",
  rosewater = "#A352A0",
  text = "#706F7A",
  subtext1 = "#757480",
  subtext0 = "#757480",
  overlay2 = "#797985",
  overlay1 = "#7E7D8A",
  overlay0 = "#84828F",
  surface2 = "#9C8282",
  surface1 = "#EBDFD3",
  surface0 = "#EBDFD3",
  base = "#FAF4ED",
  mantle = "#FCF9F5",
  crust = "#FCF9F5",
  id = "light",
  name = "Blueberry Peach Light",
}

local blueberry_peach_dark = {
  red = "#DF8BA0",
  maroon = "#DF8BA0",
  yellow = "#C7B96F",
  peach = "#C79A76",
  green = "#75B087",
  teal = "#5EB1AF",
  sky = "#5EB1AF",
  sapphire = "#5EB1AF",
  blue = "#7AA8CE",
  lavender = "#7AA8CE",
  mauve = "#A19DD4",
  pink = "#A19DD4",
  flamingo = "#C394C2",
  rosewater = "#C394C2",
  text = "#A2A2A9",
  subtext1 = "#878794",
  subtext0 = "#878794",
  overlay2 = "#7D7D7D",
  overlay1 = "#808084",
  overlay0 = "#84848C",
  surface2 = "#7C7992",
  surface1 = "#2D2B37",
  surface0 = "#2D2B37",
  base = "#191724",
  mantle = "#0B0A0F",
  crust = "#0B0A0F",
  id = "dark",
  name = "Blueberry Peach Dark",
}

local blueberry_peach_dark_dimmed = {
  red = "#BF657B",
  maroon = "#BF657B",
  yellow = "#91812C",
  peach = "#A67753",
  green = "#578D67",
  teal = "#278F8E",
  sky = "#278F8E",
  sapphire = "#278F8E",
  blue = "#5188A6",
  lavender = "#5188A6",
  mauve = "#7E7ABA",
  pink = "#7E7ABA",
  flamingo = "#A370A1",
  rosewater = "#A370A1",
  text = "#7F7F91",
  subtext1 = "#797985",
  subtext0 = "#797985",
  overlay2 = "#6E6E6E",
  overlay1 = "#717175",
  overlay0 = "#76767D",
  surface2 = "#6A677E",
  surface1 = "#29263A",
  surface0 = "#29263A",
  base = "#191724",
  mantle = "#0B0A0F",
  crust = "#0B0A0F",
  id = "dark-dimmed",
  name = "Blueberry Peach Dark Dimmed",
}

local blueberry_peach_palette = {
  red = "red", -- #C34165
  yellow = "yellow", -- #8A7400
  orange = "peach", -- #AC591C
  green = "green", -- #288043
  teal = "teal", -- #007E7D
  blue = "blue", -- #1675AB
  violet = "mauve", -- #6A67B4
  pink = "flamingo", -- #A352A0
  text = "text", -- #5B5B5B
  subtext = "subtext1", -- #908A84
  overlay2 = "overlay2", -- #707070
  overlay1 = "overlay1", -- #646464
  overlay0 = "overlay0", -- #585858
  dimmed = "surface2", -- #9C8282
  surface2 = "surface1", -- #e8dfd4
  surface1 = "surface0", -- #f1ece5
  background = "base", -- #faf4ed
  surface0 = "mantle", -- #FFFAF0
}

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
    source = "./templates/neovim/blueberry_peach.lua",
    target = "./ports/neovim/blueberry_peach_light.lua",
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
    source = "./templates/neovim/blueberry_peach.lua",
    target = "./ports/neovim/blueberry_peach_dark.lua",
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
    source = "./templates/zsh_syntax_highlighting/blueberry_peach.sh",
    target = "./ports/zsh_syntax_highlighting/blueberry_peach_dark-syntax-highlighting.sh",
    colors = blueberry_peach_dark,
  },
}

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

for blueberry_color, catppuccin_color in pairs(blueberry_peach_palette) do
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
