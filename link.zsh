#!/bin/zsh
trash ${HOME}/.config/aliasrc
trash ${HOME}/.config/alacritty
trash ${HOME}/.config/dunst
trash ${HOME}/.config/i3
trash ${HOME}/.config/polybar
trash ${HOME}/.config/rofi 
trash ${HOME}/.config/kitty
trash ${HOME}/.config/nvim
trash ${HOME}/.config/sioyek
trash ${HOME}/.config/zathura
trash ${HOME}/.config/qtile
trash ${HOME}/.config/starship.toml
trash ${HOME}/.config/wezterm
trash ${HOME}/.config/tmux
trash ${HOME}/.config/zellij
trash ${HOME}/.config/picom
trash ${HOME}/.config/yazi
trash ${HOME}/.config/fastfetch
trash ${HOME}/.bash
trash ${HOME}/.bashrc
trash ${HOME}/.zshrc
trash ${HOME}/.zshrc.d
trash ${HOME}/.vimrc
trash ${HOME}/.local/bin/dark_mode
trash ${HOME}/.local/bin/light_mode
trash ${HOME}/.local/bin/mapesctilde
trash ${HOME}/.local/bin/init_stuffs
trash ${HOME}/.tmux.conf
trash ${HOME}/.wezterm.lua

# Link config files
ln -s ${HOME}/dotfiles/.config/aliasrc ${HOME}/.config/aliasrc
ln -s ${HOME}/dotfiles/.config/alacritty ${HOME}/.config/alacritty
ln -s ${HOME}/dotfiles/.config/dunst ${HOME}/.config/dunst
ln -s ${HOME}/dotfiles/.config/i3 ${HOME}/.config/i3
ln -s ${HOME}/dotfiles/.config/polybar ${HOME}/.config/polybar
ln -s ${HOME}/dotfiles/.config/rofi ${HOME}/.config/rofi
ln -s ${HOME}/dotfiles/.config/kitty ${HOME}/.config/kitty
ln -s ${HOME}/dotfiles/.config/nvim ${HOME}/.config/nvim
ln -s ${HOME}/dotfiles/.config/zathura ${HOME}/.config/zathura
ln -s ${HOME}/dotfiles/.config/qtile ${HOME}/.config/qtile
ln -s ${HOME}/dotfiles/.config/sioyek ${HOME}/.config/sioyek
ln -s ${HOME}/dotfiles/.config/starship.toml ${HOME}/.config/starship.toml
ln -s ${HOME}/dotfiles/.config/wezterm ${HOME}/.config/wezterm
ln -s ${HOME}/dotfiles/.config/tmux ${HOME}/.config/tmux
ln -s ${HOME}/dotfiles/.config/zellij ${HOME}/.config/zellij
ln -s ${HOME}/dotfiles/.config/picom ${HOME}/.config/picom
ln -s ${HOME}/dotfiles/.config/yazi ${HOME}/.config/yazi
ln -s ${HOME}/dotfiles/.config/fastfetch ${HOME}/.config/fastfetch
ln -s ${HOME}/dotfiles/.bash ${HOME}/.bash
ln -s ${HOME}/dotfiles/.bashrc ${HOME}/.bashrc
ln -s ${HOME}/dotfiles/.zshrc ${HOME}/.zshrc
ln -s ${HOME}/dotfiles/.zshrc.d ${HOME}/.zshrc.d
ln -s ${HOME}/dotfiles/custom_scripts/* ${HOME}/.local/bin
ln -s ${HOME}/dotfiles/tmux.conf ${HOME}/.tmux.conf
ln -s ${HOME}/dotfiles/.vimrc ${HOME}/.vimrc
