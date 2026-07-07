# 🫐 sway 🍑

BlueberryPeach for [sway](https://github.com/swaywm/sway).

## Installation

1. Copy the `blueberry_peach_*` files from this directory into your sway config directory (`~/.config/sway/`).
2. Include the desired theme in your sway config. For example `include ./blueberry_peach_dark`.
3. Use the colors by name when defining your theme.

## Example Configuration

After including the theme, you can set colors for example like so:

```sway
client.focused $bp_violet $bp_background $bp_text $bp_pink $bp_violet
client.focused_inactive $bp_overlay0 $bp_surface0 $bp_subtext $bp_surface1 $bp_surface1
client.unfocused $bp_surface0 $bp_surface0 $bp_subtext $bp_surface1 $bp_surface1
client.urgent $bp_background $bp_red $bp_text $bp_red $bp_red
client.placeholder $bp_surface0 $bp_background $bp_text $bp_surface0 $bp_surface0
client.background $bp_background
```
