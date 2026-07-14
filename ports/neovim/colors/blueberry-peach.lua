local function apply()
  local variant = (vim.o.background == "light" and "light" or "dark")
  package.loaded["blueberry-peach." .. variant] = nil
  require("blueberry-peach." .. variant)
  vim.g.colors_name = "blueberry-peach"
  vim.api.nvim_exec_autocmds("ColorScheme", { pattern = "blueberry-peach" })
end

apply()

local grp = vim.api.nvim_create_augroup("BlueberryPeach", { clear = true })
vim.api.nvim_create_autocmd("OptionSet", {
  group = grp,
  pattern = "background",
  callback = function()
    if vim.g.colors_name == "blueberry-peach" then
      apply()
    end
  end,
})
