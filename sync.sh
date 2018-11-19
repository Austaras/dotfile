#!/bin/bash
cp /etc/pacman.d/mirrorlist .
cp ~/.config/fontconfig/fonts.conf .
grep "name\":" ~/.local/share/gnome-shell/extensions/*/metadata.json | awk -F '"name": "|",' '{print $2}' > gnome-extensions.txt

icon=$(dconf read /org/gnome/desktop/interface/cursor-theme | sed -e "s/'\(.*\)'/\1/")
cp -r "$HOME/.icons/$icon" .
cursor=$(dconf read /org/gnome/desktop/interface/icon-theme | sed -e "s/'\(.*\)'/\1/")
cp -r "$HOME/.icons/$cursor" .
gtk=$(dconf read /org/gnome/desktop/interface/gtk-theme | sed -e "s/'\(.*\)'/\1/")
cp -r "$HOME/.themes/$gtk" .
shell=$(dconf read /org/gnome/shell/extensions/user-theme/name | sed -e "s/'\(.*\)'/\1/")
cp -r "$HOME/.themes/$shell" .
cp "$HOME/.config/tilda/style.css" tilda/
