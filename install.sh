#!/bin/bash

# Remove all dotfiles from the home directory if present.
echo Removing any existing dotfiles from your home directory.
rm -rf ~/.vimrc ~/.zshrc ~/.spacemacs ~/.gitconfig

# Initialize symlinks.
echo Creating symlinks in your home directory that point to this dotfiles repository.
ln -s "$PWD/spacemacs" ~/.spacemacs
ln -s "$PWD/vimrc" ~/.vimrc
ln -s "$PWD/zshrc" ~/.zshrc
ln -s "$PWD/gitconfig" ~/.gitconfig

# Finished.
echo Dotfiles installation complete.
