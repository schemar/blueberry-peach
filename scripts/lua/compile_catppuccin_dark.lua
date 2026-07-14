local compiler = require("compile_catppuccin")

local lines = compiler.compile("dark")
local out = "../ports/neovim/lua/blueberry-peach/dark.lua"

vim.fn.writefile(lines, out)
