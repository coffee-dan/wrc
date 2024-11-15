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

if [[ "$OSTYPE" == "darwin"* ]]; then
  MY_OS="MacOS"
  MY_ZSH_PROMPT="starship"
fi

export EDITOR=hx
export MY_OS
export MY_ZSH_DIR="$HOME/wrc/zsh"
export MY_ZSH_PROMPT
export NVM_DIR="$HOME/.nvm"
export PATH
