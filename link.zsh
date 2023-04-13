#!/bin/zsh
trash ~/.config/aliasrc
trash ~/.config/alacritty
trash ~/.config/dunst
trash ~/.config/i3
trash ~/.config/polybar
trash ~/.config/rofi
trash ~/.config/kitty
trash ~/.config/nvim
trash ~/.config/sioyek
trash ~/.zshrc
trash ~/.zsh
trash ~/.local/bin/dark_mode
trash ~/.local/bin/light_mode
trash ~/.tmux.conf
trash ~/.wezterm.lua
trash ~/.icons/extras/

# Link config files
ln -s ~/dotfiles/.config/aliasrc ~/.config/aliasrc
ln -s ~/dotfiles/.config/alacritty ~/.config/alacritty
ln -s ~/dotfiles/.config/dunst ~/.config/dunst
ln -s ~/dotfiles/.config/i3 ~/.config/i3
ln -s ~/dotfiles/.config/polybar ~/.config/polybar
ln -s ~/dotfiles/.config/rofi ~/.config/rofi
ln -s ~/dotfiles/.config/kitty ~/.config/kitty
ln -s ~/dotfiles/.config/nvim ~/.config/nvim
ln -s ~/dotfiles/.config/sioyek ~/.config/sioyek
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zsh ~/.zsh
ln -s ~/dotfiles/dark_mode ~/.local/bin/dark_mode
ln -s ~/dotfiles/light_mode ~/.local/bin/light_mode
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.wezterm.lua ~/.wezterm.lua
ln -s ~/dotfiles/.icons/extras/ ~/.icons/
