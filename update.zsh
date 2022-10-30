#!/usr/bin/env zsh
trash -rf ./zsh
trash ./.zshrc
cp -vir ~/.zsh zsh
cp -vir ~/.zshrc .zshrc
# update i3
trash ./.config/i3
trash ./.config/i3blocks
cp -vir ~/.config/i3 ./.config/i3
cp -vir ~/.config/i3blocks ./.config/i3blocks
# update rofi
trash ./.config/rofi
cp -vir ~/.config/rofi ./.config/rofi
# update dunst
trash ./.config/dunst
cp -vir ~/.config/dunst ./.config/dunst
# update kitty
trash ./.config/kitty
cp -vir ~/.config/kitty ./.config/kitty
# update picom
trash ./.config/picom
cp -vir ~/.config/picom ./.config/picom
