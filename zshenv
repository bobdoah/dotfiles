export EDITOR=nvim
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

# Ubuntu's global zshrc otherwise initializes completion before our fpath.
skip_global_compinit=1

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
PATH=$PATH:$HOME/.local/share/nvim/mason/bin/
PATH=$PATH:$HOME/.bun/bin
PATH=$PATH:$HOME/.opencode/bin

# zshrc defers sourcing nvm.sh because it is slow to load, so put the default
# version's bin on PATH here. Without this, node, npm and anything installed
# globally through npm are missing until nvm is called by hand.
export NVM_DIR=$HOME/.nvm
nvm_default=
[[ -r $NVM_DIR/alias/default ]] && nvm_default=$(<$NVM_DIR/alias/default)
while [[ -n $nvm_default && -r $NVM_DIR/alias/$nvm_default ]]; do
    nvm_default=$(<$NVM_DIR/alias/$nvm_default)
done
nvm_bin=($NVM_DIR/versions/node/v${nvm_default#v}*/bin(N/om))
(( $#nvm_bin )) && PATH=$nvm_bin[1]:$PATH
unset nvm_default nvm_bin

export PATH


export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# Don't paginate less than a page.
export LESS="-F -X -R $LESS"


export PGOUSER=$HOME/.pgo/pgo/pgouser
export PGO_CA_CERT=$HOME/.pgo/pgo/client.crt
export PGO_CLIENT_CERT=$HOME/.pgo/pgo/client.crt
export PGO_CLIENT_KEY=$HOME/.pgo/pgo/client.key
