#!/bin/bash
# http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

oldir=`pwd`
dir=~/dotfiles                    # dotfiles directory
backupdir=~/dotfiles_old             # old dotfiles backup directory
files="vimrc bashrc bash_profile config/htop/htoprc screenrc" # list of files/folders to symlink in homedir

# create dotfiles_old in homedir
mkdir -p $backupdir

# change to the dotfiles directory
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
	# todo: create folders, if they don't exist
	echo "Install $file"
    mv ~/.$file $backupdir
    ln -s $dir/$file ~/.$file
done

# vim plugins
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
plugins="git://github.com/altercation/vim-colors-solarized.git https://github.com/scrooloose/nerdtree.git git://github.com/altercation/vim-colors-solarized.git https://github.com/tpope/vim-fugitive.git git clone https://github.com/majutsushi/tagbar https://github.com/sgur/vim-editorconfig.git"
cd ~/.vim/bundle
for plugin in $plugins; do
	git clone $plugin
done
cd $olddir

echo bitte selbst entscheiden ob Arbeits oder persoenlich ist
echo Und dann gitconfig selbst verlinken
