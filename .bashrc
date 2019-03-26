#
# Bash configuration file
#
# @author	Mykola Odnosumov
# @date		2018-08-15

# Autocomplete (need bash-completion package)
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
	. /usr/share/bash-completion/bash_completion

if ! [ $ZSH ]; then

	# Prompt Related
	normal="\[\e[0m\]";
	red="\[\e[31m\]";
	green="\[\e[32m\]";
	blue="\[\e[34m\]";

	user_host_part="[$red\u$normal@$blue\h$normal]";
	path_part="$normal[$green\W$normal]";
	export PS1="$user_host_part $path_part \$ ";

fi

# History
export HISTFILESIZE=10000;
alias h='history';

# Custom Variables
export MAIL="modnosum@gmail.com";
export EDITOR=vim;
export VISUAL=$EDITOR;
if [[ -d $HOME/.brew ]]; then
	export PATH=$HOME/.brew/bin:$PATH;
fi

# Pip-related
export PATH=$HOME/.local/bin:$PATH;

# Cleaning Files
export CLEAN_DEPTH=4;
alias clean='find . -maxdepth $CLEAN_DEPTH -type f \( -name "*~" -o -name "#*#" \) -print -delete 2> /dev/null';

if ! [ $ZSH ]; then
	# Listing Files
	if ls --color &> /dev/null; then
		alias ls='ls --color=auto';
	elif ls -G &> /dev/null; then
		alias ls='ls -G';
	fi
fi

alias la='ls -al';
alias l='la';
alias ll='ls -l';
alias lh='ls -al --ignore="[A-Za-z]*"';

# Opening Files
if command -v xdg-open &> /dev/null; then
	alias op='xdg-open';
	XDG_OPEN_ENABLED=1;
elif command -v open &> /dev/null; then
	alias op='open';
	OPEN_ENABLED=1;
fi

if ! [ $ZSH ]; then

	# Git Related
	alias gaa='git add --all';
	alias ga='git add';
	alias gba='git branch --all';
	alias gbd='git branch -d';
	alias gbD='git branch -D';
	alias gb='git branch';
	alias gcm='git commit';
	alias gcmsg='git commit --message';
	alias gcof='git checkout --';
	alias gcob='git checkout --track';
	alias gco='git checkout';
	alias gd='git diff';
	alias gdc='git diff --cached';
	alias gh='git push';
	alias glg='git log';
	alias gl='git pull';
	alias gr='git remote';
	alias grv='git remote -v';
	alias gst='git status';

fi

# 42 Related
alias 42='bash $HOME/.42FileChecker/42FileChecker.sh';

# Configuration related
alias re_bash='. $HOME/.bashrc';
alias ed_bash='$EDITOR $HOME/.bashrc';

# CMake related
alias ccmake='rm -fr CMakeFiles CMakeCache.txt cmake_install.txt Makefile';
