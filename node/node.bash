# Enables access to Node.js modules globally installed with NPM                 
NODE_PATH=/usr/local/share/npm/lib/node_modules
if [ -d ${NODE_PATH} ]
then
  export NODE_PATH
fi                                                                              

# Put NPM's bin directory in the path.
NPM_PATH=/usr/local/share/npm/bin
if [ -d ${NPM_PATH} ]
then
  export PATH=${NPM_PATH}:${PATH}
fi

