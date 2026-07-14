local variant = (vim.o.background == "light" and "light" or "dark")
local mod = "blueberry-peach.lualine_" .. variant
package.loaded[mod] = nil
return require(mod)
