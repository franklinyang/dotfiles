# adding arcanist to path
export PATH="${PATH}:~/code/infra/arcanist/bin"
# setting vim as default editor
export EDITOR="vim"
# setting 256 colors
export TERM="xterm-256color"

# shortcuts
alias gtb="fhenv; cd ~/code/flatiron/blocks/blocks"
alias gtf="fhenv; cd ~/code/flatiron"
alias p="BLOCKS_ISOLATION=1 BLOCKS_MAKE_FLAGS=-j8"
alias fhenv="source ~/code/env/bin/activate"
alias rcenv="source ~/code/rcenv/bin/activate"
alias ls="ls -G"
alias psqlstart="pg_ctl -D /usr/local/var/postgres start"
alias app="python -m analytics_portal.app"

# git completion
source ~/.git-completion.bash
parse_git_branch() {
   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if [ -f /etc/bash_completion.d/git ] ; then
    . /etc/bash_completion.d/git
fi
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    . /usr/local/etc/bash_completion.d/git-completion.bash
fi
if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
    . /usr/local/etc/bash_completion.d/git-prompt.sh
fi

function set_prompt() {
  if [[ `/usr/bin/id -u` == 0 ]] ; then
    local PROMPT_TAIL='\[\e[31;1m\]\u@\h\[\e[0m\]:\[\e[34;1m\]\w \$ \[\e[0m\]'
  elif type __git_ps1 2>/dev/null | grep -q function; then
    local PROMPT_TAIL='\[\e[32;1m\]\u@\h\[\e[0m\]:\[\e[34;1m\]\w\[\e[35;1m\]$(__git_ps1)\[\e[34;1m\] \$ \[\e[0m\]'
  else
    local PROMPT_TAIL='\[\e[32;1m\]\u@\h\[\e[0m\]:\[\e[34;1m\]\w\[\e[35;1m\]\[\e[34;1m\] \$ \[\e[0m\]'
  fi
  local PROMPT_HEAD='\[\e]0;\u@\h:\w\a\]'

  # if first argument is --no-dynamic then don't change terminal title
  if [ "$1" = "--no-dynamic" ] ; then
    PS1=${PROMPT_TAIL}
    shift
    if [ -n "$*" ] ; then
      echo -ne "\033]0;$*\007"
    fi
  else
    PS1="${PROMPT_HEAD}${PROMPT_TAIL}"
  fi
  export PS1
}

set_prompt

alias hold_title='set_prompt --no-dynamic'
alias set_title='set_prompt --no-dynamic $*'

# set up bash prompt
export PS1='\u \W\[\033[33m\] \$`parse_git_branch` >\[\033[00m\] '

# set up BLOCKS_MSSQL_CONNECTS
export BLOCKS_MSSQL_CONNECTS="$HOME/.mssql_connections.yaml"
