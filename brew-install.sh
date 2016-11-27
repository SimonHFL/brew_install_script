#!/bin/sh

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Upgrade any already-installed formulae
brew upgrade

# Find and fix any issues
brew doctor

# Binaries
binaries=(
git
python3
wget
sshfs
)

# Install Binaries
echo "installing binaries..."
brew install ${binaries[@]}

# Cleanup
brew cleanup

# Install Brew Cask
brew install caskroom/cask/brew-cask

# Tap Versions to install beta versions of apps like Chrome Canary or Sublime Text 3
brew tap caskroom/versions

# Apps
apps=(
atom
google-chrome
google-drive
java
sequel-pro
steam
vlc
alfred
dropbox
sublime-text
virtualbox
fluid
slack
sourcetree
sonos
intellij-idea
screenhero
skype
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

# Cleanup
brew cask cleanup
