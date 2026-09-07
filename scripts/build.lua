#!/usr/bin/env lua

-- Make nix' lua happy:
package.path = package.path .. ";./?.lua"

local blueberry_peach_light = require("scripts.lua.light")
local blueberry_peach_dark = require("scripts.lua.dark")

-- NeoVim is built from catppuccin directly in a separate build file.
local ports = {
  {
    template = "./templates/bat/blueberry_peach.tmTheme",
    dark = "./ports/bat/blueberry_peach_dark.tmTheme",
    light = "./ports/bat/blueberry_peach_light.tmTheme",
  },
  {
    template = "./templates/fuzzel/blueberry_peach.ini",
    dark = "./ports/fuzzel/blueberry_peach_dark.ini",
    light = "./ports/fuzzel/blueberry_peach_light.ini",
    value_transform = function(value)
      -- Lowercase hex; remove leading #
      return string.sub(string.lower(value), 2)
    end,
  },
  {
    template = "./templates/fzf/blueberry_peach.sh",
    dark = "./ports/fzf/blueberry_peach_dark-fzf-colors.sh",
    light = "./ports/fzf/blueberry_peach_light-fzf-colors.sh",
  },
  {
    template = "./templates/ghostty/blueberry_peach",
    dark = "./ports/ghostty/blueberry_peach_dark",
    light = "./ports/ghostty/blueberry_peach_light",
  },
  {
    template = "./templates/helix/blueberry_peach.toml",
    dark = "./ports/helix/blueberry_peach_dark.toml",
    light = "./ports/helix/blueberry_peach_light.toml",
  },
  {
    template = "./templates/lazygit/blueberry_peach.yml",
    dark = "./ports/lazygit/blueberry_peach_dark.yml",
    light = "./ports/lazygit/blueberry_peach_light.yml",
  },
  {
    template = "./templates/mako/blueberry_peach",
    dark = "./ports/mako/blueberry_peach_dark",
    light = "./ports/mako/blueberry_peach_light",
  },
  {
    template = "./templates/sway/blueberry_peach",
    dark = "./ports/sway/blueberry_peach_dark",
    light = "./ports/sway/blueberry_peach_light",
  },
  {
    template = "./templates/swaylock/blueberry_peach.conf",
    dark = "./ports/swaylock/blueberry_peach_dark.conf",
    light = "./ports/swaylock/blueberry_peach_light.conf",
    value_transform = function(value)
      -- Lowercase hex; remove leading #
      return string.sub(string.lower(value), 2)
    end,
  },
  {
    template = "./templates/tmux/blueberry_peach.conf",
    dark = "./ports/tmux/blueberry_peach_dark.conf",
    light = "./ports/tmux/blueberry_peach_light.conf",
  },
  {
    template = "./templates/waybar/blueberry_peach.css",
    dark = "./ports/waybar/blueberry_peach_dark.css",
    light = "./ports/waybar/blueberry_peach_light.css",
  },
  {
    template = "./templates/wezterm/blueberry_peach.toml",
    dark = "./ports/wezterm/blueberry_peach_dark.toml",
    light = "./ports/wezterm/blueberry_peach_light.toml",
  },
  {
    template = "./templates/windows_terminal/blueberry_peach.json",
    dark = "./ports/windows_terminal/blueberry_peach_dark.json",
    light = "./ports/windows_terminal/blueberry_peach_light.json",
  },
  {
    template = "./templates/yazi/blueberry_peach.toml",
    dark = "./ports/yazi/blueberry-peach-dark.yazi/flavor.toml",
    light = "./ports/yazi/blueberry-peach-light.yazi/flavor.toml",
  },
  {
    template = "./templates/zsh_syntax_highlighting/blueberry_peach.sh",
    dark = "./ports/zsh_syntax_highlighting/blueberry_peach_dark-syntax-highlighting.sh",
    light = "./ports/zsh_syntax_highlighting/blueberry_peach_light-syntax-highlighting.sh",
  },
  {
    template = "./templates/zsh_helix_mode/blueberry_peach.sh",
    dark = "./ports/zsh_helix_mode/blueberry_peach_dark-helix-mode.sh",
    light = "./ports/zsh_helix_mode/blueberry_peach_light-helix-mode.sh",
  },
}

