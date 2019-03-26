#
# Bash configuration file
#
# @author	Mykola Odnosumov
# @date		2018-08-15

# Autocomplete (need bash-completion package)
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
	. /usr/share/bash-completion/bash_completion

# Prompt Related
normal="\[\e[0m\]";
red="\[\e[31m\]";
green="\[\e[32m\]";
blue="\[\e[34m\]";

user_host_part="[$red\u$normal@$blue\h$normal]";
path_part="$normal[$green\W$normal]";
export PS1="$user_host_part $path_part \$ ";

# Listing Files
if ls --color &> /dev/null; then
	alias ls='ls --color=auto';
elif ls -G &> /dev/null; then
	alias ls='ls -G';
fi

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

export SHELL=bash;
source $HOME/settings/.commrc;
