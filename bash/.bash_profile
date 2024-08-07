
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

export PATH="/usr/local/opt/postgresql@13/bin:$PATH"
. "$HOME/.cargo/env"
