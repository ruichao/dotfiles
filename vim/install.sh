#!/bin/bash

BASE_DIR=$(dirname $0)
cd $BASE_DIR
CURRENT_DIR=`pwd`

lnif() {
  if [ -e $1 ]; then
     ln -sf $1 $2
  fi
}

echo "setting up symlinks"
lnif $CURRENT_DIR/vimrc $HOME/.vimrc
lnif $CURRENT_DIR/ $HOME/.vim

if [ ! -e $CURRENT_DIR/bundle/vundle.vim ]; then
  echo "install vundle"
  git clone https://github.com/VundleVim/Vundle.vim.git $CURRENT_DIR/bundle/vundle.vim
fi

echo "install plugins by using vundle"
vim -u $CURRENT_DIR/vimrc +PluginInstall +qall

