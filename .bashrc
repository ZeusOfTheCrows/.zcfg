# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# shellcheck source=.brc.d/*
if [ -d ~/.brc.d ]; then
	for rc in ~/.brc.d/*.bashrc; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi
unset rc

# ================================================================

# case insensitive completion

## bind 'set completion-ignore-case on'

# fancy method

# If ~/.inputrc doesn't exist yet: First include the original /etc/inputrc
# so it won't get overriden
# if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi

# Add shell-option to ~/.inputrc to enable case-insensitive tab completion
# echo 'set completion-ignore-case On' >> ~/.inputrc

# setxkbmap gb zeusmak

#-----------------------------------------------------------------
