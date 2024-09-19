#!/usr/bin/env bash

stow bash
stow irb
stow tmux
stow vim
stow zsh
stow wezterm
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/kitty
mkdir -p ~/.config/nvim
mkdir -p ~/.config/helix
stow --target=$HOME/.config/alacritty alacritty
stow --target=$HOME/.config/kitty kitty
stow --target=$HOME/.config/nvim nvim
stow --target=$HOME/.config/helix helix

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "a linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
    brew install zoxide mise powerlevel10k
else
    echo "something new!"
fi
