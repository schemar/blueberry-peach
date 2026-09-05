# 🫐 helix 🍑

BlueberryPeach for [helix](https://github.com/helix-editor/helix).

<table>
  <tr>
    <td>
      <a href="./screenshots/light.png">
        <img src="./screenshots/light.png" />
      </a>
    </td>
    <td>
      <a href="./screenshots/dark.png">
        <img src="./screenshots/dark.png" />
      </a>
    </td>
  </tr>
</table>


## Installation

1. Copy `./blueberry_peach_light.toml` and `./blueberry_peach_dark.toml` into helix' theme directory (usually `~/.config/helix/themes/`).
2. Set you theme in helix' config file (usually `~/.config/helix/config.toml`):
   ```toml
   # *One* of:
   theme = "blueberry_peach_dark"
   # *or:*
   theme = "buleberry_peach_light"
   ```

### Switch between dark and light mode

Helix does not support following your system's light/dark mode.
A possible workaround is a symlink `~/.config/helix/theme/blueberry_peach.toml` that points to your dark or light theme, depending on the mode.
You need to find a way to update the symlink, which heavily depends on your individual setup.

### The theme isn't loading or working properly

Make sure the theme is in the correct directory and the `theme` field in your `config.toml` is set correctly.

If the theme is still not working, it may be due to true color support. Make sure your terminal emulator supports true color and is configured correctly. If you are certain that your terminal emulator supports true color, then you can try overriding Helix's true color detection in your config file as follows:

```toml
[editor]
true-color = true
```

If you still can't get the theme to work, please [open an issue](https://github.com/catppuccin/helix/issues)!
