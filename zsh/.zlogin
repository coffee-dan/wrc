# After zshrc
# environment for login shells
# And GOBIN
export PATH="$PATH:$HOME/go/bin"
# And homebrew location
export PATH="/opt/homebrew/bin:$PATH"
# And SBIN - Used by some Hombrew packages
export PATH="/usr/local/sbin:$PATH"

# Setting PATH for Python 3.9
# The original version is saved in .zprofile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:$PATH"

. "$HOME/.cargo/env"

export PATH
