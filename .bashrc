#source /Users/misa/perl5/perlbrew/etc/bashrc
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# added by travis gem
[ -f /Users/misa/.travis/travis.sh ] && source /Users/misa/.travis/travis.sh
