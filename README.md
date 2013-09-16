Bobdoah's Dotfiles
==================

1. Clone the repo
-----------------
    cd ~
    git clone git@github.com:bobdoah/dotfiles.git

2. Update the submodules
------------------------
    cd dotfiles
    git submodule update --init

3. Create the symlinks
----------------------
    ln -s ~/dotfiles/vim ~/.vim
    ln -s ~/dotfiles/vimrc ~/.vimrc
    ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
    ln -s ~/dotfiles/tmux ~/.tmux
    ln -s ~/dotfiles/config ~/.config

4. Install powerline
--------------------
    pip install --user ~/dotfiles/powerline
