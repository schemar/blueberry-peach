# 🫐 waybar 🍑

BlueberryPeach for [Waybar](https://github.com/Alexays/Waybar).

## Installation

Because configuring Waybar is so personal, BlueberryPeach does not provide the full styling of all elements. Instead, you can use the provided color palette to setup your Waybar with BlueberryPeach colors.

Use `./blueberry_peach_light.css` or `./blueberry_peach_dark.css` as a base for your Waybar styling.

You can use the provided colors in your styling like this:

```css
/* Use the colors from the provided CSS files: */
@define-color red #DF8BA0;
/* ... */
@define-color surface0 #0B0A0F;

/* Example Waybar styling using BlueberryPeach colors: */
* {
  font-family:
    MonoLisaText,
    Symbols Nerd Font Mono,
    Noto Color Emoji;
  font-size: 11pt;
  font-weight: 400;
}

window#waybar {
  background-color: @surface1;
  color: @text;
  border: none;
}

window#waybar.hidden {
  opacity: 0.2;
}

button {
  /* Avoid rounded borders under each button name */
  border: none;
  border-radius: 0;
}

#workspaces button.focused,
#workspaces button.active {
  border-top: 2px solid @violet;
}

#workspaces button.urgent {
  border-top: 2px solid @red;
}

#mode {
  border-top: 2px solid @blue;
}

#backlight,
#battery,
#bluetooth,
#clock,
#cpu,
#custom-media,
#custom-power,
#custom-weather,
#disk,
#idle_inhibitor,
#memory,
#mode,
#mpd,
#network,
#power-profiles-daemon,
#pulseaudio,
#scratchpad,
#sway-window,
#temperature,
#tray,
#wireplumber,
#workspaces button {
  padding: 0 10px;
  margin: 0 2px;
  color: @text;
  /* So modules don't shift when showing a top border: */
  border-top: 2px solid transparent;
}

/* Clickable: */
#bluetooth:hover,
#custom-power:hover,
#idle_inhibitor:hover,
#network:hover,
#pulseaudio:hover,
#workspaces button:hover {
}

tooltip {
  background-color: @surface0;
  color: @text;
  border: 1px solid @violet;
  border-radius: 0;
  padding: 8px;
  box-shadow: none;
}

tooltip * {
  color: @text;
  box-shadow: none;
}

/* If workspaces is the leftmost module, omit left margin */
.modules-left > widget:first-child > #workspaces {
  margin-left: 0;
}

/* If workspaces is the rightmost module, omit right margin */
.modules-right > widget:last-child > #workspaces {
  margin-right: 0;
}

#battery.charging,
#battery.plugged {
  border-top: 2px solid @green;
}

@keyframes blink {
  to {
    color: @surface0;
    background-color: @text;
  }
}

/* Using steps() instead of linear as a timing function to limit cpu usage */
#battery.critical:not(.charging) {
  border-top: 2px solid @red;
}

#power-profiles-daemon.performance {
  border-top: 2px solid @red;
}

#power-profiles-daemon.balanced {
  border-top: 2px solid @blue;
}

#power-profiles-daemon.power-saver {
  border-top: 2px solid @green;
}

label:focus {
  background-color: @surface0;
}

#network.disconnected {
  border-top: 2px solid @red;
}

#pulseaudio.muted {
  border-top: 2px solid @orange;
}

#wireplumber.muted {
  border-top: 2px solid @orange;
}

#custom-media {
  min-width: 100px;
}

#tray > .passive {
  -gtk-icon-effect: dim;
}

#tray > .needs-attention {
  -gtk-icon-effect: highlight;
  border-top: 2px solid @red;
}

#idle_inhibitor.activated {
  border-top: 2px solid @orange;
}

#mpd.disconnected {
  border-top: 2px solid @red;
}

#mpd.paused {
  border-top: 2px solid @green;
}

#language {
  min-width: 16px;
}

#keyboard-state {
  min-width: 16px;
}

#keyboard-state > label {
  padding: 0 5px;
}

#privacy {
  padding: 0;
}

#privacy-item {
  padding: 0 5px;
}

#privacy-item.screenshare {
  border-top: 2px solid @orange;
}

#privacy-item.audio-in {
  border-top: 2px solid @green;
}

#privacy-item.audio-out {
  border-top: 2px solid @blue;
}
```
