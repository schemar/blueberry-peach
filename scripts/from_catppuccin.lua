#!/usr/bin/env lua

-- Make nix' lua happy:
package.path = package.path .. ";./?.lua"

local map_catppuccin_color_names = require("scripts.lua.map_catppuccin_color_names")

local input_file = arg[1]
local output_file = arg[2]

local file = io.open(input_file, "r")
if file == nil then
  print("Error: Could not open input file " .. input_file)
  return
end

local content = file:read("*all")
file:close()

for name, code in pairs(map_catppuccin_color_names) do
  content = content:gsub(code, "{{" .. name .. "}}")
  content = content:gsub(string.upper(code), "{{" .. name .. "}}")
end

file = io.open(output_file, "w")
if file == nil then
  print("Error: Could not open output file " .. output_file)
  return
end
file:write(content)
file:close()
