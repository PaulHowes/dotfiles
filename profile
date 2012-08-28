# Adds /usr/local/bin to the beginning of $PATH
LOCAL_BIN=/usr/local/bin
if [ -e ${LOCAL_BIN} ]
then
  export PATH=${LOCAL_BIN}:${PATH}
fi

# Enables Git command line completion and update the shell prompt.
GIT_COMPLETION_SCRIPT=/usr/local/etc/bash_completion.d/git-completion.bash
if [ -e ${GIT_COMPLETION_SCRIPT} ]
then
  GIT_PS1_SHOWDIRTYSTATE=1
  GIT_PS1_SHOWSTASHSTATE=1
  GIT_PS1_SHOWUNTRACKEDFILES=1
  source ${GIT_COMPLETION_SCRIPT}
  PS1='[\w$(__git_ps1 " (%s)")]\$ '
fi

# Enables access to Node.js modules globally installed with NPM
NODE_PATH=/usr/local/lib/node_modules
if [ -e ${NODE_PATH} ]
then
  export NODE_PATH
fi

# Puts Homebrew's version of Ruby first on the path.  This is necessary only
# because gems install their programs to Ruby's `bin` directory and not
# `/usr/local/bin`.  With Homebrew we'd have to do a `brew unlink ruby` and
# `brew link ruby` to keep `/usr/local/bin` up-to-date.
RUBY_BIN=/usr/local/Cellar/ruby/1.9.3-p194/bin
if [ -e ${RUBY_BIN} ]
then
  export PATH=${RUBY_BIN}:${PATH}
fi

