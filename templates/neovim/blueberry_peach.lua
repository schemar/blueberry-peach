local color_overrides = {
  mauve = "{{mauve}}",
  pink = "{{pink}}",
  flamingo = "{{flamingo}}",
  rosewater = "{{rosewater}}",
  red = "{{red}}",
  maroon = "{{maroon}}",
  yellow = "{{yellow}}",
  peach = "{{peach}}",
  green = "{{green}}",
  teal = "{{teal}}",
  sky = "{{sky}}",
  sapphire = "{{sapphire}}",
  blue = "{{blue}}",
  lavender = "{{lavender}}",
  text = "{{text}}",
  subtext1 = "{{subtext1}}",
  subtext0 = "{{subtext0}}",
  overlay2 = "{{overlay2}}",
  overlay1 = "{{overlay1}}",
  overlay0 = "{{overlay0}}",
  surface2 = "{{surface2}}",
  surface1 = "{{surface1}}",
  surface0 = "{{surface0}}",
  base = "{{base}}",
  mantle = "{{mantle}}",
  crust = "{{crust}}",
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
