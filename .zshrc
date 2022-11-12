# Some useful functions
include () {
    [[ -f "$1" ]] && source "$1"
}

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# User configuration

# local config
include ~/.shells/local.zsh
#
alias zshrc="hx ~/.zshrc"
alias gst="git status"
alias gcaa="git commit -a --amend --no-edit"
alias gpfw="git push --force-with-lease"
alias gcpl="git checkout main && git pull --all && git log"
alias stetris="tetris && clear"
alias rsrc="source ~/.zshrc"
alias rra="RAILS_ENV=test bundle exec rails db:drop db:create db:schema:load db:seed:replant"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/danielramirez/Library/Caches/heroku/autocomplete/zsh_setup && include $HEROKU_AC_ZSH_SETUP_PATH;

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(zoxide init zsh)"
