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
HNAS_ENV=$HNAS_SCRIPTS_DIR/env
if [[ -f $HNAS_ENV ]]; then
    source $HNAS_ENV
    PATH=$HNAS_SCRIPTS_DIR/scripts:$PATH
fi
