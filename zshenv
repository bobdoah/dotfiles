export EDITOR=nvim
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8

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
export PATH


export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# Don't paginate less than a page.
export LESS="-F -X -R $LESS"

export COWPATH="/usr/share/cowsay/cows:$HOME/.cowsay:/usr/local/share/cows"
alias z̸̡͊͜a̸̡̨͎̗̗͛̐̂̊l̶̜̳̦̞͆̓̅͛́ͅg̴̨͉͖͓̟͆ơ̷̛̘͇̏̾̐="echo 'Ṫ͌ó̍ ̍͂̓̍̍̀i̊ͯ͒nͧ̍̓̃͋vok̂̓ͤ̓̂ěͬ ͆tͬ̐́̐͆h̒̏͌̓e͂ ̎̊h̽͆ͯ̄ͮi͊̂ͧͫ̇̃vͥͦ́ẻͤ-͒m̈́̀i̓ͮ͗̑͌̆̅n̓̓ͨd̊̑͛̔̚ ͨͮ̊̾rͪeͭͭ͑ͧ́͋p̈́̅̚rͧe̒̈̌s̍̽ͩ̓̇e͗n̏͊ͬͭtͨ͆ͤ̚iͪ͗̍n͐͒g̾ͦ̎ ͥ͌̽̊ͩͥ͗c̀ͬͣha̍̏̉ͪ̈̚o̊̏s̊̋̀̏̽̚.͒ͫ͛͛̎ͥ
̎Iͫ̅n͆̆͑vͦ̅ŏͩͧ̓̊̀ͩk̃ͦ̚ĭͥ̏̊͆̌̈́ńg̅ ̒̋t̽̔h͊ê͑ ͐͂̀̈feͮ̑͋̀ͦe̓l͒̚̚i͛̋̅̆ͮnͨ̿̌̄gͣ ̌̅́̈́ȍf̋̏ ̇ͩ̇ͧ̏cͭ̔ȟ̈́͆a͋os͗͑̈̐.̔
̆̒ͮW̓͋ͮ͐̚i͂t̊ͪhͫͯ̑͒ ͫ̃̚o̐útͩ̍̉ ͒͂̍̿o̐rͥ͌deͥrͥ̑̐̈.̒̅̈́ͦ̓
̔̅̈́̃T̋h̏̅͛eͭ ̍ͬ̓Ṅ̂̂e͆ͥ̃ͧ̏̀z͒̋̏̇̑peͬ͗̊̾̌̽ͦrͭ̒͒ͪd̀̋̅̔̿̔̄iͨ̆͐a̓̂̎̚ṅ hiͬ̓́ͪ̓v̂ͪ̎͋ͤ͑ė͒̐ͪ͛͐ͥ-͌̓̈́̒mͨĭn̾̅d̔ͭ ̄̃ͪ̆ͫ͂o̾f̋ͩ̍ ͮcͬ̏͊h̒͊̌̍̈́̓a̐͋̀o͆ͤ́ͭ̑ͮ̄s̀Ìͮ̓ͬ. ̆ͪͧͣͩZ̈́a̎̇l͌́gͪ̒ǒͦ̎. ̾͑̐̇
͑̌ͥ͛ͩ̚H̆ͧ̓e̍͊̒ͣ w̄́̀ho͐͋̍̌̎ͪ ̊̇͗͛̓Wͪ̅ä̇̍̌̄̈́̏ìͥ͗͌ͣͤt̾ͮ̒̽͌s̍͊ ̎̅̿̌Bͤ́ͬe̊͂̾̀̆͆̇ḧ́͂͑̇͋̄̾i̎ͬͬͨ̒̽͑n̉d̾̏̈́͊̌̄̓ ͦ̅ͬ̃T̂ͧ̚hͧͨ͗̂͂͋e̎̓ W̃̽͋͐̀a̍̈́̆̓̐lͫlͧ.̾
͒ͤ͌ͪͭZ͂̾͂̄͗ͦẢͪͣ͌͑̒̐LͦGͦͩ̓ͧOͭ̎̒͑!̇ͪ͐ͩͨ' | cowsay -f garfield.cow"

export PGOUSER=$HOME/.pgo/pgo/pgouser
export PGO_CA_CERT=$HOME/.pgo/pgo/client.crt
export PGO_CLIENT_CERT=$HOME/.pgo/pgo/client.crt
export PGO_CLIENT_KEY=$HOME/.pgo/pgo/client.key
