# Secure PATH (for opensuse)
SBIN_PATH="/sbin"
if [ -d "$SBIN_PATH" ] && ! [[ "$PATH" =~ "$SBIN_PATH" ]]; then
	export PATH="$PATH:$SBIN_PATH"
fi

# User specific environment
LOCAL_PATH="$HOME/.local/bin"
if [ -d "$LOCAL_PATH" ] && ! [[ "$PATH" =~ "$LOCAL_PATH" ]]; then
	export PATH="$PATH:$LOCAL_PATH"
fi
# export PATH

# -b anchors to terminal, works better with sudoedit
export EDITOR=micro
export VISUAL="kate -b"
export SUDO_EDITOR="kwrite"

# show first man page rather than list of options
# (default except for opensuse)
export MAN_POSIXLY_CORRECT=1

export GEM_HOME=$HOME/.local/gems

# god knows what this was all about
# export PATH=$(echo $PATH | tr ":" "\n" | grep -v "/.local/bin" | tr "\n" ":" | sed s/.$//)
# export PATH=$PATH:$HOME/.local/bin

# always use gtk file picker &c
export GTK_USE_PORTAL=1
