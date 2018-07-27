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
PATH=$HOME/.gem/ruby/2.3.0/bin:$PATH
TFFILTER_BIN=~/.vim/bundle/vim-terraform-completion/bin
if [[ -d $TFFILTER_BIN ]]; then
    PATH=$TFFILTER_BIN:$PATH
fi

P4V_BIN=/opt/p4v/bin 
if [[ -d $P4V_BIN ]]; then
    PATH=$P4V_BIN:$PATH
fi

MAC_PYTHON3_BIN=~/Library/Python/3.5/bin
if [[ -d $MAC_PYTHON3_BIN ]]; then
    PATH=$MAC_PYTHON3_BIN:$PATH
fi

export P4USER=rwilliams
alias p3=python3
alias p=python2

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# Don't paginate less than a page.
export LESS="-F -X -R $LESS"

JD_GUI=/opt/jd-gui/jd-gui-1.4.0.jar 
if [[ -f $JD_GUI ]]; then
    alias jd="java -jar $JD_GUI"
fi
