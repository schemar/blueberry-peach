local compiler = require("compile_catppuccin")

local lines = compiler.compile("dark")
local out = "../ports/neovim/lua/blueberry-peach/dark.lua"

vim.fn.writefile(lines, out)

-- lualine special handling:
local lualine_out = "../ports/neovim/lua/blueberry-peach/lualine_dark.lua"
local body = compiler.compile_lualine("dark")
vim.fn.writefile(vim.split(body, "\n"), lualine_out)
