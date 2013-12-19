export EDITOR=vim

# Superuser locations
PATH=/sbin:/usr/sbin:/usr/local/sbin:$PATH
# Home directory paths 
PATH=$HOME/bin:$HOME/.local/bin:$PATH
PATH=$HOME/.gem/ruby/1.9.1/bin:$PATH

# HNAS scripts directory location
HNAS_SCRIPTS_DIR=$HOME/.zsh/hnas-scripts 
if [[ $(id -u ) != $(id -u root) && -d $HNAS_SCRIPTS_DIR ]]; then
    source ~/.zsh/hnas-scripts/env
fi
