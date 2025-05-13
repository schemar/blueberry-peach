# 🫐 tmux 🍑

BlueberryPeach for [tmux](https://github.com/tmux/tmux).

Requires [catppuccin/tmux](https://github.com/catppuccin/tmux).

## Installation

Decide whether you want to use `blueberry_peach_dark` or `blueberry_peach_light`.

1. Install [catppuccin/tmux](https://github.com/catppuccin/tmux).
2. Copy the `.conf` files from this directory into your `~/.config/tmux` directory or somewhere else from where you want to source it with `tmux`.
   - Alternatively, you can clone this repository and source the file directly.
3. **Before** sourcing the `catppuccin` theme, source BlueberryPeach's `.conf` file.
   - Example:
   ```tmux
   source-file /path/to/blueberry_peach_dark.conf
   ```

> [!NOTE]
> You can still overwrite colors by setting them **before** sourcing BlueberryPeach's `.conf` file.
