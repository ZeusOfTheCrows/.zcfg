# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
	PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi
unset rc

# ======== greeting =======
# "&&": right only executed when left is true,
# "||": right only executed when left is false
# [[ $- == *i* ]]: true when shell is interactive
# https://bash.cyberciti.biz/guide/$-
[[ $- == *i* ]] && cat<<'EOF'
    `Y***L
      `Y**L. _
      ,J>7*^ ~ ^  ^^7  __  _ _  _
  .=|,`YL          7  J__L U U J_`
       .`L -.     J__ 4__, 4_7 ,_7
===================================
EOF

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

# Display the current Git branch in the Bash prompt.

function git_branch() {
	if [ -d .git ] ; then
		printf "%s" "($(git branch 2> /dev/null | awk '/\*/{print $2}'))";
	fi
}

# Set the prompt.

function bash_prompt(){
	PS1='${debian_chroot:+($debian_chroot)}'\\[\\033[32m\\]'$(git_branch)'\$\\[\\033[34m\\]' \w'\\[\\033[36m\\]'> '\\[\\033[00m\\]
}

bash_prompt

# ======================== user aliases ========================

# alias dir="ls -l -F -h"
alias          sd="sudo"
alias         dir="eza --long --classify --group-directories-first --header"
alias         cls="clear"
alias         aar="sudo add-apt-repository"
alias         cat="bat"
alias        grep="ug -i"
alias        nano="micro"
alias       start="xdg-open"
alias       where="which -a"
alias       jhost="bundle exec jekyll serve --host $(hostname -I)"
alias      jserve="bundle exec jekyll serve"
alias    gnu-nano="nano"
# install most recently searched for package
alias in="fc -s 'dnf list'='sudo dnf install'"
alias ins="fc -s 'dnf search'='sudo dnf install'"
alias find-recent="find . -type f -mmin -1"
alias where="command -v"

info() {
	if [ ! $1 ]; then
		dir .
	elif [ -d $1 ]; then
		dir $*
	elif [ -f $1 ]; then
		cat $*
	elif [ $(type -t $1) == function ] || [ $(type -t $1) == builtin ]; then
		command -V $1
	elif [ $(type -t $1) == alias ] || [ $(type -t $1) == file ]; then
		command -v $1
	elif [ ! -a ]; then
		echo "not found"
	else
		echo "fix me"
	fi
}
complete -o default info

# foobar() {
	# type $@ | cut -d" " -f 3-999 | sed "s/aliased to/\033[32malias:\033[0;39m/g" | sed 's/a function/\033[36mfunction:\033[0;39m\n/g'
# }
