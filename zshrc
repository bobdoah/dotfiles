# Use emacs mode (same as bash default)
bindkey -e 

# Use up and down arrows to search history
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

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
if [[ $(id -u ) != $(id -u root) ]]; then
    fpath=($HOME/.zsh/completions/ $fpath)
fi

# Include all the HNAS scripts, if the directory exists and we aren't root
HNAS_SCRIPTS_DIR=$HOME/.zsh/hnas-scripts 
if [[ $(id -u ) != $(id -u root) && -d $HNAS_SCRIPTS_DIR ]]; then
   source $HNAS_SCRIPTS_DIR/env
   fpath=($HNAS_SCRIPTS_DIR/scripts $HNAS_SCRIPTS_DIR/completions $fpath)
   autoload -U $HNAS_SCRIPTS_DIR/scripts/*(:t)
fi

# Use completion
autoload -U compinit && compinit

# Show completion menu when number of options is at least two
zstyle ':completion:*' menu select=2

alias ssc="ssc -u supervisor -P lGseBUMM1NpVbI5vyINzUg="

source $HOME/.zsh/private


# Local PIP packages
export PIP_EXTRA_INDEX_URL="http://dante.terastack.bluearc.com/packages"

# Load virtualenvwrapper
if [[ $(id -u) != $(id -u root) ]]; then
    source $HOME/.local/bin/virtualenvwrapper.sh
fi


# Suffix aliases
autoload -U zsh-mime-setup
zsh-mime-setup

alias -s py='ipython -i'
