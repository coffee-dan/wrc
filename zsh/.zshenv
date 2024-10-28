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

export EDITOR=hx
export PATH
export MY_ZSH_DIR="$HOME/wrc/zsh"
export NVM_DIR="$HOME/.nvm"
