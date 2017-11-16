#!/usr/bin/env bash

# Install command-line tools using Homebrew.

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
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`. To do so, run `sudo chsh -s /usr/local/bin/bash`.
brew install bash
brew install bash-completion2

# # Switch to using brew-installed bash as default shell
# if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
#   echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
#   chsh -s /usr/local/bin/bash;
# fi;



# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen


# Install other useful binaries.
brew install ack
brew install dark-mode
brew install git
brew install git-lfs
brew install gpg
brew install imagemagick --with-webp
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rhino
brew install speedtest_cli
brew install ssh-copy-id
brew install testssl
brew install tree
brew install vbindiff
brew install webkit2png
brew install zopfli

#DS
brew install r
brew install python
brew install python3
brew install jq
brew install gdal
brew install geos

#cask programs
echo 'Install Casks'
brew cask install rstudio
brew cask install google-chrome
brew cask install spotify
brew cask install flux
brew cask install gpower
brew cask install github-desktop
brew cask install keka
brew cask install vlc
brew cask install mactex
brew cask install slack
brew cask install cyberduck
brew cask install docker
brew cask install docker-toolbox
brew cask install dbeaver-community
brew cask install iterm2
brew cask install typora
brew cask install java

#Atom stuff
echo 'Install atom packages...'
brew cask install atom
apm install Hydrogen
apm install atom-clock
apm install atom-jinja2
apm install autocomplete-emojis
apm install autocomplete-paths
apm install autocomplete-python
apm install busy-signal
apm install color-tabs
apm install file-icons
apm install highlight-selected
apm install hyperclick
apm install indent-guide-improved
apm install intentions
apm install jumpy
apm install kite
apm install language-docker
apm install language-pug
apm install language-r
apm install linter
apm install linter-lintr
apm install linter-pycodestyle
apm install linter-ui-default
apm install multi-cursor-plus
apm install pigments
apm install python-indent
apm install python-tools
apm install script

# Remove outdated versions from the cellar.
brew cleanup

#oh-my-zsh!
#do this last as it stops the current shell.
echo 'now installing oh-my-zsh'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

brew install zsh-autosuggestions
brew install zsh-completions
