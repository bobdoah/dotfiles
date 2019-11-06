export EDITOR=vim

# local path
if [[ $OSTYPE == 'cygwin' ]]; then
    PATH=/usr/bin:$PATH
fi
PATH=/usr/local/bin:$PATH
# Superuser locations
PATH=/sbin:/usr/sbin:/usr/local/sbin:$PATH
# Home directory paths 
PATH=$HOME/bin:$HOME/.local/bin:$PATH
PATH=$HOME/.gem/ruby/1.9.1/bin:$PATH
PATH=$HOME/.gem/ruby/2.3.0/bin:$PATH
TFFILTER_BIN=~/.vim/bundle/vim-terraform-completion/bin
if [[ -d $TFFILTER_BIN ]]; then
    PATH=$TFFILTER_BIN:$PATH
fi

P4V_BIN=/opt/p4v/bin 
if [[ -d $P4V_BIN ]]; then
    PATH=$P4V_BIN:$PATH
fi

MAC_PYTHON3_BIN=~/Library/Python/3.5/bin
if [[ -d $MAC_PYTHON3_BIN ]]; then
    PATH=$MAC_PYTHON3_BIN:$PATH
fi

export P4USER=rwilliams
alias p3=python3
alias p=python2

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# Don't paginate less than a page.
export LESS="-F -X -R $LESS"

JD_GUI=/opt/jd-gui/jd-gui-1.4.0.jar 
if [[ -f $JD_GUI ]]; then
    alias jd="java -jar $JD_GUI"
fi

M2_HOME=/opt/maven
if [[ -d $M2_HOME ]]; then
    export M2_HOME
    export PATH=${M2_HOME}/bin:${PATH}
fi

JENKINS_TOKEN_FILE=$HOME/.jenkins_token
if [[ -f $JENKINS_TOKEN_FILE ]]; then
    export JENKINS_TOKEN=$(cat $JENKINS_TOKEN_FILE)
fi 

if grep -q Microsoft /proc/version; then
    export DISPLAY=localhost:0.0
fi

export COWPATH="/usr/share/cowsay/cows:$HOME/.cowsay"
alias z̸̡͊͜a̸̡̨͎̗̗͛̐̂̊l̶̜̳̦̞͆̓̅͛́ͅg̴̨͉͖͓̟͆ơ̷̛̘͇̏̾̐="echo 'Ṫ͌ó̍ ̍͂̓̍̍̀i̊ͯ͒nͧ̍̓̃͋vok̂̓ͤ̓̂ěͬ ͆tͬ̐́̐͆h̒̏͌̓e͂ ̎̊h̽͆ͯ̄ͮi͊̂ͧͫ̇̃vͥͦ́ẻͤ-͒m̈́̀i̓ͮ͗̑͌̆̅n̓̓ͨd̊̑͛̔̚ ͨͮ̊̾rͪeͭͭ͑ͧ́͋p̈́̅̚rͧe̒̈̌s̍̽ͩ̓̇e͗n̏͊ͬͭtͨ͆ͤ̚iͪ͗̍n͐͒g̾ͦ̎ ͥ͌̽̊ͩͥ͗c̀ͬͣha̍̏̉ͪ̈̚o̊̏s̊̋̀̏̽̚.͒ͫ͛͛̎ͥ 
̎Iͫ̅n͆̆͑vͦ̅ŏͩͧ̓̊̀ͩk̃ͦ̚ĭͥ̏̊͆̌̈́ńg̅ ̒̋t̽̔h͊ê͑ ͐͂̀̈feͮ̑͋̀ͦe̓l͒̚̚i͛̋̅̆ͮnͨ̿̌̄gͣ ̌̅́̈́ȍf̋̏ ̇ͩ̇ͧ̏cͭ̔ȟ̈́͆a͋os͗͑̈̐.̔ 
̆̒ͮW̓͋ͮ͐̚i͂t̊ͪhͫͯ̑͒ ͫ̃̚o̐útͩ̍̉ ͒͂̍̿o̐rͥ͌deͥrͥ̑̐̈.̒̅̈́ͦ̓ 
̔̅̈́̃T̋h̏̅͛eͭ ̍ͬ̓Ṅ̂̂e͆ͥ̃ͧ̏̀z͒̋̏̇̑peͬ͗̊̾̌̽ͦrͭ̒͒ͪd̀̋̅̔̿̔̄iͨ̆͐a̓̂̎̚ṅ hiͬ̓́ͪ̓v̂ͪ̎͋ͤ͑ė͒̐ͪ͛͐ͥ-͌̓̈́̒mͨĭn̾̅d̔ͭ ̄̃ͪ̆ͫ͂o̾f̋ͩ̍ ͮcͬ̏͊h̒͊̌̍̈́̓a̐͋̀o͆ͤ́ͭ̑ͮ̄s̀Ìͮ̓ͬ. ̆ͪͧͣͩZ̈́a̎̇l͌́gͪ̒ǒͦ̎. ̾͑̐̇ 
͑̌ͥ͛ͩ̚H̆ͧ̓e̍͊̒ͣ w̄́̀ho͐͋̍̌̎ͪ ̊̇͗͛̓Wͪ̅ä̇̍̌̄̈́̏ìͥ͗͌ͣͤt̾ͮ̒̽͌s̍͊ ̎̅̿̌Bͤ́ͬe̊͂̾̀̆͆̇ḧ́͂͑̇͋̄̾i̎ͬͬͨ̒̽͑n̉d̾̏̈́͊̌̄̓ ͦ̅ͬ̃T̂ͧ̚hͧͨ͗̂͂͋e̎̓ W̃̽͋͐̀a̍̈́̆̓̐lͫlͧ.̾ 
͒ͤ͌ͪͭZ͂̾͂̄͗ͦẢͪͣ͌͑̒̐LͦGͦͩ̓ͧOͭ̎̒͑!̇ͪ͐ͩͨ' | cowsay -f garfield.cow"

export P4PORT=mdhvcperforce01.flexera.com:1666
