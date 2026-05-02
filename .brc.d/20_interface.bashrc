
# if shell invocation includes "i" (i.e. is interactive)
[[ $- == *i* ]] && printf "%b" "\e]2;Welcome, ~Zeus\a"

export PROMPT_DIRTRIM=3  # show max 3 dirs or ellipsise in middle
# export SUDO_PS1="you are in sudo >"
#
# # returns yakuake or konsole
# if
# 	[ "$(basename $(ps -o 'cmd=' -p $(ps -o 'ppid=' -p $$)))" = 'yakuake' ]
# then
# 	export USE_FULL_PROMPT="true"
# else
# 	export USE_FULL_PROMPT="false"
# fi

# two line prompt in yakuake and single line (with dirtrim) in konsole?
# i can't make it look good, but it might be a nice idea
# if yakuake
# 	USE_MULTILINE_PROMPT=true
#
# if ($USE_MULTILINE_PROMPT)
# 	calculate multiline
# else
# 	single-line
#
# then i can technically change it on-the-fly

_time_clr='\[\033[37m\]'  # dim grey
_gitb_clr='\[\033[32m\]'  # green (not used, set in _git_b function)
_path_clr='\[\033[34m\]'  # blue
_peso_clr='\[\033[36m\]'  # cyan
_root_clr='\[\033[31m\]'  # red (not used)
_clear='\[\033[0m\]'   # clear formatting

# display the current git branch in the bash prompt
_git_b() {
	if [ -d .git ] ; then  # yellow ↓
		printf "%s" "[$(tput setaf 3)$(git branch 2> /dev/null | awk '/\*/{print $2}')$(tput sgr0)]";
	fi
}

# display exit status if non-zero
_err() {
	_errno=$?
	if [ $_errno != 0 ]; then
		printf "%b" "\e[31mCommand exited with error \e[1m$_errno\e[0m"
		printf "%b" "\n"
		# if using directly in PS1, there MUST be a character after \n for some
		# reason? so \r (carriage return) works well enough
		# printf "%b" "\n\r"  # there MUST be a character after \n for some reason?
	fi
	unset _errno
}

_time="${_time_clr}[\t]"  # \A is 24h, \@ is 12h, \t \T is with seconds
_peso="${_peso_clr}\\$"    # "#" if root, "$" otherwise
_path="${_path_clr}\w"    # \w respects PROMPT_DIRTRIM, \W doesn't
_prmt="${_clear}> "    # prompt character (including whitespace & format clear)

# almost certainly superfluous, here for compatibility
# https://askubuntu.com/questions/372849/
_chroot=${debian_chroot:+($debian_chroot)}

# use PROMPT_COMMAND instead of PS1 for multiline as it sometimes incorrectly
# calculates prompt length otherwise (bash bug with colours?)
PROMPT_COMMAND="_err"
# {} are just for readability
PS1="${_time}${_peso} "'$(_git_b)'"${_path}${_prmt}"

unset _time_clr _gitb_clr _path_clr _peso_clr _root_clr _clear
unset _time _peso _path _prmt _chroot

#
# # Set the prompt.
# bash_prompt() {
# 	# shellcheck disable=SC2154,SC2125
	# PS1='$(_exit_status)'${_chroot}$_dg${_time}$_gr'$(_git_b)'\$' \w'\\[\\033[36m\\]'> '\\[\\033[00m\\]
# 	# shellcheck disable=SC2154,SC2125
# 	PS2=\\[\\033[34m\\]'next line '\\[\\033[36m\\]'> '\\[\\033[00m\\]
# }
#
# bash_prompt
# TODO https://wiki.archlinux.org/title/Bash/Prompt_customization#PROMPT_COMMAND

# define and display intro logo
greeting () {

# ======== greeting =======
# "&&": right only executed when left is true,
# "||": right only executed when left is false
# [[ $- == *i* ]]: true when shell is interactive
# https://bash.cyberciti.biz/guide/$-

	# shellcheck disable=SC2016
 	# colours get expanded in printf

 	# terminal 8-colour yellow
# 	local coloured_greeting='\e[1m
#  \e[43;30m   `Y***L      \e[0;1m
# \e[43;30m      `Y**L. _   \e[0;1m
# \e[43;30m      ,J>7*^ ~ ^ \e[0;93m ^^7  __  _ _  _ \e[0;1m
# \e[43;30m  .=|,`YL        \e[0;93m  7  J__L U U C_`\e[0;1m
#  \e[43;30m      .`L -.   \e[0;93m  J__ 4__, 4_7 ,_)
# \e[0;33m===================================\e[0m
#'

	# ansi pink horizontal stripes w/ box-drawing chars for sides
	# 38;5;<colour> for ansi foreground, 48 for background, \e[1m at start for bold (0 for normal)
	local coloured_greeting='\e[1m
   \e[38;5;221;48;5;0m🭅\e[38;5;16;48;5;221m  `Y888L       \e[0;38;5;221m🭡\e[0;1m
  \e[38;5;215;48;5;0m🭋\e[38;5;16;48;5;215m     `Y88L._    \e[0;38;5;215m🭛\e[1;38;5;215m  ____            \e[0;1m
  \e[38;5;209;48;5;0m🭅\e[38;5;16;48;5;209m     ,J888y8F> \e[0;38;5;209m🭡\e[1;38;5;209m  /_  /___ __ _____\e[0;1m
 \e[38;5;203;48;5;0m🭋\e[38;5;16;48;5;203m  .tAb`Y8*`     \e[0;38;5;203m🭛\e[1;38;5;203m  ,*,*/ -_) // (_-<\e[0;1m
 \e[38;5;197;48;5;0m🭅\e[38;5;16;48;5;197m       -`l=.   \e[0;38;5;197m🭡\e[1;38;5;197m  /_,_*~._/\_,_/___/
\e[0;38;5;161m=======================`\e[1;38;5;197m*~,__7\e[0;38;5;161m=========\e[0m

'

# 	# ansi orange horizontal stripes
# 	local coloured_greeting='\e[1m
#   \e[38;5;16;48;5;220m   `Y***L      \e[0;1m
#  \e[38;5;16;48;5;214m      `Y**L. _   \e[0;1m
#  \e[38;5;16;48;5;208m      ,J>7*^ W > \e[0;38;5;222m ^^7  __  _ _  _ \e[0;1m
#  \e[38;5;16;48;5;202m  .=|,`YL        \e[0;38;5;216m  7  J__L U U C_`\e[0;1m
#   \e[38;5;16;48;5;196m      .`L -.   \e[0;38;5;210m  J__ 4__, 4_7 ,_)
# \e[0;38;5;208m====================================\e[0m
# '

	printf "%b" "$coloured_greeting"  # %b evaluate colours in output

	TERMINAL_EMULATOR="$(basename $(ps -o 'cmd=' -p $(ps -o 'ppid=' -p $$)))"
	if [ -n "$TERMINAL_EMULATOR" ]; then
		printf "%b\n" "\e[35mWelcome to $TERMINAL_EMULATOR, Zeus\e[0m"
	fi

	if command -v fortune > /dev/null 2>&1; then
		printf "%b\n\n" "\e[94m$(fortune -as)\e[0m"
	fi
}
[[ $- == *i* ]] && greeting
