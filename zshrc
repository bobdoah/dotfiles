# Use emacs mode (same as bash default)
bindkey -e 

# Use up and down arrows to search history
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# Use colors
autoload -U colors && colors

# Use a debian-esque prompt
setopt PROMPT_SUBST
export PROMPT='%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m%{$reset_color%}:%{$fg[cyan]%}${PWD/#$HOME/~}%{$reset_color%}%# '
export RPROMPT=''

# Update fpath to include home directory
fpath=($HOME/.zsh-completions/ $fpath)

# Use completion
autoload -U compinit && compinit

# Show completion menu when number of options is at least two
zstyle ':completion:*' menu select=2

alias su="sudo -sE"
alias ssc="ssc -u supervisor -P lGseBUMM1NpVbI5vyINzUg= -n"

function ba-console() { ssh -t $1 su -; }
function ba-package-upload() { ssc $1 package-upgrade $2; }

export BA_PRIVATE_HOSTS="merc-rw-1 merc-rw-2 m2rw"
export BA_PACKAGE_DIRS="/home/company/software/release/ /mnt/stanley/home/dts/"


compctl -k "($BA_PRIVATE_HOSTS)" ba-console 


