Bobdoah's Dotfiles
==================

1. Clone the repo
-----------------
    cd ~
    git clone git@github.com:bobdoah/dotfiles.git

2. Create the symlinks
----------------------
    ln -s ~/dotfiles/ackrc ~/.ackrc
    ln -s ~/dotfiles/vim ~/.vim
    ln -s ~/dotfiles/vimrc ~/.vimrc
    ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
    ln -s ~/dotfiles/tmux ~/.tmux
    ln -s ~/dotfiles/config ~/.config
    ln -s ~/dotfiles/zshrc ~/.zshrc
    ln -s ~/dotfiles/zshenv ~/.zshenv
    ln -s ~/dotfiles/zsh ~/.zsh
    ln -s ~/dotfiles/dircolors ~/.dircolors
    ln -s ~/dotfiles/irssi ~/.irssi

3. Install Vundle plugins
-------------------------

    vim +PluginInstall +qall
