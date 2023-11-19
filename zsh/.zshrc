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

stash() {
  mkdir -p ./_clutter
  mv "$1" ./_clutter
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
alias gpsup="git push --set-upstream origin"
alias gpl="git pull"
alias gpr="git pull --rebase"
alias gpla="git pull --all"
alias gstt="git log --pretty=short --graph --boundary --abbrev-commit --compact-summary origin/main...HEAD"
alias gsh="git stash --include-untracked"
alias gshp="git stash pop"
alias gshs="git stash show --text"
alias gcom="git stash --include-untracked && git checkout main"
alias gnb="git stash --include-untracked && git checkout main && git pull && git checkout -b"
#  GitHub Workflow
alias ghdraft="git push --set-upstream origin && gh pr create --assignee @me --fill --draft && gh pr view --web"
alias ghpr="gh pr create --assignee @me --fill --web"
alias ghprview="gh pr view --web"
alias ghview="gh repo view --web"
#  Ruby Workflow
alias be="bundle exec"
alias rra="RAILS_ENV=test bundle exec rails db:drop db:create db:schema:load db:seed:replant"
#  General
alias c="clear -x"
alias gwm="cowsay god i wish that were me"
alias rsrc="source ~/.zshrc"
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
