#!/usr/bin/env zsh
trash -rf ./zsh
trash ./.zshrc
cp -vir ~/.zsh zsh
cp -vir ~/.zshrc .zshrc
# update i3
trash ./i3
trash ./i3blocks
cp -vir ~/.config/i3 i3
cp -vir ~/.config/i3blocks i3blocks
# update rofi
trash ./rofi
cp -vir ~/.config/rofi rofi
# update dunst
trash ./dunst
cp -vir ~/.config/dunst dunst
# update kitty
trash ./kitty
cp -vir ~/.config/kitty kitty
# update picom
trash ./picom
cp -vir ~/.config/picom picom
