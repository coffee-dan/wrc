# Before everything.
# Always sourced.

PATH=$PATH:$HOME/go/bin
PATH=$PATH:$HOME/.local/bin/

if command -v brew >/dev/null; then
    PATH=/opt/homebrew/bin:$PATH
    # And SBIN - Used by some Hombrew packages
    PATH=/usr/local/sbin:$PATH
fi

if [[ $(uname) == "Darwin" ]]; then
    export HEROKU_AC_ZSH_SETUP_PATH=~/Library/Caches/heroku/autocomplete/zsh_setup && include $HEROKU_AC_ZSH_SETUP_PATH;
fi

export EDITOR=hx
export PATH
export MY_ZSH_DIR="$HOME/wrc/zsh"
export NVM_DIR="$HOME/.nvm"

eval "$(mise activate zsh)"
