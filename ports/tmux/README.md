# 🫐 tmux 🍑

BlueberryPeach for [tmux](https://github.com/tmux/tmux).

## Installation

Because configuring tmux is so personal, BlueberryPeach does not provide any styling.
It's just a collection of colors that you can use to style your tmux.

1. Copy the `.conf` files from this directory into your `~/.config/tmux` directory or somewhere else from where you want to source it with `tmux`.
   - Alternatively, you can clone this repository and source the file directly.
2. In your tmux config (for example `~/.config/tmux/tmux.conf`) source BlueberryPeach's `.conf` file.
3. Use the provided colors for your styles.

Simple example:

```tmux
source-file ~/.config/tmux/blueberry_peach_dark.conf

set -g status-style "bg=#{@thm_surface_0},fg=#{@thm_text}"

set -gF window-status-format "#[fg=#{@thm_surface_0},bg=#{@thm_dimmed}] ##I #[fg=#{@thm_text},bg=#{@thm_surface_0}] ##W ##F "
set -gF window-status-current-format "#[fg=#{@thm_surface_0},bg=#{@thm_violet}] ##I #[fg=#{@thm_text},bg=#{@thm_surface_1}] ##W ##F "

set -wgF pane-active-border-style "##{?pane_in_mode,fg=#{@thm_pink},##{?pane_synchronized,fg=#{@thm_violet},fg=#{@thm_pink}}}"
set -wgF pane-border-style "fg=#{@thm_overlay_2}"

set -g message-style "fg=#{@thm_teal},bg=#{@thm_surface_0},align=centre"
set -g message-command-style "fg=#{@thm_teal},bg=#{@thm_surface_0},align=centre"

set -g popup-style "bg=#{@thm_surface_0},fg=#{@thm_text}"
set -g popup-border-style "fg=#{@thm_violet}"

set -g mode-style "bg=#{@thm_surface_1},bold"
set -g clock-mode-colour "#{@thm_violet}"

set -gF status-left "#[bg=#{?client_prefix,blue,default},fg=#{?client_prefix,black,default}]#S#[default] "
```

> [!NOTE]
> You can still overwrite colors by setting them **before** sourcing BlueberryPeach's `.conf` file.
