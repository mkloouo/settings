# zsh configuration
export SHELL=zsh;

# load common configuration
source $HOME/.settings/.commonrc;

# oh-my-zsh configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# mykola odnosumov configuration

# nvm
export NVM_DIR="$HOME/.nvm";
# This loads nvm
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh";
# This loads nvm bash_completion
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm";  

# add custom scripts dir
export PATH=~/Scripts:$PATH;

# openjdk
# sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/openjdk/include";

# android
export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk";
export ANDROID_HOME=$ANDROID_SDK_ROOT;
export PATH="$ANDROID_HOME/platform-tools:$PATH";

# qt5
export PATH="/usr/local/opt/qt/bin:$PATH";
export LDFLAGS="$LDFLAGS -L/usr/local/opt/qt/lib";
export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/qt/include";

# other git aliases
alias grsa='git restore --staged';

