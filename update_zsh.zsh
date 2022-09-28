#!/usr/bin/env zsh
trash -rf ./zsh
trash aliasrc
trash ./.zshrc
cp -vir ~/.zsh zsh
cp -vir ~/.zshrc .zshrc
cp -vir ~/.config/aliasrc aliasrc
