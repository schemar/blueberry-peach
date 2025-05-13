# 🫐 Wez's Terminal 🍑

BlueberryPeach for [wezterm](https://github.com/wez/wezterm).

## Installation

1. Copy the `.toml` files from this directory into your `~/.config/wezterm/colors`.
   - Alternatively, you can clone this repository and symlink the files.
2. Select the theme in your wezterm config file, usually at `~/.config/wezterm/wezterm.lua`.

   ```lua
   return {
     -- ...your existing config
     color_scheme = "Blueberry Peach Light", -- or "Blueberry Peach Dark"
   }
   ```

   - See [catppuccin/wezterm](https://github.com/catppuccin/wezterm) for alternatives and FAQs.
