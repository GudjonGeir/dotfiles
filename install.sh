#!/bin/bash

ask() {
    local prompt default reply
    prompt='Y/n'
    default='Y'

    while true; do

        # Ask the question (not using "read -p" as it uses stderr not stdout)
        echo -n "$1 [$prompt] "

        # Read the answer (use /dev/tty in case stdin is redirected from somewhere else)
        read -r reply </dev/tty

        # Default?
        if [[ -z $reply ]]; then
            reply=$default
        fi

        # Check if the reply is valid
        case "$reply" in
            Y*|y*) return 0 ;;
            N*|n*) return 1 ;;
        esac

    done
}

# Remove all dotfiles from the home directory if present.
echo Removing any existing dotfiles from your home directory.
rm -rf ~/.vimrc ~/.zshrc ~/.spacemacs ~/.gitconfig ~/.config/nvim

# Initialize symlinks.
echo Creating symlinks in your home directory that point to this dotfiles repository.
ln -s "$PWD/spacemacs" ~/.spacemacs
ln -s "$PWD/zshrc" ~/.zshrc
ln -s "$PWD/gitconfig" ~/.gitconfig
ln -s "$PWD/nvim" ~/.config/nvim

if ask "Install awesome config"; then
    rm -f ~/.config/awesome/rc.lua
    mkdir -p ~/.config/awesome
    ln -s "$PWD/.config/awesome/rc.lua" ~/.config/awesome/rc.lua
fi

if ask "Install termite config"; then
    rm -f ~/.config/termite/config
    mkdir -p ~/.config/termite
    ln -s "$PWD/.config/termite/config" ~/.config/termite/config
fi

if ask "Install alacritty config"; then
    rm -f ~/.config/alacritty/alacritty.yml
    mkdir -p ~/.config/alacritty
    ln -s "$PWD/.config/alacritty/alacritty.yml" ~/.config/alacritty/alacritty.yml
fi

# Finished.
echo Dotfiles installation complete.
