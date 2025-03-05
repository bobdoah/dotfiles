export EDITOR=nvim
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

PATH=/usr/local/bin:$PATH
PATH=/snap/bin:$PATH
# Superuser locations
PATH=/sbin:/usr/sbin:/usr/local/sbin:$PATH
# Home directory paths
PATH=$HOME/bin:$HOME/.local/bin:$PATH
# Tool paths
PATH=$HOME/.gem/ruby/1.9.1/bin:$PATH
PATH=$HOME/.gem/ruby/2.3.0/bin:$PATH
PATH=$PATH:/opt/nvim-linux64/bin
PATH=$HOME/go/bin:$PATH
PATH=/usr/local/go/bin:$PATH
PATH=${KREW_ROOT:-$HOME/.krew}/bin:$PATH
PATH=$HOME/.pgo/pgo:$PATH
PATH=$PATH:$HOME/.pulumi/bin
PATH=$PATH:$HOME/.kpp/bin
PATH=$PATH:$HOME/.local/share/nvim/mason/bin
export PATH


export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# Don't paginate less than a page.
export LESS="-F -X -R $LESS"


export PGOUSER=$HOME/.pgo/pgo/pgouser
export PGO_CA_CERT=$HOME/.pgo/pgo/client.crt
export PGO_CLIENT_CERT=$HOME/.pgo/pgo/client.crt
export PGO_CLIENT_KEY=$HOME/.pgo/pgo/client.key
