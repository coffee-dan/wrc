#!/usr/bin/env bash

stow --ignore=.DS_Store zsh
stow bash
stow irb
stow --target=$HOME/.config/kitty kitty