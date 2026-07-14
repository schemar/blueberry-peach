local compiler = require("compile_catppuccin")

local lines = compiler.compile("light")
local out = "../ports/neovim/lua/blueberry-peach/light.lua"

vim.fn.writefile(lines, out)
