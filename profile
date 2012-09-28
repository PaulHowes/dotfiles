# Adds /usr/local/bin to the beginning of $PATH
LOCAL_BIN=/usr/local/bin
if [ -e ${LOCAL_BIN} ]
then
  export PATH=${LOCAL_BIN}:${PATH}
fi

# Pulls in local configuration items.  Use this file to customize the
# environment to taste.
LOCAL_PROFILE=${HOME}/.profile_local
if [ -e ${LOCAL_PROFILE} ]
then
  source ${LOCAL_PROFILE}
fi
