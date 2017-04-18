[ -z "$DOTFILES" ] && export DOTFILES="$HOME/.dotfiles"
export ZDOTDIR="$DOTFILES/zsh"

# Set PATH on macOS
# source: http://www.softec.lu/site/DevelopersCorner/MasteringThePathHelper
if [ -x /usr/libexec/path_helper ]; then
	PATH=""
	eval `/usr/libexec/path_helper -s`

	# Fix path order
	PATH="$(cat /etc/paths.d/* |tr '\n' ':'):$PATH"
fi

[ -d "$HOME/bin" ] && PATH=$HOME/bin:$PATH

# Set CDPATH
CDPATH=".:$HOME/src:$GOPATH/src"
