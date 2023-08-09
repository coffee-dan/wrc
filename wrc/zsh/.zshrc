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


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# User configuration
export EDITOR=/usr/local/bin/nvim

# local config
include ~/.shells/local.zsh
# Aliases
#  Git Workflow
alias gst="git status"
alias gco="git checkout"
alias gfo="git fetch origin"
alias gch="git reflog show --pretty=format:'%gs' | rg 'checkout:' | rg -o '[^ ]+$' | awk '!seen[\$1]++' | tail -n +2 | gum choose | xargs git checkout"
alias gcaa="git commit -a --amend --no-edit"
alias gpfw="git push --force-with-lease"
alias gcpl="git checkout main && git pull --all && git log"
alias gstt="git log --pretty=short --graph --boundary --abbrev-commit --compact-summary origin/main...HEAD"
#  Ruby Workflow
alias be="bundle exec"
alias rra="RAILS_ENV=test bundle exec rails db:drop db:create db:schema:load db:seed:replant"
#  General
alias zshrc="hx ~/.zshrc"
alias vim="nvim"
alias stetris="tetris && clear"
alias rsrc="source ~/.zshrc"
alias c="clear -x"
alias gwm="cowsay god i wish that were me"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
# And GOBIN
export PATH="$PATH:$HOME/go/bin"

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/danielramirez/Library/Caches/heroku/autocomplete/zsh_setup && include $HEROKU_AC_ZSH_SETUP_PATH;

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(zoxide init zsh)"
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh