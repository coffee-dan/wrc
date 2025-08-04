if [[ $(uname) == "Darwin" ]]; then
  PATH=/opt/homebrew/bin:$PATH
  # And BIN - Used by some Hombrew packages
  PATH=/usr/local/bin:$PATH
  export HEROKU_AC_ZSH_SETUP_PATH=~/Library/Caches/heroku/autocomplete/zsh_setup && include $HEROKU_AC_ZSH_SETUP_PATH;
fi

eval "$(mise activate zsh)"

if [[ "$MY_OS" == "MacOS" ]]; then
  [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

  if [[ "$MY_ZSH_PROMPT" == "starship" ]]; then
    eval "$(starship init zsh)"
  elif [[ "$MY_ZSH_PROMPT" == "powerlevel10k" ]]; then
    source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
  fi

elif command -v pacman >/dev/null; then

  eval "$(starship init zsh)"

elif command -v apt-get >/dev/null; then
  # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
  # Initialization code that may require console input (password prompts, [y/n]
  # confirmations, etc.) must go above this block; everything else may go below.
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi

  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ ! -f "$MY_ZSH_DIR/.p10k.zsh" ]] || source "$MY_ZSH_DIR/.p10k.zsh"

  source ~/powerlevel10k/powerlevel10k.zsh-theme
fi

# local config
include ~/.local.zshrc
# Aliases
#  Docker Workflow
alias dc="docker compose"
alias dcu="docker compose up"
alias dcub="docker compose up --build"
alias dcd="docker compose down"
alias dcr="docker compose restart" # usage dcr [service_name]
alias dex="docker compose exec" # usage: de [service_name] [command]
alias dexi="docker compose exec --interactive --tty" # docker-exec-interactive
alias dew="docker compose exec web"
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
alias gtl="git log"
alias gtlg="git log --pretty=short --graph --boundary --abbrev-commit --compact-summary origin/main...HEAD"
alias gd="git diff"
alias gsh="git stash --include-untracked"
alias gshp="git stash pop"
alias gshl="git stash list"
alias gshs="git stash show --text"
alias gcom="git stash --include-untracked && git checkout main"
alias gnb="git stash --include-untracked && git checkout main && git pull && git checkout -b"

function git-sync () {
  local target="${1:-$(git branch --show-current)}"
  local source="${2:-main}"

  git checkout "$source"
  git pull
  git checkout "$target"
  git reset --hard "$source"
}

#  Go Workflow
alias gob="go build"
alias gor="go run ."
alias got="go test"
alias gomi="go mod init placeholder"
alias gomt="go mod tidy"
#  GitHub Workflow
alias ghco="gh pr checkout"
alias ghdraft="git push --set-upstream origin && gh pr create --assignee @me --fill --draft && gh pr view --web"
alias ghpr="git push --set-upstream origin && gh pr create --assignee @me --fill --web"
alias ghprv="gh pr view --web"
alias ghv="gh repo view --web"
#  Heroku Workflow
alias hecc="heroku builds:cache:purge --app"
#  Ruby Workflow
alias be="bundle exec"
alias rdrt="RAILS_ENV=test bundle exec rails db:drop db:create db:schema:load db:seed:replant"
alias rdpt="RAILS_ENV=test bundle exec rails db:seed:replant"
alias rdr="RAILS_ENV=development bundle exec rails db:drop db:create db:schema:load db:seed:replant"
alias rdp="RAILS_ENV=development bundle exec rails db:seed:replant"
#  NixOS
alias nx-build-upgrade="sudo nixos-rebuild boot --upgrade"
alias nx-build="sudo nixos-rebuild boot"
alias nx-switch="sudo nixos-rebuild switch"
alias nx-rollback='sudo nixos-rebuild switch --rollback'
alias nxcl='sudo nix-channel --list'
alias nxcu='sudo nix-channel --update'
alias nxca='sudo nix-channel --add'
alias nxcr='sudo nix-channel --remove'
alias nxgl="nixos-rebuild list-generations"
#  Arch / Pacman
alias pac-install="sudo pacman -S"
alias pac-upgrade="sudo pacman -Syu"
alias pac-clean="sudo pacman -Scc"
alias pac-remove="sudo pacman -Rcns"
alias pac-orphans="pacman -Qdt"
alias pac-list="pacman -Qe"
#  Arch / Hyprland
alias waybar-reload="pkill -SIGUSR2 waybar"
#  General
alias c="clear -x"
alias gwm="cowsay god i wish that were me"
alias hfz="cat ~/.zsh_history | fzf"
alias rsrc="source ~/.zshrc"
alias stetris="tetris && clear"
alias zshrc="$EDITOR ~/.zshrc"
alias opng="optipng -clobber -o7"

function ffmpeg-webm-gif() {
  local webm_filename="$1"
  local gif_filename="$(basename "${webm_filename%.*}")"
  ffmpeg -i "${webm_filename}" \
          -vf "fps=10,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
          -loop -1 \
          "${gif_filename}.gif"
  gifsicle --optimize=3 --output "${gif_filename}-optimized.gif" --resize-height 600 "${gif_filename}.gif"
}

[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

if command -v zoxide >/dev/null; then
  eval "$(zoxide init zsh)"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
