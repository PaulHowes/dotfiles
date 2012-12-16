# Adds /usr/local/bin to the beginning of $PATH
LOCAL_BIN=/usr/local/bin
if [ -e ${LOCAL_BIN} ]
then
  export PATH=${LOCAL_BIN}:${PATH}
fi

# Enables access to Node.js modules globally installed with NPM
NODE_PATH=/usr/local/lib/node_modules
if [ -e ${NODE_PATH} ]
then
  export NODE_PATH
fi

LOCAL_PROFILE=${HOME}/.profile_local
if [ -e ${LOCAL_PROFILE} ]
then
  source ${LOCAL_PROFILE}
fi
