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

# Use completion
autoload -U compinit && compinit

# Show completion menu when number of options is at least two
zstyle ':completion:*' menu select=2

function ba-console() { ssh -t $1 su -; }
function ba-package-upload() { ssc $1 package-upgrade $2; }
compctl -k "(merc-rw-1 merc-rw-2 m2rw)" ba-console ba-package-upload

alias su="sudo -sE"

