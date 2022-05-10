#!/usr/bin/env bash

# Add Taps
echo 'homebrew/cask' \
   'homebrew/cask-drivers' \
   'homebrew/cask-fonts' \
   'homebrew/core' \
   | xargs -n1 brew tap

brew tap miserlou/loop https://github.com/Miserlou/Loop.git

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install zsh, set it as default
brew install zsh
echo 'Changing shell to zsh:'
if ! fgrep -q '/usr/local/bin/zsh' /etc/shells; then
  echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/zsh
fi

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install \
  ack \
  antigen \
  bat \
  blueutil \
  broot \
  brotli \
  bzip2 \
  coreutils \
  csvkit \
  diff-so-fancy \
  direnv \
  fd \
  freetds \
  fzf \
  gcc \
  gdal \
  gdbm \
  geos \
  gh \
  ghostscript \
  git \
  gnu-sed \
  gnupg \
  gotop \
  gpg \
  grep \
  hadolint \
  imagemagick \
  jq \
  kubectx \
  kubernetes-cli \
  kubeval \
  lazygit \
  loop \
  moreutils \
  ncdu \
  openblas \
  opencv \
  openssh \
  pigz \
  pinentry-mac \
  pipenv \
  pipx \
  poetry \
  pre-commit \
  pv \
  pyenv \
  readline \
  rename \
  ripgrep \
  screen \
  ssh-copy-id \
  starship \
  tldr \
  tree \
  unixodbc \
  watch \
  wget \
  zplug \
  zsh


#cask programs
echo 'Install Casks'
brew install --cask \
  authy \
  bitwarden \
  dbeaver-community \
  docker \
  firefox \
  font-fira-code-nerd-font \
  google-cloud-sdk \
  google-drive \
  karabiner-elements \
  keepingyouawake \
  keka \
  kitty \
  libreoffice \
  logitech-options \
  meetingbar \
  numi \
  obsidian \
  spotify \
  time-out \
  via \
  visual-studio-code \
  vivaldi \
  vlc \
  whatsapp

# Remove outdated versions from the cellar.
brew cleanup
