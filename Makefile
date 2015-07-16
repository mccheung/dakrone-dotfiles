# Directory where this Makefile exists (the dotfiles directory)
DOTFILES_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

all: bootstrap zsh tmux git emacs

bootstrap: bootstrap-packages.sh

bootstrap-packages.sh: bootstrap.org
	bin/tangle bootstrap.org

zsh: .zshrc

.zshrc: zsh.org
	bin/tangle zsh.org

emacs: .emacs.d/init.el

.emacs.d/init.el: emacs.org
	bin/tangle emacs.org

tmux: .tmux.conf

.tmux.conf: tmux.org
	bin/tangle tmux.org

git: .gitconfig

.gitconfig: git.org
	bin/tangle git.org

install: all
	ln -s -v -i $(DOTFILES_DIR)/.zsh* ~/
	ln -s -v -i $(DOTFILES_DIR)/.git?* ~/
	ln -s -v -i $(DOTFILES_DIR)/.tmux* ~/
	ln -s -v -i $(DOTFILES_DIR)/.emacs.d ~/

force-install: all
	ln -s -v -f $(DOTFILES_DIR)/.zsh* ~/
	ln -s -v -f $(DOTFILES_DIR)/.git?* ~/
	ln -s -v -f $(DOTFILES_DIR)/.tmux* ~/
	ln -s -v -f $(DOTFILES_DIR)/.emacs.d ~/
