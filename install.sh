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
rm -rf ~/.vimrc ~/.zshrc ~/.spacemacs ~/.gitconfig ~/config/nvim

# Initialize symlinks.
echo Creating symlinks in your home directory that point to this dotfiles repository.
# ln -s "$PWD/spacemacs" ~/.spacemacs
ln -s "$PWD/zshrc" ~/.zshrc
ln -s "$PWD/gitconfig" ~/.gitconfig
ln -s "$PWD/nvim" ~/.config/nvim

if ask "Install i3 config"; then
    rm -rf ~/.config/i3
    mkdir -p ~/.config
    ln -s "$PWD/config/i3" ~/.config/i3
fi

if ask "Install awesome config"; then
    rm -f ~/.config/awesome/rc.lua
    mkdir -p ~/.config/awesome
    ln -s "$PWD/config/awesome/rc.lua" ~/.config/awesome/rc.lua
fi

if ask "Install termite config"; then
    rm -f ~/.config/termite/config
    mkdir -p ~/config/termite
    ln -s "$PWD/config/termite/config" ~/.config/termite/config
fi

if ask "Install alacritty config"; then
    rm -rf ~/.config/alacritty
    mkdir -p ~/.config
    ln -s "$PWD/config/alacritty" ~/.config/alacritty
fi

if ask "Install polybar config"; then
    rm -rf ~/.config/polybar
    mkdir -p ~/.config
    ln -s "$PWD/config/polybar" ~/.config/polybar
fi

if ask "Install rofi config"; then
    rm -rf ~/.config/rofi
    mkdir -p ~/.config
    ln -s "$PWD/config/rofi" ~/.config/rofi
fi

# Finished.
echo Dotfiles installation complete.
