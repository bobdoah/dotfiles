ZSH_CONFIG_DIR=$HOME/.zsh
source "$ZSH_CONFIG_DIR/private" 2>/dev/null

# Load additional completion definitions from the tracked submodule.
fpath=(
    "$ZSH_CONFIG_DIR/plugins/zsh-completions/src"
    "$ZSH_CONFIG_DIR/completions"
    "$ZSH_CONFIG_DIR/functions"
    "$ZSH_CONFIG_DIR/private-functions"
    $fpath
)

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
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# Keep recently visited directories available through cd -1, cd -2, etc.
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_MINUS

# backwards TAB
bindkey '^[[Z' reverse-menu-complete

# Use colors
autoload -U colors && colors

# Use a debian-esque prompt
setopt PROMPT_SUBST
export PROMPT='%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m%{$reset_color%}:%{$fg[cyan]%}${PWD/#$HOME/~}%{$reset_color%}%# '
export RPROMPT=''

# Load local functions on demand.
autoload -U "$ZSH_CONFIG_DIR"/functions/*(N:t)

PRIVATE_FUNCS=($ZSH_CONFIG_DIR/private-functions/*(N:t))
(( ${#PRIVATE_FUNCS} )) && autoload -U $PRIVATE_FUNCS

# Detect the platform clipboard only when one of these is first used.
function clipcopy() {
    clipboard-init || return
    clipcopy "$@"
}

function clippaste() {
    clipboard-init || return
    clippaste "$@"
}

# Rebuild by deleting this dump after adding or updating completion definitions.
autoload -Uz compinit
compinit -C -d "$ZSH_CONFIG_DIR/.zcompdump"

# Show completion menu when number of options is at least two
zstyle ':completion:*' menu select=2

# Add an alias to quickly reload zshrc
alias reload="source $HOME/.zshrc"

# Set the X display when running under Cygwin.
if [[ $OSTYPE == cygwin* ]] && pgrep -n -u "$USER" XWin >/dev/null; then
    export DISPLAY=$(pid=$(pgrep XWin); cat /proc/$pid/environ | tr '\0' '\n' | grep '^DISPLAY=' | cut -d '=' -f 2)
fi

if [ -f "$HOME/.cargo/env" ]; then . "$HOME/.cargo/env"; fi

# Generate expensive command completions only when they are first requested.
function _load_completion() {
    local command_name=$1 completion_function=$2
    shift 2
    unfunction "$completion_function"
    source <(command "$command_name" completion zsh)
    "$completion_function" "$@"
}

for command_name in kubectl helm kustomize flux argocd talosctl; do
    completion_function=_$command_name
    eval "function $completion_function() { _load_completion $command_name $completion_function \"\$@\" }"
    compdef "$completion_function" "$command_name"
done
compdef _kubectl k
unset command_name completion_function

# ASDF managed tools
ASDF_DIR=$HOME/.asdf
if [ -d $ASDF_DIR ]; then
   . $ASDF_DIR/asdf.sh
fi

# Shorthand commands
alias p=python3
alias p2=python2
alias k=kubectl
alias podman='podman-remote-static-linux_amd64'
alias vi='nvim'
alias vim='nvim'

# He comes
export COWPATH="/usr/share/cowsay/cows:$HOME/.cowsay:/usr/local/share/cows"
alias z̸̡͊͜a̸̡̨͎̗̗͛̐̂̊l̶̜̳̦̞͆̓̅͛́ͅg̴̨͉͖͓̟͆ơ̷̛̘͇̏̾̐="echo 'Ṫ͌ó̍ ̍͂̓̍̍̀i̊ͯ͒nͧ̍̓̃͋vok̂̓ͤ̓̂ěͬ ͆tͬ̐́̐͆h̒̏͌̓e͂ ̎̊h̽͆ͯ̄ͮi͊̂ͧͫ̇̃vͥͦ́ẻͤ-͒m̈́̀i̓ͮ͗̑͌̆̅n̓̓ͨd̊̑͛̔̚ ͨͮ̊̾rͪeͭͭ͑ͧ́͋p̈́̅̚rͧe̒̈̌s̍̽ͩ̓̇e͗n̏͊ͬͭtͨ͆ͤ̚iͪ͗̍n͐͒g̾ͦ̎ ͥ͌̽̊ͩͥ͗c̀ͬͣha̍̏̉ͪ̈̚o̊̏s̊̋̀̏̽̚.͒ͫ͛͛̎ͥ
̎Iͫ̅n͆̆͑vͦ̅ŏͩͧ̓̊̀ͩk̃ͦ̚ĭͥ̏̊͆̌̈́ńg̅ ̒̋t̽̔h͊ê͑ ͐͂̀̈feͮ̑͋̀ͦe̓l͒̚̚i͛̋̅̆ͮnͨ̿̌̄gͣ ̌̅́̈́ȍf̋̏ ̇ͩ̇ͧ̏cͭ̔ȟ̈́͆a͋os͗͑̈̐.̔
̆̒ͮW̓͋ͮ͐̚i͂t̊ͪhͫͯ̑͒ ͫ̃̚o̐útͩ̍̉ ͒͂̍̿o̐rͥ͌deͥrͥ̑̐̈.̒̅̈́ͦ̓
̔̅̈́̃T̋h̏̅͛eͭ ̍ͬ̓Ṅ̂̂e͆ͥ̃ͧ̏̀z͒̋̏̇̑peͬ͗̊̾̌̽ͦrͭ̒͒ͪd̀̋̅̔̿̔̄iͨ̆͐a̓̂̎̚ṅ hiͬ̓́ͪ̓v̂ͪ̎͋ͤ͑ė͒̐ͪ͛͐ͥ-͌̓̈́̒mͨĭn̾̅d̔ͭ ̄̃ͪ̆ͫ͂o̾f̋ͩ̍ ͮcͬ̏͊h̒͊̌̍̈́̓a̐͋̀o͆ͤ́ͭ̑ͮ̄s̀Ìͮ̓ͬ. ̆ͪͧͣͩZ̈́a̎̇l͌́gͪ̒ǒͦ̎. ̾͑̐̇
͑̌ͥ͛ͩ̚H̆ͧ̓e̍͊̒ͣ w̄́̀ho͐͋̍̌̎ͪ ̊̇͗͛̓Wͪ̅ä̇̍̌̄̈́̏ìͥ͗͌ͣͤt̾ͮ̒̽͌s̍͊ ̎̅̿̌Bͤ́ͬe̊͂̾̀̆͆̇ḧ́͂͑̇͋̄̾i̎ͬͬͨ̒̽͑n̉d̾̏̈́͊̌̄̓ ͦ̅ͬ̃T̂ͧ̚hͧͨ͗̂͂͋e̎̓ W̃̽͋͐̀a̍̈́̆̓̐lͫlͧ.̾
͒ͤ͌ͪͭZ͂̾͂̄͗ͦẢͪͣ͌͑̒̐LͦGͦͩ̓ͧOͭ̎̒͑!̇ͪ͐ͩͨ' | cowsay -f garfield.cow"

export NVM_DIR="$HOME/.nvm"
if [[ -s "$NVM_DIR/nvm.sh" ]]; then
    function nvm() {
        unfunction nvm
        source "$NVM_DIR/nvm.sh"
        nvm "$@"
    }
fi
