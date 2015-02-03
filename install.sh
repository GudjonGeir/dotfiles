#!/bin/bash

# Initialize and update all submodules.
echo Initializing git submodules.
git submodule init && git submodule update

# Remove all dotfiles from the home directory if present.
echo Removing any existing dotfiles from your home directory.
rm -rf ~/.vim ~/.vimrc ~/.bashrc ~/.bash_profile ~/.inputrc ~/.gitconfig ~/.shell_prompt.sh ~/.tmux.conf ~/.tmux_theme ~/.tmux

# Initialize symlinks.
echo Creating symlinks in your home directory that point to this dotfiles repository.
ln -s "$PWD/vim" ~/.vim
ln -s "$PWD/vim/vimrc" ~/.vimrc
ln -s "$PWD/zshrc" ~/.zshrc
ln -s "$PWD/.gitconfig" ~/gitconfig

# Finished.
echo Dotfiles installation complete.