local function write_port(content, target, colors, value_transform)
  for key, value in pairs(colors) do
    content = content:gsub("{{" .. key .. "}}", value_transform(value))
  end

  local target_file = io.open(target, "w")
  if target_file == nil then
    print("Error: Could not open target file " .. target_file)
    return
  end
  target_file:write(content)
  target_file:close()
end

local function update_ports()
  for _, port in pairs(ports) do
    local template = io.open(port.template, "r")
    if template == nil then
      print("Error: Could not open template file " .. port.template)
      return
    end
    local content = template:read("*all")
    template:close()

    local value_transform = port.value_transform or function(value)
      return value
    end

    write_port(content, port.dark, blueberry_peach_dark, value_transform)
    write_port(content, port.light, blueberry_peach_light, value_transform)
  end
end

local function update_svgs()
  local file = io.open("./templates/svg/swatch.svg")
  if file == nil then
    print("Error: Could not open template file ./templates/svg/swatch.svg")
    return
  end

  local content = file:read("*all")
  file:close()

  -- `blueberry_peach_light` just to get the names, will actually do light and dark:
  for blueberry_color, _ in pairs(blueberry_peach_light) do
    if blueberry_color == "id" or blueberry_color == "name" then
      goto continue
    end
    local svg = content:gsub("{{color}}", blueberry_peach_light[blueberry_color])
    file = io.open("./assets/light_" .. blueberry_color .. ".svg", "w")
    if file == nil then
      print("Error: Could not open target file " .. "./assets/" .. blueberry_color .. ".svg")
      return
    end
    file:write(svg)
    file:close()

    svg = content:gsub("{{color}}", blueberry_peach_dark[blueberry_color])
    file = io.open("./assets/dark_" .. blueberry_color .. ".svg", "w")
    if file == nil then
      print("Error: Could not open target file " .. "./assets/" .. blueberry_color .. ".svg")
      return
    end
    file:write(svg)
    file:close()

    ::continue::
  end
end

local function add_palette_table(output)
  -- Use dense numerical keys to guarantee order:
  -- (instead of iterating over for example `blueberry_peach_dark`)
  for _, key in ipairs({ "red", "orange", "yellow", "green", "teal", "blue", "violet", "pink", "text", "subtext", "dimmed", "surface1", "background", "surface0" }) do
    if key == "id" or key == "name" then goto continue end

    output[#output + 1] = "    <tr>\n"
    output[#output + 1] = ("      <td>{{key}}</td>\n"):gsub("{{key}}", key)
    output[#output + 1] = ("      <td><img valign='middle' src=\"./assets/light_{{key}}.svg\" /></td>\n"):gsub("{{key}}",
      key)
    output[#output + 1] = ("      <td><code>{{value}}</code></td>\n"):gsub("{{value}}", blueberry_peach_light[key])
    output[#output + 1] = ("      <td><img valign='middle' src=\"./assets/dark_{{key}}.svg\" /></td>\n"):gsub("{{key}}",
      key)
    output[#output + 1] = ("      <td><code>{{value}}</code></td>\n"):gsub("{{value}}", blueberry_peach_dark[key])
    output[#output + 1] = "    </tr>\n"

    ::continue::
  end
  return output
end

local function update_palette_table()
  local readme_file = io.open("./README.md")
  if readme_file == nil then
    print("Error: Could not open README file ./README.md")
    return
  end

  local readme = readme_file:read("*all")
  readme_file:close()

  local is_inside_palette_block = false
  local output = {}
  for line in string.gmatch(readme, "[^\r\n]*[\r\n]?") do
    if string.match(line, "<![-]+ END:palette_table [-]+>") ~= nil then
      is_inside_palette_block = false
      output = add_palette_table(output)
    end

    if not is_inside_palette_block then
      output[#output + 1] = line
    end

    if string.match(line, "<![-]+ BEGIN:palette_table [-]+>") ~= nil then
      -- print the comment first before disabling further output
      is_inside_palette_block = true
    end
  end

  readme_file = io.open("./README.md", "w")
  if readme_file == nil then
    print("Error: Could not open target file ./README.md")
    return
  end
  readme_file:write(table.concat(output))
  readme_file:close()
end

update_ports()
update_svgs()
update_palette_table()
