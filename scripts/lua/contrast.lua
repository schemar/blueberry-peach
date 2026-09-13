-- The accents, in display order. Kept separate from `colors` because only the
-- accents are compared against each other, and the surfaces are what we measure
-- contrast *against*, so they are not rows in the contrast table.
local accents = {
  "red", "orange", "yellow", "green", "teal", "blue", "violet", "pink",
}

local contrast_colors = {
  "red", "orange", "yellow", "green", "teal", "blue", "violet", "pink",
  "text", "subtext", "dimmed",
}

local function channels(hex)
  local r, g, b = hex:match("^#(%x%x)(%x%x)(%x%x)$")
  assert(r, "Not a hex color: " .. tostring(hex))
  return tonumber(r, 16) / 255, tonumber(g, 16) / 255, tonumber(b, 16) / 255
end

local function linearize(channel)
  if channel <= 0.04045 then
    return channel / 12.92
  end
  return ((channel + 0.055) / 1.055) ^ 2.4
end

-- https://www.w3.org/WAI/GL/wiki/Relative_luminance
local function luminance(hex)
  local r, g, b = channels(hex)
  r, g, b = linearize(r), linearize(g), linearize(b)
  return 0.2126 * r + 0.7152 * g + 0.0722 * b
end

-- WCAG contrast ratio, from 1 (identical) to 21 (black on white).
local function contrast(foreground, background)
  local lighter, darker = luminance(foreground), luminance(background)
  if lighter < darker then
    lighter, darker = darker, lighter
  end
  return (lighter + 0.05) / (darker + 0.05)
end

-- Lowest and highest contrast of any accent against the palette's background.
local function accent_range(palette)
  local lowest, highest = math.huge, -math.huge
  for _, accent in ipairs(accents) do
    local ratio = contrast(palette[accent], palette.background)
    lowest, highest = math.min(lowest, ratio), math.max(highest, ratio)
  end
  return lowest, highest
end

local contrast_row = "<tr><td>%s</td><td>%.2f</td><td>%.2f</td></tr>\n"

local contrast_summary = [[

Contrast is the [WCAG 2.1 contrast ratio](https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html)
of each color against its variant's `background`.
The eight accents span %.2f–%.2f in light mode and %.2f–%.2f in dark mode,
a spread of %.2f and %.2f respectively.
]]

local function contrast_table(palettes)
  local rows = {
    "<table>\n",
    "<thead>\n",
    "<tr><th>Color</th><th>Light</th><th>Dark</th></tr>\n",
    "</thead>\n",
    "<tbody>\n",
  }

  for _, color in ipairs(contrast_colors) do
    rows[#rows + 1] = contrast_row:format(
      color,
      contrast(palettes.light[color], palettes.light.background),
      contrast(palettes.dark[color], palettes.dark.background)
    )
  end

  local light_low, light_high = accent_range(palettes.light)
  local dark_low, dark_high = accent_range(palettes.dark)

  rows[#rows + 1] = "</tbody>\n"
  rows[#rows + 1] = "</table>\n"

  rows[#rows + 1] = "<p>\n"
  rows[#rows + 1] = contrast_summary:format(
    light_low, light_high, dark_low, dark_high,
    light_high - light_low, dark_high - dark_low
  )
  rows[#rows + 1] = "</p>\n"

  return table.concat(rows)
end

return {
  contrast_table = contrast_table
}
