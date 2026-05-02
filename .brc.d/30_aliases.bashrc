# ======================== user aliases ========================
# shellcheck disable=SC2206,SC2207

# alias dir="ls -l -F -h"
alias      f='ug -jG'  # (find) smart case-insensitive, basic regex
alias      b='$PAGER --chop-long-lines'  # available pager, defined in 10_env
alias      p='$PAGER --chop-long-lines --paging=always'   # force bat to page
alias     sd='sudo'
alias    exe='chmod +x'
alias    ffs='sudo $(history -p !!)'
alias    cls='clear -x'
alias   edit='micro'
alias  start='xdg-open'
alias  where='which -a'
alias  jhost='bundle exec jekyll serve --host $(hostname -I)'
alias jserve='firefox http://localhost:4000 & bundle exec jekyll serve'
# alias         cat='bat'
# alias        nano='micro'
# alias       where='command -v'
# alias    gnu-nano='nano'

# find files changed in the last minute in current dir
alias find-recent="find . -type f -mmin -1"

complete -c where

# ================== conditional aliases ===================
if [ -x "$(command -v trash)" ]; then
	alias del='trash'  # cli-trash required
else
	alias del='echo "cli-trash not installed"'
fi

if  [ -x "$(command -v eza)" ]; then
	alias dir='eza -l -F --group-directories-first --header --octal-permissions'
elif  [ -x "$(command -v exa)" ]; then
	alias dir='exa -l -F --group-directories-first --header --octal-permissions'
else
	alias dir='printf "%b\n" "\e[43;30m /!\\ EZA IS NOT INSTALLED /!\\ \e[0m"
	ls -l -F -h --group-directories-first'
fi
complete -d dir

if  [ -x "$(command -v bat)" ]; then
	alias b='bat'
	q() {
		"$@" --help 2>&1 | bat --plain --language=help
	}
else
	q() {
		"$@" --help 2>&1 | $PAGER
	}
fi
complete -c q

# ======================= functions =======================
cg() {
	# cd to git root

	# Look in parent directories
	path=$(cd .. && git rev-parse --show-toplevel 2>/dev/null)

	# Look in child directories
	if [[ -z $path ]]; then
		path=$(find . -mindepth 2 -maxdepth 2 -type d -name .git 2>/dev/null)
		if [[ $(echo "$path" | wc -l) -gt 1 ]]; then
			echo 'Multiple repositories found:' >&2
			echo "$path" | sed 's/^.\//  /g; s/.git$//g' >&2
			return 2
		else
			path=${path%/.git}
		fi
	fi

	# Go to the directory, if found
	if [[ -z $path ]]; then
		echo 'No Git repository found in parent directories' >&2
		return 1
	fi

	cd "$path" || echo "Failed to navigate to path"
}

# open a file in kate for editing
# if the current user has write access to the file, open kate as user
# if the current user does not, it'll open the file in kate with sudoedit
skate() {
	# file passed down from input
	fileToEdit="$1"
	fileOrPathToCheck="$fileToEdit"

	# if the file does not exist
	if [[ ! -f "$fileOrPathToCheck" ]]
	then
		# we need to check the folder
		fileOrPathToCheck=$(dirname "$fileOrPathToCheck")
	fi

	# if the file or folder can be written to by the current user
	if [[ -r "$fileOrPathToCheck" && -w "$fileOrPathToCheck" ]]
	then
		# just open with kate
		kate "$fileToEdit"
	else
		# else open with kate using sudoedit
		temp_vis=$VISUAL
		export VISUAL="kate -b"
		sudoedit "$fileToEdit"
		export VISUAL=$temp_vis
	fi
}

