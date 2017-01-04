# The `ls` command included with GNU coreutils (brew install coreutils) will
# sort output by version. That is used to retrieve the latest version of the
# JDK installed on the system. This is used to form the path in ${JAVA_HOME}.
# If `gls` cannot be found, the system `ls` is used, but may not accurately
# sort the names.

ls_command() {
  command -v gls > /dev/null
  if [ $? == '0' ]; then
    echo 'gls'
  else
    echo 'ls'
  fi
}

JDK_ROOT='/Library/Java/JavaVirtualMachines'
JDK_NAME=$($(ls_command) -1 -v ${JDK_ROOT} | tail -1)

export JAVA_HOME="${JDK_ROOT}/${JDK_NAME}/Contents/Home"
export PATH=${JAVA_HOME}/bin:${PATH}

