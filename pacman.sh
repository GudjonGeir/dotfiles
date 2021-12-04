packages=(
  neovim
  awesome
  emacs
  ripgrep
  lazygit
  dmenu
  rofi
  xclip
  github-cli
  alacritty
  kubectl
  docker
  picom
  nitrogen
  jre11-openjdk-headless jre11-openjdk jdk11-openjdk openjdk11-doc openjdk11-src
  jq
)
sudo pacman -S "${packages[@]}"
