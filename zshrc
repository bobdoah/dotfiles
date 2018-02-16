# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then 
    echo "Creating a zgen save"

    zgen oh-my-zsh

    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/terraform
    
    zgen load zsh-users/zsh-completions src

    zgen save
fi

# Use emacs mode (same as bash default)
bindkey -e 

source $HOME/.zsh/zkbd-terminfo
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
export HISTFILE=$HOME/.zsh/histfile

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
    fpath=($HOME/.zsh/completions/ $fpath)
fi

# Use completion
autoload -U compinit && compinit

# Show completion menu when number of options is at least two
zstyle ':completion:*' menu select=2

source $HOME/.zsh/private 2>/dev/null

if which python3 >/dev/null 2>&1; then ; 
    alias python=$PYTHON3
    export VIRTUALENVWRAPPER_PYTHON=$PYTHON3
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

# Colourful ls
if whence dircolors > /dev/null 2>&1; then
    eval $(dircolors ~/.dircolors/dircolors-solarized/dircolors.ansi-dark)
    alias ls="ls --color"
else
    export CLICOLOR=1
fi

# Set display
PID=$(pgrep -n -u $USER XWin)
if [[ -n $PID ]]; then
    export DISPLAY=$(pid=$(pgrep XWin); cat /proc/$pid/environ | tr '\0' '\n' | grep '^DISPLAY=' | cut -d '=' -f 2)
fi

if which p4 > /dev/null; then
    export P4CONFIG=.p4rc
fi

PATH="/home/rwilliams/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/rwilliams/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/rwilliams/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/rwilliams/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/rwilliams/perl5"; export PERL_MM_OPT;

