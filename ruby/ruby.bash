# Adds the path Homebrew expects gems to be installed into.
RUBY_BIN=/usr/local/opt/ruby/bin
if [ -e ${RUBY_BIN} ]
then
  export PATH=${RUBY_BIN}:${PATH}
fi

