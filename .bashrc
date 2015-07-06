# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific alises and functions
if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Default
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi

# User specific environment and startup programs
export EDITOR=vim
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/bin:$GOPATH/bin

UNAME=`uname`

if [ $UNAME == "Linux" ]; then
  export JAVA_HOME=/usr/java/latest
elif [ $UNAME == "Darwin" ]; then
  export JAVA_HOME="$(/usr/libexec/java_home)"
fi

# Load GIT bash prompt
. ~/.git-prompt.sh
. ~/.bash_prompt

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
