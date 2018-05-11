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

P4V_BIN=/opt/p4v/bin 
if [[ -d $P4V_BIN ]]; then
    PATH=$P4V_BIN:$PATH
fi

MAC_PYTHON3_BIN=~/Library/Python/3.5/bin
if [[ -d $MAC_PYTHON3_BIN ]]; then
    PATH=$MAC_PYTHON3_BIN:$PATH
fi

export P4USER=rwilliams
