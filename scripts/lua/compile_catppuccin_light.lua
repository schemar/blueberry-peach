local compiler = require("compile_catppuccin")

local lines = compiler.compile("light")
local out = "../ports/neovim/lua/blueberry-peach/light.lua"

vim.fn.writefile(lines, out)

-- lualine special handling:
local lualine_out = "../ports/neovim/lua/blueberry-peach/lualine_light.lua"
local body = compiler.compile_lualine("light")
vim.fn.writefile(vim.split(body, "\n"), lualine_out)