# change dir and list contents
function cl () {
   if [ $# = 0 ]; then
      cd && dir
   else
      cd "$*" && dir
   fi
}

complete -d cl

# Create directory path and cd into it
unalias md  # remove default alias in some distros (opensuse)
function md() {
	mkdir -p -- "$1"
	cd -P -- "$1" || echo "Failed to navigate to path"
	dir
}

# all-in-one informative function
show() {
	if [ ! "$1" ]; then
		dir .
	elif [ -d "$1" ]; then
		dir "$*"
	elif [ -f "$1" ]; then
		if command -v bat; then
			bat "$*"
		else
			cat "$*"
		fi
	elif\
		[ "$(type -t "$1")" = "function" ] ||\
		[ "$(type -t "$1")" = "keyword" ] ||\
		[ "$(type -t "$1")" = "builtin" ]; then
		command -V "$1"
		tldr --pager "$1"
	elif [ "$(type -t "$1")" = "alias" ] || [ "$(type -t "$1")" = "file" ]; then
		which -a "$1"
		tldr --pager "$1"
	elif [ ! -a "$1" ]; then
		echo "file not found"
	else
		echo "fix me"
	fi
}
complete -o default show

# =================== package management aliases ====================
# TODO: make dynamic
# install most recently searched for package
#alias in="fc -s 'dnf list'='sudo dnf install'"
#alias ins="fc -s 'dnf search'='sudo dnf install'"
# alias in="fc -s 'zypper se'='sudo zypper install'"
# alias ins="fc -s 'zypper se'='sudo zypper install'"
# alias      search='dnf search --color=always'
# alias         aar='sudo add-apt-repository'
alias zse='zypper --no-refresh search' # faster zypper search
alias zin='sudo zypper --no-refresh install'  # bit faster like apt
alias zrm='sudo zypper remove --clean-deps'
alias zlu='sudo zypper list-updates'  # mostly unnecessary, but consistency
alias zup='zupdate & systemctl reboot'
alias zupdown='zupdate & systemctl poweroff'
alias zupdate='sudo zypper dup -y | tee /dev/tty | grep "^Retrieving:" |\
	sed "s/Retrieving: //g" | sort -o ~/Desktop/recent-updates-zypp.txt &&\
	flatpak update --noninteractive\ | grep "^Updating app"
	>> ~/Desktop/recent-updates-flatpak.txt &&\
	timeout -v 60s plasma-discover --backends kns-backend --headless-update
	>> ~/Desktop/recent-updates-knewstuff.txt'
	# echo $? >> ~/Desktop/recent-updates-knewstuff.txt'
	# tee /dev/tty prints to stdout as well as terminal
	# timeout is useful as discover hangs if there are no updates maybe?
alias zypp-hist='sudo cut -d "|" -f 1-4 -s --output-delimiter " | "\
	/var/log/zypp/history | grep -v " radd "'
	# allows e.g. zypp-hist | tail or zypp-hist | grep '^2021-11-23 08:'`

# ============= completions for zypper aliases ===========
if [[ -f "/usr/share/bash-completion/completions/zypper" ]]; then
	# https://linux.die.net/man/1/bash#:~:text=complete%20%5B%2Dabcdefgjksuv
	source "/usr/share/bash-completion/completions/zypper"
	# import existing completion functions if they exist
	_list_available() {
		# call internal function to get list of available
		# (from /var/cache/zypp/solv/*/solv.idx ?) and assign to completion reply
		cur=${COMP_WORDS[COMP_CWORD]}
		# if i quote them it breaks colour highlighting:
		# shellcheck disable=SC2206,SC2207
		opts=(${opts[@]}$(echo; _available_packages ))
		# shellcheck disable=SC2086,SC2207
		COMPREPLY=($(compgen -W "${opts[*]}" -- ${cur}))
	}
	_list_installed() {
		# call internal function to get list of installed
		# (from /var/cache/zypp/solv/@System/solv.idx) and assign
		cur=${COMP_WORDS[COMP_CWORD]}
		# shellcheck disable=SC2206,SC2207
		opts=(${opts[@]}$(echo; _installed_packages ))
		# shellcheck disable=SC2086,SC2207
		COMPREPLY=($(compgen -W "${opts[*]}" -- ${cur}))
	}
	# assign completion from above functions
	complete -F _list_available -o default zin
	complete -F _list_available -o default zse

	complete -F _list_installed -c zrm
else
	# fallback to inbuilt list of packages option
	complete -c zrm
fi
