all:
	[ -f $(HOME)/.zshenv ] || ln -s $(HOME)/.dotfiles/zsh/.zshenv $(HOME)/.zshenv
	[ -f $(HOME)/.vimrc ] || ln -s $(HOME)/.dotfiles/vimrc $(HOME)/.vimrc
	[ -f $(HOME)/.tmux.conf ] || ln -s $(HOME)/.dotfiles/tmux.conf $(HOME)/.tmux.conf

clean:
	[ -L $(HOME)/.zshenv ] && rm $(HOME)/.zshenv
	[ -L $(HOME)/.vimrc ] && rm $(HOME)/.vimrc
	[ -L $(HOME)/.tmux.conf ] && rm $(HOME)/.tmux.conf
