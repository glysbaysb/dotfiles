#!/bin/bash
# http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

oldir=`pwd`
dir=~/dotfiles                    # dotfiles directory
files="vimrc bashrc bash_profile config/htop/htoprc config/aerc screenrc tool-versions tmux.conf config/kitty" # list of files/folders to symlink in homedir

# change to the dotfiles directory
cd $dir

# create symlinks 
for file in $files; do
	echo "Install $file"
    ln -s $dir/$file ~/.$file
done

# vim plugins
mkdir -p ~/.vim/pack/site/start
plugins="git://github.com/altercation/vim-colors-solarized.git https://github.com/scrooloose/nerdtree.git git://github.com/altercation/vim-colors-solarized.git https://github.com/tpope/vim-fugitive.git https://github.com/majutsushi/tagbar https://github.com/sgur/vim-editorconfig.git https://github.com/vlime/vlime.git"
cd ~/.vim/pack/site/start
for plugin in $plugins; do
	git clone $plugin
done

# aerc
echo "arbeits rechner (0) oder persoenlicher recher (1): "
read type
if [[ $type == 0 ]]; then
	ln -s $dir/gitconfig.work ~/.gitconfig;
	ln -s $dir/config/aerc/accounts-work.conf ~/.config/aerc/accounts.conf;
fi
if [[ $type == 1 ]]; then
	ln -s $dir/gitconfig.personal ~/.gitconfig;
fi

#change back
cd $olddir

