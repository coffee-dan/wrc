#!/usr/bin/env bash

stow --ignore=.DS_Store zsh
stow bash
stow irb
stow --target=$HOME/.config/kitty kitty
stow tmux
stow vim
stow --target=$HOME/.config/alacritty alacritty
stow --target=$HOME/.config/nvim nvim
