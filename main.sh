#!/usr/bin/env bash

function safe-stow() {
    local package="$1"
    local target="$2"

    if [ -z "$target" ]; then
        stow $package
    else
        mkdir -p $target
        stow --target=$target $package
    fi
}

safe-stow bash
safe-stow irb
safe-stow login
safe-stow tmux
safe-stow vim
safe-stow wezterm
safe-stow zsh
safe-stow alacritty $HOME/.config/alacritty
safe-stow flameshot $HOME/.config/flameshot
safe-stow fuzzel    $HOME/.config/fuzzel
safe-stow ghostty   $HOME/.config/ghostty
safe-stow git       $HOME/.config/git
safe-stow helix     $HOME/.config/helix
safe-stow hypr      $HOME/.config/hypr
safe-stow kitty     $HOME/.config/kitty
safe-stow nvim      $HOME/.config/nvim
safe-stow rofi      $HOME/.config/rofi
safe-stow sherlock  $HOME/.config/sherlock
safe-stow starship  $HOME/.config/
safe-stow waybar    $HOME/.config/waybar
safe-stow wofi      $HOME/.config/wofi

if [[ "$MY_OS" == "NixOS" ]]; then
    # If main configuration is not already a symlink
    # - This is just to avoid sudo password check
    if [[ ! -L "/etc/nixos/configuration.nix" ]]; then
        sudo mkdir -p /etc/nixos
        sudo stow --target=/etc/nixos nixos
    fi
    stow --target=$HOME/.config/mise --dir=mise nixos
elif [[ "$MY_OS" == "MacOS" ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
    brew install zoxide mise powerlevel10k starship
    stow --target=$HOME/.config/mise --dir=mise macos
fi
