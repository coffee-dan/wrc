#!/usr/bin/env bash

stow bash
stow irb
stow tmux
stow vim
stow zsh
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/kitty
mkdir -p ~/.config/nvim
stow --target=$HOME/.config/alacritty alacritty
stow --target=$HOME/.config/kitty kitty
stow --target=$HOME/.config/nvim nvim
