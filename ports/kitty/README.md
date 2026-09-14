# 🫐 Kitty 🍑

BlueberryPeach for [kitty](https://github.com/kovidgoyal/kitty).

## Installation

Either copy/paste the values into your config or copy the whole files.

### Copy/Pasting the Values

Open `./blueberry_peach_dark.conf` or `./blueberry_peach_light.conf` and copy
paste its content into the [kitty configuration file].

### Copy the whole Files

Copy or symlink both `./blueberry_peach_dark.conf` and `./blueberry_peach_light.conf`
into your [kitty theme directory]. It is usually located at `~/.config/kitty/themes/`.

Once you copied the files, you can use kitty's theme selector by running `kitty +kitten themes --reload-in=all`.

### Change Color Themes automatically when the OS switches between Light and Dark

To [change color themes automatically when the OS switches between light and dark](https://sw.kovidgoyal.net/kitty/kittens/themes/#change-color-themes-automatically-when-the-os-switches-between-light-and-dark),
copy or symlink the theme files as follows (assuming your [kitty configuration directory] is `~/.config/kitty/`):

- `~/.config/kitty/dark-theme.auto.conf -> blueberry_peach_dark.conf`
- `~/.config/kitty/light-theme.auto.conf -> blueberry_peach_light.conf`
- `~/.config/kitty/no-preference-theme.auto.conf -> blueberry_peach_light.conf`

[kitty configuration file]: https://sw.kovidgoyal.net/kitty/conf/
[kitty configuration directory]: https://sw.kovidgoyal.net/kitty/conf/
[kitty theme directory]: https://sw.kovidgoyal.net/kitty/kittens/themes/#using-your-own-themes
