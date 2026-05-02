# Secure PATH (for opensuse)
sbin_path="/usr/sbin"
if [ -d "$sbin_path" ] && ! [[ "$PATH" == *"$sbin_path"* ]]; then
	export PATH="$PATH:$sbin_path"
fi

# User specific environment
local_path="$HOME/.local/bin"
if [ -d "$local_path" ] && ! [[ "$PATH" == *"$local_path"* ]]; then
	export PATH="$PATH:$local_path"
fi
scripts_path="$HOME/Scripts"
if [ -d "$scripts_path" ] && ! [[ "$PATH" == *"$scripts_path"* ]]; then
	export PATH="$PATH:$scripts_path"
fi

# -b anchors to terminal, works better with sudoedit
export EDITOR=micro
export VISUAL="kate -b"
export SUDO_EDITOR=micro

if  [ -x "$(command -v bat)" ]; then
	# /!\ see also bat section in 30_aliases
	export PAGER="bat -p"
	export MANPAGER="bat -plman"
	export BAT_THEME=ansi
	# export BAT_STYLE="changes,header,grid,rule"
fi

	# * default: enables recommended style components (default).
	# * full: enables all available components.
	# * auto: same as 'default', unless the output is piped.
	# * plain: disables all available components.
	# * changes: show Git modification markers.
	# * header: alias for 'header-filename'.
	# * header-filename: show filenames before the content.
	# * header-filesize: show file sizes before the content.
	# * grid: vertical/horizontal lines to separate side bar
	#         and the header from the content.
	# * rule: horizontal lines to delimit files.
	# * numbers: show line numbers in the side bar.
	# * snip: draw separation lines between distinct line ranges.

	# https://www.topbug.net/blog/2016/09/27/make-gnu-less-more-powerful/

# show first man page rather than list of options
# (default except for opensuse)
export MAN_POSIXLY_CORRECT=1

export GEM_HOME=$HOME/.local/gems

# god knows what this was all about
# export PATH=$(echo $PATH | tr ":" "\n" | grep -v "/.local/bin" | tr "\n" ":" | sed s/.$//)
# export PATH=$PATH:$HOME/.local/bin

# always use gtk file picker &c
export GTK_USE_PORTAL=1
