ZSH_CONFIG_DIR=$HOME/.zsh
# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then 
    echo "Creating a zgen save"

    zgen oh-my-zsh

    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/terraform
    zgen oh-my-zsh plugins/chucknorris
    zgen oh-my-zsh plugins/ssh-agent
    zgen oh-my-zsh plugins/docker
    
    zgen load zsh-users/zsh-completions src
    if [ "$OSTYPE" != "cygwin" ]; then
        zgen load mafredri/zsh-async
    fi
    zgen save
fi

# Use emacs mode (same as bash default)
bindkey -e 

source $ZSH_CONFIG_DIR/zkbd-terminfo
# Line editing keys
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

# History keys
[[ -n "${key[PageUp]}" ]] && bindkey "${key[PageUp]}" history-beginning-search-backward
[[ -n "${key[PageDown]}" ]] && bindkey "${key[PageDown]}" history-beginning-search-forward
[[ -n "${key[Up]}" ]] && bindkey "${key[Up]}" history-beginning-search-backward
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" history-beginning-search-forward

# Make sure the terminal is in application mode
function zle-line-init () {
    echoti smkx
}

function zle-line-finish () {
    echoti rmkx
}

zle -N zle-line-init
zle -N zle-line-finish

# Save history
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=$ZSH_CONFIG_DIR/histfile

# backwards TAB
bindkey '^[[Z' reverse-menu-complete

# Use colors
autoload -U colors && colors

# Use a debian-esque prompt
setopt PROMPT_SUBST
export PROMPT='%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m%{$reset_color%}:%{$fg[cyan]%}${PWD/#$HOME/~}%{$reset_color%}%# '
export RPROMPT=''

# Update fpath to include home directory
if [[ $(id -u ) != 0 ]]; then
    fpath=($ZSH_CONFIG_DIR/completions/ $fpath)
    fpath=($ZSH_CONFIG_DIR/functions/ $fpath)
fi
autoload -U $ZSH_CONFIG_DIR/functions/*(:t)

# Use completion
autoload -U compinit && compinit

# Show completion menu when number of options is at least two
zstyle ':completion:*' menu select=2

source $ZSH_CONFIG_DIR/private 2>/dev/null

PYTHON3=$(whence python3 2>/dev/null)
if [[ ! -z $PYTHON3 ]] ; then 
    alias python=$PYTHON3
    export VIRTUALENVWRAPPER_PYTHON=$PYTHON3
fi

PYTHON37=$(whence python3.7 2>/dev/null)
if [[ ! -z $PYTHON37 ]] ; then 
    alias python=$PYTHON37
    export VIRTUALENVWRAPPER_PYTHON=$PYTHON37
fi

# Load virtualenvwrapper
VIRTUAL_ENV_WRAPPER=$(which virtualenvwrapper.sh >/dev/null 2>&1;)
if [[ $(id -u) != 0  && "$OSTYPE" != "cygwin"  && -f $VIRTUAL_ENV_WRAPPER ]]; then
    source $VIRTUAL_ENV_WRAPPER
fi


# Suffix aliases
autoload -U zsh-mime-setup
zsh-mime-setup

# Add an alias to quickly reload zshrc
alias reload="source $HOME/.zshrc"

# Set display
PID=$(pgrep -n -u $USER XWin)
if [[ -n $PID ]]; then
    export DISPLAY=$(pid=$(pgrep XWin); cat /proc/$pid/environ | tr '\0' '\n' | grep '^DISPLAY=' | cut -d '=' -f 2)
fi

PATH="/home/rwilliams/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/rwilliams/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/rwilliams/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/rwilliams/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/rwilliams/perl5"; export PERL_MM_OPT;

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bob/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/bob/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/bob/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/bob/google-cloud-sdk/completion.zsh.inc'; fi


export NVM_DIR="$HOME/.nvm"
function load_nvm() {
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
}

# Initialize worker
#async_init
#async_start_worker nvm_worker -n
#async_register_callback nvm_worker load_nvm
#async_job nvm_worker sleep 0.1

autoload -U add-zsh-hook

if type "kubectl" > /dev/null; then
    source <(kubectl completion zsh)
fi
if type "helm" > /dev/null; then
    source <(helm completion zsh)
fi
load-kubeconfig(){
    local kubeconfig_path="kube_config_cluster.yml"
    if [ -f "$kubeconfig_path" ]; then
        export KUBECONFIG=$kubeconfig_path
    fi
}
add-zsh-hook chpwd load-kubeconfig

ASDF_DIR=$HOME/.asdf
if [ -d $ASDF_DIR ]; then 
   . $ASDF_DIR/asdf.sh
   . $ASDF_DIR/completions/asdf.bash
fi

if type "aws-okta" > /dev/null; then
    source <(aws-okta completion zsh)
fi

unlock-keychain-aws(){
    local aws_keychain="/Users/robert.williams/Library/Keychains/aws-vault.keychain-db"
    security unlock-keychain $aws_keychain
}
