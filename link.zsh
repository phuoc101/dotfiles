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
trash ~/.config/zathura
trash ~/.bash
trash ~/.bashrc
trash ~/.zshrc
trash ~/.zsh
trash ~/.vimrc
trash ~/.local/bin/dark_mode
trash ~/.local/bin/light_mode
trash ~/.local/bin/mapesctilde
trash ~/.local/bin/init_stuffs
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
ln -s ~/dotfiles/.config/zathura ~/.config/zathura
ln -s ~/dotfiles/.config/sioyek ~/.config/sioyek
ln -s ~/dotfiles/.bash ~/.bash
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.zsh ~/.zsh
ln -s ~/dotfiles/custom_scripts/* ~/.local/bin
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.wezterm.lua ~/.wezterm.lua
ln -s ~/dotfiles/.icons/extras/ ~/.icons/
ln -s ~/dotfiles/.vimrc ~/.vimrc
