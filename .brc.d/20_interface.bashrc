# ======== greeting =======
# "&&": right only executed when left is true,
# "||": right only executed when left is false
# [[ $- == *i* ]]: true when shell is interactive
# https://bash.cyberciti.biz/guide/$-

greeting () {

	#     `Y***L
	#       `Y**L. _
	#       ,J>7*^ ~ ^  ^^7  __  _ _  _
	#   .=|,`YL          7  J__L U U C_`
	#        .`L -.     J__ 4__, 4_7 ,_)
	# ===================================

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

	# ansi orange plain (38;5 / 48;5 are to process ansi-256 colours)
# 	local coloured_greeting='\e[1m
#   \e[38;5;16;48;5;208m   `Y***L      \e[0;1m
#  \e[38;5;16;48;5;208m      `Y**L. _   \e[0;1m
#  \e[38;5;16;48;5;208m      ,J>7*^ W > \e[0;38;5;214m ^^7  __  _ _  _ \e[0;1m
#  \e[38;5;16;48;5;208m  .=|,`YL        \e[0;38;5;214m  7  J__L U U C_`\e[0;1m
#   \e[38;5;16;48;5;208m      .`L -.   \e[0;38;5;214m  J__ 4__, 4_7 ,_)
# \e[0;38;5;208m====================================\e[0m
# '

	# ansi orange horizontal stripes w/ box-drawing chars for sides
# 	local coloured_greeting='\e[1m
#    \e[38;5;220;48;5;0m🭅\e[38;5;16;48;5;220m `Y***L       \e[0;38;5;220m🭡\e[0;1m
#   \e[38;5;214;48;5;0m🭋\e[38;5;16;48;5;214m    `Y**L. _   \e[0;38;5;214m🭛\e[0;38;5;228m ____            \e[0;1m
#   \e[38;5;208;48;5;0m🭅\e[38;5;16;48;5;208m    ,J>7*^ W >\e[0;38;5;208m🭡\e[0;38;5;222m /_  /___ __ _____\e[0;1m
#  \e[38;5;202;48;5;0m🭋\e[38;5;16;48;5;202m .=|,`YL       \e[0;38;5;202m🭛\e[0;38;5;216m ,*,*/ -_) // (_-<\e[0;1m
#  \e[38;5;160;48;5;0m🭅\e[38;5;16;48;5;160m      .`L -.  \e[0;38;5;160m🭡\e[0;38;5;203m /_,_*~._/\_,_/___/
# \e[0;38;5;124m=====================`*~,__7=========\e[0m
#
# '

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

# 	# ansi pink horizontal stripes w/ box-drawing chars for sides
# 	# 38;5;<colour> for ansi foreground, 48 for background, \e[1m at start for bold (0 for normal)
# 	local coloured_greeting='\e[0m
#    \e[38;5;221;48;5;0m🭅\e[38;5;16;48;5;221m   🭥🭒███🭐       \e[0;38;5;221m🭡\e[0;1m
#   \e[38;5;215;48;5;0m🭋\e[38;5;16;48;5;215m     🭢🭕███🭀      \e[0;38;5;215m🭛\e[1;38;5;215m ____            \e[0;1m
#   \e[38;5;209;48;5;0m🭅\e[38;5;16;48;5;209m    🭈🭆🭂███\e[38;5;209;48;5;16m🯕\e[38;5;16;48;5;209m█🭛🬽  \e[0;38;5;209m🭡\e[1;38;5;209m /_  /___ __ _____\e[0;1m
#  \e[38;5;203;48;5;0m🭋\e[38;5;16;48;5;203m  🭈🭆🭂\e[38;5;203;48;5;16m🯒🯓\e[38;5;16;48;5;203m██🭞🭜🭘     \e[0;38;5;203m🭛\e[1;38;5;203m ,*,*/ -_) // (_-<\e[0;1m
#  \e[38;5;197;48;5;0m🭅\e[38;5;16;48;5;197m       🭢🭕🭀🬽     \e[0;38;5;197m🭡\e[1;38;5;197m /_,_*~._/\_,_/___/
# \e[0;38;5;161m=======================`\e[1;38;5;197m*~,__7\e[0;38;5;161m=========\e[0m
#
# '

	# ansi orange horizontal stripes w/out lighter text
# 	local coloured_greeting='\e[1m
#    \e[38;5;220;48;5;0m🭅\e[38;5;16;48;5;220m  `Y***L        \e[0;38;5;220m🭡\e[0;1m
#   \e[38;5;214;48;5;0m🭋\e[38;5;16;48;5;214m     `Y**L. _    \e[0;38;5;214m🭛\e[0;38;5;214m ____            \e[0;1m
#   \e[38;5;208;48;5;0m🭅\e[38;5;16;48;5;208m     ,J>7*^ W > \e[0;38;5;208m🭡\e[0;38;5;214m /_  /___ __ _____\e[0;1m
#  \e[38;5;202;48;5;0m🭋\e[38;5;16;48;5;202m  .=|,`YL        \e[0;38;5;202m🭛\e[0;38;5;208m ,*,*/ -_) // (_-<\e[0;1m
#  \e[38;5;196;48;5;0m🭅\e[38;5;16;48;5;196m       .`L -.   \e[0;38;5;196m🭡\e[0;38;5;202m /_,_*~._/\_,_/___/
# \e[0;38;5;160m=======================\e[0;38;5;202m`*~,__7\e[0;38;5;160m=========\e[0m
#
# '
#
# 	# ansi orange horizontal stripes
# 	local coloured_greeting='\e[1m
#   \e[38;5;16;48;5;220m   `Y***L      \e[0;1m
#  \e[38;5;16;48;5;214m      `Y**L. _   \e[0;1m
#  \e[38;5;16;48;5;208m      ,J>7*^ W > \e[0;38;5;222m ^^7  __  _ _  _ \e[0;1m
#  \e[38;5;16;48;5;202m  .=|,`YL        \e[0;38;5;216m  7  J__L U U C_`\e[0;1m
#   \e[38;5;16;48;5;196m      .`L -.   \e[0;38;5;210m  J__ 4__, 4_7 ,_)
# \e[0;38;5;208m====================================\e[0m
# '

	# ansi orange diagonal blocks
# 	local coloured_greeting='\e[1m
#   \e[38;5;16;48;5;220m   `Y*\e[48;5;214m**L  \e[48;5;208m    \e[0;1m
#  \e[38;5;16;48;5;220m    \e[48;5;214m  `Y*\e[48;5;208m*L. _\e[48;5;202m   \e[0;1m
#  \e[38;5;16;48;5;220m \e[48;5;214m     \e[48;5;208m,J>7*\e[48;5;202m^ W >\e[48;5;196m \e[0;38;5;214m ^^7  __  _ _  _ \e[0;1m
#  \e[38;5;16;48;5;214m  .\e[48;5;208m=|,`Y\e[48;5;202mL    \e[48;5;196m    \e[0;38;5;214m  7  J__L U U C_`\e[0;1m
#   \e[38;5;16;48;5;208m     \e[48;5;202m .`L \e[48;5;196m-.   \e[0;38;5;214m  J__ 4__, 4_7 ,_)
# \e[0;38;5;208m====================================\e[0m
# '

	printf "%b" "$coloured_greeting"  # %b evaluate colours in output
	if command -v fortune > /dev/null 2>&1; then
		printf "%b" "\e[0;94m$(fortune -as)\n\e[0m"
	fi
}

