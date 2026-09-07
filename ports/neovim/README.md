# 🫐 Blueberry Peach NeoVim 🍑

Handcrafted dark *and* light neovim color scheme with legibility and consistency in mind.

> [!NOTE]
> For palettes, other ports, contribution info, etc. see [blueberry-peach on GitHub](https://github.com/schemar/blueberry-peach).

Based on, but does not require [catppuccin/nvim](https://github.com/catppuccin/nvim).
Supports almost all integrations that catppuccin includes.

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

1. Clone blueberry peach
2. Symlink the color scheme into neovim:
   ```bash
   mkdir -p ~/.local/share/nvim/site/pack/themes/start
   ln -s /path/to/blueberry-peach.nvim/ports/neovim ~/.local/share/nvim/site/pack/themes/start/blueberry-peach
   ```

## Usage

1. Set the colorscheme in your `init.lua`:
   ```lua
   vim.cmd([[colorscheme blueberry-peach]])
   ```
2. (Optional) Set the colorscheme for [lualine](https://github.com/nvim-lualine/lualine.nvim):
   ```lua
   require('lualine').setup({
     options = {
        theme = 'blueberry-peach'
     }
   })
   ```

> [!NOTE]
>
> The theme should automatically select the light or dark variant based on your terminal setup.
>
> If you want to set the variant explicitly, use `:set background=dark` or `:set background=light` or set it from your `init.lua`.

## Standing on the shoulders of giants

The color schemes are based on and/or utilize code from the following projects (see [LICENSES](./LICENSES)):

- [Catppuccin](https://github.com/catppuccin/catppuccin)
- [Rosé Pine](https://github.com/rose-pine/rose-pine-theme)
