export iceblue="\[\033[0;38;5;45m\]"
export nocolor="\[\033[0m\]"

case "$TERM" in
    xterm*)
        PS1="$iceblue\u@\h [\W]\\$ $nocolor"
        ;;
    *)
        PS1="\u@\h [\W]\\$"
esac


export PS1
