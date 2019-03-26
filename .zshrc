# 
# Zsh configuration file
#
# @author	Mykola Odnosumov
# @date		2018-08-15

export ZSH="/home/modnosumov/.oh-my-zsh";

ZSH_THEME="robbyrussell";

HYPHEN_INSENSITIVE="true";
ENABLE_CORRECTION="true";
COMPLETION_WAITING_DOTS="true";

HIST_STAMPS="mm/dd/yyyy";

plugins=(git);

source $ZSH/oh-my-zsh.sh;
source $HOME/.bashrc;
