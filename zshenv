export EDITOR=vim

# local path
if [[ $OSTYPE == 'cygwin' ]]; then
    PATH=/usr/bin:$PATH
fi
PATH=/usr/local/bin:$PATH
# Superuser locations
PATH=/sbin:/usr/sbin:/usr/local/sbin:$PATH
# Home directory paths 
PATH=$HOME/bin:$HOME/.local/bin:$PATH
PATH=$HOME/.gem/ruby/1.9.1/bin:$PATH

# HNAS scripts directory location
HNAS_SCRIPTS_DIR=$HOME/.zsh/hnas-scripts 
if [[ $(id -u ) != $(id -u root 2>/dev/null) && -d $HNAS_SCRIPTS_DIR ]]; then
    source ~/.zsh/hnas-scripts/env
    PATH=$HNAS_SCRIPTS_DIR/scripts:$PATH
fi
