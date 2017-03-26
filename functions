# Functions

# Load bash files from zsh
# source: http://unix.stackexchange.com/a/3449
source_sh () {
  emulate -LR sh
  . "$@"
}

function fh() { sh -c "$(sed 's/: [0-9]*:0;//' $HISTFILE |fzf)" }
function mkcd() { mkdir -p -v "$1"; cd "$1"; }
function cdtemp() { cd $(mktemp -d) }
function fkill() { ps -ef | sed 1d | fzf -m | awk '{print $2}' | xargs kill -${1:-9} }

# Shortcut to open note files
function note() {
    local fname
    fname=$(find $HOME/Notes -type f -not -name ".*" | \
        fzf --query="$1" --select-1 --exit-0) &&
    $EDITOR "$fname"
}

# Reverse IP address
function iprev() {
	echo $1 |awk '{split($0,a,"."); printf "%d.%d.%d.%d",a[4],a[3],a[2],a[1]}'
}

# Test if an IP is on the zen.spamhaus.org blacklist
function zen() {
	dig +short $(iprev $1).zen.spamhaus.org
}
