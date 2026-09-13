# Welcome to BlueberryPeach's Contributions Guide

Thank you so much for looking into contributing! ❤️

Requirements:
- [Lua] is a requirement in order to be able to run the build
scripts.
- If you want to work on the NeoVim port, you also need NeoVim.
- [just] is beneficial to run simple commands from the [justfile](./justfile).

Table of contents:
- [General Information](#general-information)
- [Adding a Port](#adding-a-port)
  - [Porting a Catppuccin Port](#porting-a-catppuccin-port)
- [Updating a Port](#updating-a-port)
  - [Updating the NeoVim Port](#updating-the-neovim-port)
  - [Updating any other Port](#updating-any-other-port)
- [Updating the Palette](#updating-the-palette)

## General Information

Each port consists of its template and its port files, which are mostly a README and the dark and light mode theme files.

The templates are located in `./templates/<port-name>` and the ports in `./ports/<port-name>`.
Each template contains placeholder colors from the BlueberryPeach palette, like for example `{{background}}` or `{{teal}}`.
A script in [./scripts/build.lua](./scripts/build.lua) converts the templates to their port's theme files.

The [main README] has a ports section, which links to all ports.

The [NeoVim port](./ports/neovim) is special, as its theme is not built from a template, but from catppuccin inside NeoVim
NeoVim's subdirectory is also its own repository at https://github.com/schemar/blueberry-peach.nvim so that it is easy to include BlueberryPeach inside NeoVim like any other plugin.

You can look at existing ports if you want to understand better how BlueberryPeach works.

## Adding a Port

To add a new port, you need to create the following directories and files:

```
blueberry-peach
├── ports
│   └── <port-name>
│       └── README.md
└── templates
    └── <port-name>
        └── blueberry_peach
```

- The README's content and structure should follow the other ports' README files.
- The template file should have the appropriate file extension, for example `blueberry_peach.toml`.
- The content of the template file is a valid file for the desired port, where each color value is set as `{{color_name}}` from the BlueberryPeach palette, for example `{{background}}` or `{{red}}`.

Once the above structure is in place, add the new port to the `ports` table in [./scripts/build.lua](./scripts/build.lua).
The `dark` and `light` values define the file names of the light and dark mode files of the port.
Optionally, you can set the `transform` value to a function, if your port does not require color values of the type `#RRGGBB`.

Once everything is in place, build the port from the template:
   - `just build` *or*
   - Run the script from the shell if you don't have [just] available:
     ```bash
     scripts/build.lua
     ```

Now add the new port to the "ports" section of the [main README].

Commit all the files, including templates, ports, and the [main README]. Then create a pull request.

### Porting a Catppuccin Port

If a [catppuccin] port already exists for your BlueberryPeach port, you can transform it, *if* the catppuccin port consists of a file or files with catppuccin colors.
It's not that easy if the catppuccin port is built by the end user, as is the case with NeoVim for example.

If you have a [catppuccin] theme file, you do the same things you would do to create a new port from scratch, but you can generate the template file:

Create the same directory and file structure as described above, except that you don't create a `templates/<port-name>/blueberry_peach` template file.
Instead:

1. Download the [catppuccin] mocha theme file.
   - If there are different color flavors, prefer `Lavender`.
2. Convert the [catppuccin] theme file to a BlueberryPeach template:
   ```shell
   just catppuccin-to-template <path-to-catppuccin-mocha-file> templates/<port-name>/blueberry_peach
   ```
   - The template file should have the appropriate file extension, for example `blueberry_peach.toml`.
3. Check the generated template for correctness.

Then follow the same steps as a general port to build and commit the port from the auto-generated template.

## Updating a Port

### Updating the NeoVim Port

The NeoVim port is built from [catppuccin/nvim].
The build script is [./scripts/build_nvim.sh](./scripts/build_nvim.sh).
The main work happens inside `./scripts/lua/compile_catppuccin.lua`, `./scripts/lua/compile_catppuccin_dark.lua`, and `./scripts/lua/compile_catppuccin_light.lua`

Basically, it:

1. Downloads [catppuccin/nvim].
2. Starts NeoVim.
3. Invokes catppuccin's compiler with color and highlight overrides.
4. Writes the resulting theme to [the directory of NeoVim's port](./ports/neovim).

To update the NeoVim port, you need to:

1. Update the build script.
2. Update the port from the updated template:
   - `just build-nvim` *or*
   - Run the script from the shell if you don't have [just] available:
     ```bash
     scripts/build_nvim.sh
     ```
3. Commit the changes including the build script and the built port.
4. Create a pull request.

### Updating any other Port

Each port has a template file in [./templates/<port>](./templates).

To update a port, you need to:

1. Update the template file, for example [./templates/tmux/blueberry_peach.conf](./templates/tmux/blueberry_peach.conf).
2. Update the port from the updated template:
   - `just build` *or*
   - Run the script from the shell if you don't have [just] available:
     ```bash
     scripts/build.lua
     ```
3. Commit the changes including the template and the built port.
4. Create a pull request.

## Updating the Palette

The palettes for light and dark mode are defined in the following files:
- [./scripts/lua/dark.lua](./scripts/lua/dark.lua)
- [./scripts/lua/light.lua](./scripts/lua/light.lua)

In order to update the palette, you need to:

1. Update the dark and/or light mode files.
2. Rebuild all ports from the updated palette:
   - `just build-all` *or*
   - Run the scripts from the shell if you don't have [just] available:
     ```bash
     scripts/build.lua
     scripts/build_nvim.sh
     ```
3. Commit the changes including the palettes and the built ports.

[main README]: ./README.md
[lua]: https://www.lua.org
[just]: https://just.systems
[catppuccin]: https://github.com/catppuccin/catppuccin
[catppuccin/nvim]: https://github.com/catppuccin/nvim
