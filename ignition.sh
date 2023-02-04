#!/bin/zsh

# Purpose: Automates the setup of a MacOS development environment

set -e

function install_oh_my_zsh {
  echo "Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh::g' | sed 's:chsh -s .*$::g')"
}

function install_homebrew {
  echo "Installing Homebrew..."
  sudo -H mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
  echo 'PATH=$PATH:~/homebrew/sbin:~/homebrew/bin:/opt/local/bin' >> ~/.zshrc
  chsh -s /bin/zsh
  brew update
  export HOMEBREW_NO_ANALYTICS=1
  brew analytics off
  sudo chown -R $(whoami) /usr/local/lib/pkgconfig
}

function install_brew_packages {
echo "Installing Brew Packages..."
brew bundle --file=Desktop/MACOSSetupScript/Brewfile
}

function download_openvpn_config {
  echo "Downloading OpenVPN config..."
  git clone https://github.com/dr0pp3dpack3ts/openssh-files.git
  openvpn --import-config --config-file=Desktop/openssh-files/cyberalvin.ovpn
}

function start_macos_services {
  echo "Starting MacOS services..."
  softwareupdate -i -a --restart
}

install_oh_my_zsh
install_homebrew
install_brew_packages
install_zsh_tools
download_openvpn_config
install_powerlevel10k
start_macos_services

echo "MacOS development environment setup complete!"
