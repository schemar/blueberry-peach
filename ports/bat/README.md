# 🫐 bat 🍑

BlueberryPeach for [bat](https://github.com/sharkdp/bat).

## Installation

1. Create a theme folder in bat's [configuration directory](https://github.com/sharkdp/bat#configuration-file):

   ```bash
   mkdir -p "$(bat --config-dir)/themes"
   ```

2. Copy the `.tmTheme` files from this directory into bat's `themes` directory.
   - Alternatively, you can clone this repository and symlink the files.
3. Rebuild bat's cache:

   ```bash
   bat cache --build
   ```

4. Run `bat --list-themes` and check for BlueberryPeach:

   ```bash
   $ bat --list-themes | grep blueberry
   blueberry_peach_dark
   blueberry_peach_light

   ```

## Usage

There are two ways to get `bat` to default to BlueberryPeach.
For each, decide whether you want to use `blueberry_peach_dark` or `blueberry_peach_light`.

1. Configuration file

   - Edit your `bat` configuration file located at `bat --config-file` (usually `~/.config/bat/config`):

   ```
   --theme="blueberry_peach_dark"
   ```

2. Environment variable
   - Set the `BAT_THEME` environment variable
   - Example: `BAT_THEME="blueberry_peach_dark"`.
