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

# Include all the HNAS scripts, if the directory exists and we aren't root
if [[ $(id -u ) != 0 && -f $HNAS_ENV ]]; then
   fpath=($HNAS_SCRIPTS_DIR/scripts $HNAS_SCRIPTS_DIR/completions $fpath)
   autoload -U $HNAS_SCRIPTS_DIR/scripts/*(:t)
fi

# Use completion
autoload -U compinit && compinit

# Show completion menu when number of options is at least two
zstyle ':completion:*' menu select=2

alias ssc="ssc -u supervisor -P lGseBUMM1NpVbI5vyINzUg="

source $HOME/.zsh/private 2>/dev/null


# Load virtualenvwrapper
VIRTUAL_ENV_WRAPPER=/usr/local/bin/virtualenvwrapper.sh
if [[ $(id -u) != 0  && "$OSTYPE" != "cygwin"  && -f $VIRTUAL_ENV_WRAPPER ]]; then
    source $VIRTUAL_ENV_WRAPPER
fi


# Suffix aliases
autoload -U zsh-mime-setup
zsh-mime-setup

# Add an alias to quickly reload zshrc
alias reload="source $HOME/.zshrc"

# Colourful ls
eval $(dircolors ~/.dircolors/dircolors-solarized/dircolors.ansi-dark)
alias ls="ls --color"

# Set display
PID=$(pgrep -n -u $USER XWin)
if [ -n $PID ]; then
    export DISPLAY=$(pgrep -l -f XWin | ruby -pe "gsub(/.+(\d*:\d*(\.\d*)?).+/, '\1')" | head -n 1)
fi


