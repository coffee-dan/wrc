# Before everything.
# Always sourced.

# Some useful functions
include () {
    [[ -f "$1" ]] && source "$1"
}

stash() {
  mkdir -p ./_clutter
  mv "$1" ./_clutter
}

PATH=$PATH:$HOME/go/bin
PATH=$PATH:$HOME/.local/bin/

if [[ $(uname) == "Darwin" ]]; then
    PATH=/opt/homebrew/bin:$PATH
    # And SBIN - Used by some Hombrew packages
    PATH=/usr/local/sbin:$PATH
    export HEROKU_AC_ZSH_SETUP_PATH=~/Library/Caches/heroku/autocomplete/zsh_setup && include $HEROKU_AC_ZSH_SETUP_PATH;
fi

export EDITOR=hx
export PATH
export MY_ZSH_DIR="$HOME/wrc/zsh"
export NVM_DIR="$HOME/.nvm"

eval "$(mise activate zsh)"
