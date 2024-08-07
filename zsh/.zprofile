# Before zshrc
# environment for login shells

[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

PATH=$PATH:$HOME/go/bin
PATH=/opt/homebrew/bin:$PATH
# And SBIN - Used by some Hombrew packages
PATH=/usr/local/sbin:$PATH

export PATH