# if shell invocation includes "i" (i.e. is interactive)
[[ $- == *i* ]] && greeting

# Display the current Git branch in the Bash prompt.
function git_branch() {
	if [ -d .git ] ; then
		printf "%s" "[$(git branch 2> /dev/null | awk '/\*/{print $2}')]";
	fi
}

digits=("🯰" "🯱" "🯲" "🯳" "🯴" "🯵" "🯶" "🯷" "🯸" "🯹")

function replace_digits() {
	printf "%b" "$(echo "$1" | sed 's/0/🯰/g; s/1/🯱/g; s/2/🯲/g; s/3/🯳/g; s/4/🯴/g; s/5/🯵/g; s/6/🯶/g; s/7/🯷/g; s/8/🯸/g; s/9/🯹/g; s/:/:/g')"
}

# Set the prompt.
function bash_prompt(){
	# shellcheck disable=SC2154,SC2125
	PS1='${debian_chroot:+($debian_chroot)}'\\[\\033[37m\\]\[\\A\]\\[\\033[32m\\]'$(git_branch)'\$\\[\\033[34m\\]' \w'\\[\\033[36m\\]'> '\\[\\033[00m\\]
	# shellcheck disable=SC2154,SC2125
	PS2=\\[\\033[34m\\]'next line '\\[\\033[36m\\]'> '\\[\\033[00m\\]
}

bash_prompt
