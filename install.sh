#!/bin/bash
# http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

oldir=`pwd`
dir=~/dotfiles                    # dotfiles directory
files="vimrc bashrc bash_profile config/htop/htoprc screenrc tool-versions tmux.conf config/kitty" # list of files/folders to symlink in homedir

# change to the dotfiles directory
cd $dir

# create symlinks 
for file in $files; do
	echo "Install $file"
    ln -s $dir/$file ~/.$file
done

# vim plugins
mkdir -p ~/.vim/pack/site/start
plugins="https://github.com/scrooloose/nerdtree.git git://github.com/altercation/vim-colors-solarized.git https://github.com/tpope/vim-fugitive.git https://github.com/majutsushi/tagbar https://github.com/sgur/vim-editorconfig.git https://github.com/vlime/vlime.git"
cd ~/.vim/pack/site/start
for plugin in $plugins; do
	git clone $plugin
done

ln -s $dir/gitconfig.personal ~/.gitconfig;

#change back
cd $olddir

