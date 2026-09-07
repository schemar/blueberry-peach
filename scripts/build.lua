#!/usr/bin/env lua

-- Make nix' lua happy:
package.path = package.path .. ";./?.lua"

local palettes = {
  dark = require("scripts.lua.dark"),
  light = require("scripts.lua.light"),
}

-- Colors to render as swatches and list in the README, in display order.
local colors = {
  "red", "orange", "yellow", "green", "teal", "blue", "violet", "pink",
  "text", "subtext", "dimmed", "surface1", "background", "surface0",
}

local function identity(value)
  return value
end

-- Lowercase hex without the leading `#`.
local function bare_hex(value)
  return string.sub(string.lower(value), 2)
end

-- Each port renders `./templates/<name>/<template>` into
-- `./ports/<name>/<variant>`, where variant is the file name for the dark and
-- light theme, respectively.
-- NeoVim is built from catppuccin directly in a separate build file.
local ports = {
  {
    name = "bat",
    template = "blueberry_peach.tmTheme",
    dark = "blueberry_peach_dark.tmTheme",
    light = "blueberry_peach_light.tmTheme"
  },
  {
    name = "fuzzel",
    template = "blueberry_peach.ini",
    dark = "blueberry_peach_dark.ini",
    light = "blueberry_peach_light.ini",
    transform = bare_hex
  },
  {
    name = "fzf",
    template = "blueberry_peach.sh",
    dark = "blueberry_peach_dark-fzf-colors.sh",
    light = "blueberry_peach_light-fzf-colors.sh"
  },
  {
    name = "ghostty",
    template = "blueberry_peach",
    dark = "blueberry_peach_dark",
    light = "blueberry_peach_light"
  },
  {
    name = "helix",
    template = "blueberry_peach.toml",
    dark = "blueberry_peach_dark.toml",
    light = "blueberry_peach_light.toml"
  },
  {
    name = "lazygit",
    template = "blueberry_peach.yml",
    dark = "blueberry_peach_dark.yml",
    light = "blueberry_peach_light.yml"
  },
  {
    name = "mako",
    template = "blueberry_peach",
    dark = "blueberry_peach_dark",
    light = "blueberry_peach_light"
  },
  {
    name = "sway",
    template = "blueberry_peach",
    dark = "blueberry_peach_dark",
    light = "blueberry_peach_light"
  },
  {
    name = "swaylock",
    template = "blueberry_peach.conf",
    dark = "blueberry_peach_dark.conf",
    light = "blueberry_peach_light.conf",
    transform = bare_hex
  },
  {
    name = "tmux",
    template = "blueberry_peach.conf",
    dark = "blueberry_peach_dark.conf",
    light = "blueberry_peach_light.conf",
  },
  {
    name = "waybar",
    template = "blueberry_peach.css",
    dark = "blueberry_peach_dark.css",
    light = "blueberry_peach_light.css",
  },
  {
    name = "wezterm",
    template = "blueberry_peach.toml",
    dark = "blueberry_peach_dark.toml",
    light = "blueberry_peach_light.toml",
  },
  {
    name = "windows_terminal",
    template = "blueberry_peach.json",
    dark = "blueberry_peach_dark.json",
    light = "blueberry_peach_light.json",
  },
  {
    name = "yazi",
    template = "blueberry_peach.toml",
    dark = "blueberry-peach-dark.yazi/flavor.toml",
    light = "blueberry-peach-light.yazi/flavor.toml",
  },
  {
    name = "zsh_syntax_highlighting",
    template = "blueberry_peach.sh",
    dark = "blueberry_peach_dark-syntax-highlighting.sh",
    light = "blueberry_peach_light-syntax-highlighting.sh",
  },
  {
    name = "zsh_helix_mode",
    template = "blueberry_peach.sh",
    dark = "blueberry_peach_dark-helix-mode.sh",
    light = "blueberry_peach_light-helix-mode.sh",
  },
}

local function read_file(path)
  local file = assert(io.open(path, "r"))
  local content = file:read("*all")
  file:close()
  return content
end

local function write_file(path, content)
  local file = assert(io.open(path, "w"))
  file:write(content)
  file:close()
end

-- Replace every `{{key}}` that names a color; leave unknown ones alone.
local function render(template, palette, transform)
  return (template:gsub("{{([%w_]+)}}", function(key)
    local value = palette[key]
    if value == nil then
      return nil
    end
    return transform(value)
  end))
end

local function update_ports()
  for _, port in ipairs(ports) do
    local template = read_file("./templates/" .. port.name .. "/" .. port.template)

    for variant, palette in pairs(palettes) do
      local target = "./ports/" .. port.name .. "/" .. port[variant]
      write_file(target, render(template, palette, port.transform or identity))
    end
  end
end

local function update_svgs()
  local template = read_file("./templates/svg/swatch.svg")

  for variant, palette in pairs(palettes) do
    for _, color in ipairs(colors) do
      local svg = template:gsub("{{color}}", palette[color])
      write_file(("./assets/%s_%s.svg"):format(variant, color), svg)
    end
  end
end

local palette_row = [[
    <tr>
      <td>%s</td>
      <td><img valign='middle' src="./assets/light_%s.svg" /></td>
      <td><code>%s</code></td>
      <td><img valign='middle' src="./assets/dark_%s.svg" /></td>
      <td><code>%s</code></td>
    </tr>
]]

local function palette_table()
  local rows = {}
  for _, color in ipairs(colors) do
    rows[#rows + 1] = palette_row:format(
      color, color, palettes.light[color], color, palettes.dark[color]
    )
  end
  return table.concat(rows)
end

local function update_palette_table()
  local path = "./README.md"
  local readme, replaced = read_file(path):gsub(
    "(<!%-+ BEGIN:palette_table %-+>\r?\n).-(<!%-+ END:palette_table %-+>)",
    function(begin_marker, end_marker)
      return begin_marker .. palette_table() .. "    " .. end_marker
    end
  )
  assert(replaced == 1, "Could not find the palette_table markers in " .. path)

  write_file(path, readme)
end

update_ports()
update_svgs()
update_palette_table()
