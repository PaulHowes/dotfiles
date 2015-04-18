# Adds the path Homebrew expects gems to be installed into.
RUBY_BIN=/usr/local/opt/ruby/bin
if [ -e ${RUBY_BIN} ]
then
  export PATH=${RUBY_BIN}:${PATH}
fi

# Adds the user's local gem 'bin' directory to the path.
if which ruby >/dev/null && which gem >/dev/null; then
  PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
