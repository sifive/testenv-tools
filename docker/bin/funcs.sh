_xecho () {
    if [ "$1" = "-n" -o  "$1" = "-ne" ]; then
        shift
        EOL=""
    else
        EOL="\n"
    fi
    printf -- "$*${EOL}"
}

info () {
    _xecho -ne "\033[36m"
    if [ "$1" = "-n" ]; then
        shift
        _xecho -n "$*"
    else
        _xecho "$*"
    fi
    _xecho -ne "\033[0m"
}

warning () {
    _xecho -ne "\033[33;1m"
    if [ "$1" = "-n" ]; then
        shift
        _xecho -n "$*"
    else
        _xecho "$*"
    fi
    _xecho -ne "\033[0m"
}

error () {
    _xecho -ne "\033[31;1m"
    if [ "$1" = "-n" ]; then
        shift
        _xecho -n "$*"
    else
        _xecho "$*"
    fi
    _xecho -ne "\033[0m"
}

# Die with an error message
die() {
    error "$*" >&2
    exit 1
}
