# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Default p10k theme
# source "$MY_ZSH_DIR/powerlevel10k/powerlevel10k.zsh-theme"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f "$MY_ZSH_DIR/.p10k.zsh" ]] || source "$MY_ZSH_DIR/.p10k.zsh"

# Some useful functions
include () {
    [[ -f "$1" ]] && source "$1"
}

# User configuration
export EDITOR=/usr/local/bin/nvim

# local config
include ~/.shells/local.zsh
# Aliases
#  Git Workflow
alias gst="git status"
alias gco="git checkout"
alias gfo="git fetch origin"
alias gch="git reflog show --pretty=format:'%gs' | rg 'checkout:' | rg -o '[^ ]+$' | awk '!seen[\$1]++' | tail -n +2 | fzf | xargs git checkout"
alias gcaa="git commit -a --amend --no-edit"
alias gpfw="git push --force-with-lease"
alias gpl="git pull"
alias gstt="git log --pretty=short --graph --boundary --abbrev-commit --compact-summary origin/main...HEAD"
#  Ruby Workflow
alias be="bundle exec"
alias rra="RAILS_ENV=test bundle exec rails db:drop db:create db:schema:load db:seed:replant"
#  General
alias c="clear -x"
alias gwm="cowsay god i wish that were me"
alias rsrc="source ~/.zshrc"
# wip: use shell function
# alias stash="mkdir -p ./_clutter && mv \$1 ./_clutter/"
alias stetris="tetris && clear"
alias vim="nvim"
alias zshrc="$EDITOR ~/.zshrc"

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/danielramirez/Library/Caches/heroku/autocomplete/zsh_setup && include $HEROKU_AC_ZSH_SETUP_PATH;

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.cargo/env"

eval "$(zoxide init zsh)"
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export MY_ZSH_DIR="$HOME/wrc/zsh"

# And GOBIN
export PATH="$PATH:$HOME/go/bin"
# And SBIN - Used by some Hombrew packages
# export PATH="$PATH:/usr/local/sbin"

# Setting PATH for Python 3.9
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
export PATH

. "$HOME/.cargo/env"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$GEM_HOME/bin:$HOME/.rvm/bin:$PATH"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
