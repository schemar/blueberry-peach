local M = {}
M.setup = function(variant)
  local ok = pcall(require, "catppuccin")
  assert(ok, "Failed to load catppuccin theme")

  local color_overrides = function()
    package.path = package.path .. ";./?.lua"
    local blueberry_peach = require(variant)

    -- convert to use all catppuccin color names instead:
    local catppuccin_names_to_blueberry_peach_colors = {}
    local catppuccin_names_to_blueberry_peach_names = require("map_catppuccin_blueberry_peach")
    for catppuccin_name, blueberry_peach_name in pairs(catppuccin_names_to_blueberry_peach_names) do
      catppuccin_names_to_blueberry_peach_colors[catppuccin_name] =
        blueberry_peach[blueberry_peach_name]
    end

    return catppuccin_names_to_blueberry_peach_colors
  end

  local highlight_overrides = function(colors)
    return {
      -- surface0 and 1 is used as a background color most of the time,
      -- but also as a foreground color in some cases. This makes it
      -- impossible to ensure contrast in all cases.
      -- For this reason, we replace all surface foreground colors with
      -- other surface colors to increase contrast.
      -- (surface2 is a rare color which is exclusively used as a
      -- foreground color)
      --
      -- surface0:
      SnacksIndent = { fg = colors.surface1 },
      IblIndent = { fg = colors.surface1 },

      -- surface1:
      SignColumn = { fg = colors.surface2 }, -- column where |signs| are displayed
      SignColumnSB = { fg = colors.surface2 }, -- column where |signs| are displayed

      LineNr = { fg = colors.surface2 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' o…
      TreesitterContextLineNumber = { fg = colors.surface2 },
      CursorLineNr = { fg = colors.blue }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.

      DapUIUnavailable = { fg = colors.surface2 },

      GitSignsCurrentLineBlame = { fg = colors.surface2 },

      -- More contrast menus:
      Pmenu = { bg = colors.mantle, fg = colors.overlay2 }, -- Popup menu: normal item.
      PmenuSel = { bg = colors.surface1, style = { "bold" } }, -- Popup menu: selected item.

      -- More contrast for window separator:
      WinSeparator = { fg = colors.surface2 }, -- Separator between windows.
    }
  end

  require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    color_overrides = { mocha = color_overrides() },
    highlight_overrides = { mocha = highlight_overrides },
    transparent_background = false,
    integrations = {
      aerial = true,
      alpha = true,
      artio = true,
      barbar = true,
      beacon = true,
      blink_cmp = { style = "bordered" },
      blink_indent = true,
      blink_pairs = true,
      buffon = true,
      cmp = true,
      coc_nvim = true,
      copilot_vim = true,
      dap = true,
      dap_ui = true,
      dashboard = true,
      diffview = true,
      fern = true,
      fidget = true,
      flash = true,
      fzf = true,
      gitgraph = true,
      gitgutter = true,
      gitsigns = true,
      grug_far = true,
      harpoon = true,
      headlines = true,
      hop = true,
      illuminate = {
        enabled = true,
        lsp = true,
      },
      indent_blankline = {
        enabled = true,
      },
      leap = true,
      lightspeed = true,
      lsp_saga = true,
      lsp_trouble = true,
      markdown = true,
      markview = true,
      mason = true,
      mini = { enabled = true },
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
          ok = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
          ok = { "underline" },
        },
        inlay_hints = {
          background = true,
        },
      },
      navic = true,
      neotree = true,
      neogit = true,
      neotest = true,
      noice = true,
      notifier = true,
      notify = true,
      nvim_surround = true,
      nvimtree = true,
      octo = true,
      overseer = true,
      pounce = true,
      rainbow_delimiters = true,
      render_markdown = true,
      sandwich = true,
      signify = true,
      snacks = { enabled = true },
      telekasten = true,
      telescope = { enabled = true },
      treesitter = true,
      treesitter_context = true,
      ts_rainbow = true,
      ts_rainbow2 = true,
      ufo = true,
      vim_sneak = true,
      vim_wiki = true,
      which_key = true,
      window_picker = true,
    },
  })
end

M.compile = function(variant)
  M.setup(variant)

  local orig = loadstring or load
  local captured
  _G.loadstring = function(s, ...)
    captured = s
    return orig(s, ...)
  end

  local compiler = require("catppuccin.lib.compiler")
  if not pcall(compiler.compile, "mocha") then
    compiler.compile()
  end

  _G.loadstring = orig
  assert(captured, "Failed to capture compiled theme")

  local lines = {}
  for _, line in ipairs(vim.split(captured, "\n")) do
    if
      not line:match("vim%.o%.background")
      and not line:match("colors_name")
      and not line:match("return string%.dump%(function%(flavour%)")
      and not line:match("end, true%)")
    then
      lines[#lines + 1] = line
    end
  end

  table.sort(lines, function(left, right)
    if string.match(left, "^vim") and not string.match(right, "^vim") then
      return true
    elseif not string.match(left, "^vim") and string.match(right, "^vim") then
      return false
    elseif string.match(left, "^local") and not string.match(right, "^local") then
      return true
    elseif not string.match(left, "^local") and string.match(right, "^local") then
      return false
    end

    return left < right
  end)

  return lines
end

M.compile_lualine = function(variant)
  M.setup(variant)

  local ok, theme = pcall(require("catppuccin.utils.lualine"), "mocha")
  assert(ok, "Failed to load catppuccin lualine util")
  local body = "return " .. vim.inspect(theme)

  return body
end

return M
