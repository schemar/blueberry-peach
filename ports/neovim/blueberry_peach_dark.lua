local color_overrides = {
  mauve = "#8A87B9",
  pink = "#8A87B9",
  flamingo = "#B079AD",
  rosewater = "#B079AD",
  red = "#BF7789",
  maroon = "#BF7789",
  yellow = "#9D8C30",
  peach = "#AB8465",
  green = "#659774",
  teal = "#519897",
  sky = "#519897",
  sapphire = "#519897",
  blue = "#6292AD",
  lavender = "#6292AD",
  text = "#8A8A9E",
  subtext1 = "#878794",
  subtext0 = "#878794",
  overlay2 = "#7D7D7D",
  overlay1 = "#808084",
  overlay0 = "#84848C",
  surface2 = "#7C7992",
  surface1 = "#2D2B37",
  surface0 = "#2D2B37",
  base = "#191724",
  mantle = "#0B0A0F",
  crust = "#0B0A0F",
}

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

local M = {}

---@param flavor "mocha"|"macchiato"|"frappe"|"latte"
---@return table overrides to deep-merge into catppuccin config
function M.get_overrides(flavor)
  return {
    color_overrides = {
      [flavor] = color_overrides,
    },
    highlight_overrides = {
      [flavor] = highlight_overrides,
    },
  }
end

return M
