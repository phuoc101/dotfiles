#!/usr/bin/env zsh
trash -rf ./zsh
trash ./.zshrc
cp -vir ~/.zsh zsh
cp -vir ~/.zshrc .zshrc
