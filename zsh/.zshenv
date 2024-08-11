# Before everything.
# Always sourced.

PATH=$PATH:$HOME/go/bin
PATH=$PATH:$HOME/.local/bin/

if command -v brew >/dev/null; then
    PATH=/opt/homebrew/bin:$PATH
    # And SBIN - Used by some Hombrew packages
    PATH=/usr/local/sbin:$PATH
fi

export PATH
