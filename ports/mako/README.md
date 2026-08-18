# 🫐 mako 🍑

BlueberryPeach for [mako](https://github.com/emersion/mako).

## Installation

1. Copy the `blueberry_peach_dark` and/or `blueberry_peach_light` file to your mako config directory (usually `~/.config/mako/`).
2. In your mako config file (usually `config`), import the desired BlueberryPeach file (for example `include=~/.config/mako/blueberry_peach_dark`).

## Advanced

If you want to use both dark and light themes, you can add both to your mako config:

```ini
[mode=dark]
include=~/.config/mako/blueberry_peach_dark

[mode=light]
include=~/.config/mako/blueberry_peach_light
```

And switch modes with `makoctl`. Switching to dark mode:

```bash
makoctl mode -a dark -r light
```

See `man 5 mako` for more details on how to configure modes.
