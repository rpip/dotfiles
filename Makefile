.PHONY: all install

$(HOME)/.%:
	ln -s $(CURDIR)/$* $@

DOTFILES=$(HOME)/.gitconfig \
	$(HOME)/.erlang \
	$(HOME)/.tmux.conf \
	$(HOME)/.bashrc \
	$(HOME)/.bash_profile

install: $(DOTFILES)
