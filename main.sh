#!/usr/bin/env bash

stow bash
stow irb
stow tmux
stow vim
stow zsh
stow wezterm
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/fuzzel
mkdir -p ~/.config/helix
mkdir -p ~/.config/kitty
mkdir -p ~/.config/nvim
mkdir -p ~/.config/mise
mkdir -p ~/.config/rofi
mkdir -p ~/.config/starship
stow --target=$HOME/.config/alacritty alacritty
stow --target=$HOME/.config/fuzzel fuzzel
stow --target=$HOME/.config/helix helix
stow --target=$HOME/.config/kitty kitty
stow --target=$HOME/.config/nvim nvim
stow --target=$HOME/.config/rofi rofi
stow --target=$HOME/.config/ starship

if [[ "$MY_OS" == "NixOS" ]]; then
    # If main configuration is not already a symlink
    # - This is just to avoid sudo password check
    if [[ ! -L "/etc/nixos/configuration.nix" ]]; then
        sudo stow --target=/etc/nixos nixos
    fi
    stow --target=$HOME/.config/mise --dir=mise nixos
elif [[ "$MY_OS" == "MacOS" ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
    brew install zoxide mise powerlevel10k starship
fi
