#!/bin/bash
# http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="gitconfig vimrc bashrc bash_profile config/htop/htoprc muttrc mutt/webde"     # list of files/folders to symlink in homedir

# create dotfiles_old in homedir
mkdir -p $olddir

# change to the dotfiles directory
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
	# todo: create folders, if they don't exist
	echo "Install $file"
    mv ~/.$file ~/dotfiles_old/
    ln -s $dir/$file ~/.$file
done

# vim plugins
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
plugins="git://github.com/altercation/vim-colors-solarized.git https://github.com/scrooloose/nerdtree.git git clone git://github.com/altercation/vim-colors-solarized.git https://github.com/tpope/vim-fugitive.git"
cd ~/.vim/bundle
for plugin in $plugins; do
	git clone $plugin
done
cd -
