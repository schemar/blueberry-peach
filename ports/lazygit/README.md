# 🫐 lazygit 🍑

BlueberryPeach for [lazygit](https://github.com/jesseduffield/lazygit).

## Installation

1. Replace the theme section of `<config-dir>/config.yml` with the theme you want to use (light or dark).
   - The config directory is usually `$HOME/.config/lazygit/` or `/Users/<username>/Library/Application Support/lazygit`.
   - Find the theme you want in `./blueberry_peach_dark.yml` or `./blueberry_peach_light.yml`.
2. Close and re-open lazygit to see your new theme!

### Alternative

As an alternative, you can clone this repo and reference the theme files directly when launching lazygit.
You could add an alias to your shell config.

```bash
lazygit --use-config-file="<config-dir>/config.yml,path/to/blueberry_peach_light.yml"
```

As an _alternative_ you can use the `LG_CONFIG_FILE` environment variable.

See also [lazygit's documentation](https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md) for help.
