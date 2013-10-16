# Use emacs mode (same as bash default)
bindkey -e 

# Use up and down arrows to search history
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

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

# Use completion
autoload -U compinit && compinit

# Show completion menu when number of options is at least two
zstyle ':completion:*' menu select=2

alias ssc="ssc -u supervisor -P lGseBUMM1NpVbI5vyINzUg= -n"

source $HOME/.zsh/private

export BA_PRIVATE_HOSTS="merc-rw-1 merc-rw-2 m2rw"
export BA_PACKAGE_DIRS="/home/company/software/release /mnt/stanley/home/dts"
function ba-console() { ssh -t $1 su -; }
function ba-package-upload() { 
package_file=$2
for dirname in ${=BA_PACKAGE_DIRS}; do if [ -f $dirname/$package_file ]; then package_file=$dirname/$package_file; fi done
    ssc $1 package-upgrade $package_file; 
}

function ba-boot-cluster-package(){
    ssc $1 for-each-cnode package-set-default $2;
    if [ $? -eq 0 ]; then
        echo "$2 is now the default package, rebooting"
        ssc $1 reboot -fa --app
        if [ $? -eq 1 ]; then
            echo "Rebooting Linux"
            ssc $1 reboot -fa
            if [ $? -eq 1 ]; then
                echo "Failed to reboot"
            fi
        else
            echo "Rebooting BALI"
        fi
    else
        echo "Failed to set default to $2"
    fi
}

compctl -k "($BA_PRIVATE_HOSTS)" ba-console 

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
