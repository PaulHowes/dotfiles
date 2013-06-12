# Enables Git command line completion.
GIT_COMPLETION_SCRIPT=/usr/local/opt/git/etc/bash_completion.d/git-completion.bash
if [ -e ${GIT_COMPLETION_SCRIPT} ]
then
  source ${GIT_COMPLETION_SCRIPT}
fi

# Adds Git information to the shell prompt.
GIT_PROMPT=/usr/local/opt/git/etc/bash_completion.d/git-prompt.sh
if [ -e ${GIT_PROMPT} ]
then
  GIT_PS1_SHOWDIRTYSTATE=1
  GIT_PS1_SHOWSTASHSTATE=1
  GIT_PS1_SHOWUNTRACKEDFILES=1
  source ${GIT_PROMPT}
  PS1='[\w$(__git_ps1 " (%s)")]\$ '
fi

