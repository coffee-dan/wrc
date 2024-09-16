# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# local config
include ~/.shells/local.zsh
# Aliases
#  Docker Workflow
alias dc="docker compose"
alias dcu="docker compose up"
alias dcub="docker compose up --build"
alias dcd="docker compose down"
alias dex="docker compose exec" # usage: de [service_name] [command]
alias dwrc="docker compose exec web rails console"
alias dwb="docker compose exec web bash"
alias daw="docker attach web"
#  Git Workflow
alias gst="git status"
alias gco="git checkout"
alias gfo="git fetch origin"
alias gfco="git fetch origin && git checkout"
alias gch="git reflog show --pretty=format:'%gs' | rg 'checkout:' | rg -o '[^ ]+$' | awk '!seen[\$1]++' | tail -n +2 | fzf | xargs git checkout"
alias gc="git commit"
alias gc!="git commit --amend"
alias gyh="git rev-parse HEAD | pbcopy"
alias gca="git add --all && git commit"
alias gcaa="git add --all && git commit --amend --no-edit"
alias gp="git push"
alias gpfw="git push --force-with-lease"
alias gpsup="git push --set-upstream origin"
alias gpl="git pull"
alias gpr="git pull --rebase"
alias gph="git fetch && git reset --hard"
alias gpla="git pull --all"
alias gstt="git log --pretty=short --graph --boundary --abbrev-commit --compact-summary origin/main...HEAD"
alias gsh="git stash --include-untracked"
alias gshp="git stash pop"
alias gshs="git stash show --text"
alias gcom="git stash --include-untracked && git checkout main"
alias gnb="git stash --include-untracked && git checkout main && git pull && git checkout -b"
#  Go Workflow
alias gob="go build"
alias gor="go run ."
alias got="go test"
alias gomi="go mod init placeholder"
alias gomt="go mod tidy"
#  GitHub Workflow
alias ghco="gh pr checkout"
alias ghdraft="git push --set-upstream origin && gh pr create --assignee @me --fill --draft && gh pr view --web"
alias ghpr="gh pr create --assignee @me --fill --web"
alias ghprv="gh pr view --web"
alias ghv="gh repo view --web"
#  Ruby Workflow
alias be="bundle exec"
alias rdrt="RAILS_ENV=test bundle exec rails db:drop db:create db:schema:load db:seed:replant"
alias rdpt="RAILS_ENV=test bundle exec rails db:seed:replant"
alias rdr="RAILS_ENV=development bundle exec rails db:drop db:create db:schema:load db:seed:replant"
alias rdp="RAILS_ENV=development bundle exec rails db:seed:replant"
#  General
alias c="clear -x"
alias gwm="cowsay god i wish that were me"
alias hfz="cat ~/.zsh_history | fzf"
alias rsrc="source ~/.zshrc"
alias stetris="tetris && clear"
alias zshrc="$EDITOR ~/.zshrc"

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

eval "$(zoxide init zsh)"

if command -v brew >/dev/null; then
  source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
elif command -v apt-get >/dev/null; then
  source ~/powerlevel10k/powerlevel10k.zsh-theme
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
