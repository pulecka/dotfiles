#!/bin/sh

echo "Setting up new Mac machine..."

# Set up XDG folders
XDG_CONFIG_HOME=~/.config
XDG_CACHE_HOME=~/.cache
XDG_DATA_HOME=~/.local/share

mkdir -p $XDG_CONFIG_HOME
mkdir -p $XDG_CACHE_HOME
mkdir -p $XDG_DATA_HOME

# Install Xcode CLI tools
echo "Starting Xcode CLI tools installation..."
$(xcode-select --install > /dev/null 2>&1)

# Configure SSH
echo "Configuring SSH..."
mkdir -p ~/.ssh
ssh-keygen -t ed25519 -C "martin@pulecka.dev"

touch ~/.ssh/config
echo "Host *" >> ~/.ssh/config
echo "  AddKeysToAgent yes" >> ~/.ssh/config
echo "  UseKeychain yes" >> ~/.ssh/config
echo "  IdentityFile ~/.ssh/id_ed25519" >> ~/.ssh/config

eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_ed25519

pbcopy < ~/.ssh/id_ed25519.pub
read -p "Copied public key (id_ed25519.pub) into clipboard. Continue after adding key to Github account." x

# Wait for Xcode CLI tools installation
xcode_status=$(xcode-select -p > /dev/null 2>&1; echo $?)
echo "Waiting for Xcode CLI tools installation\c"
while [ ! $xcode_status == 0 ]
do
  sleep 10
  xcode_status=$(xcode-select -p > /dev/null 2>&1; echo $?)
  echo ".\c"
done

# Install Brew
echo "Installing Homebrew package manager..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Brew packages
echo "Installing Homebrew packages..."
brew install fish git tmux neovim fzf ripgrep node

# Install Brew apps
echo "Installing Homebrew apps..."
brew install --cask 1password 1password-cli box-drive cleanmymac firefox nova sketch slack warp

# Checkout dotfiles
echo "Checking out dotfile configuration repo..."
mkdir -p ~/Developer
cd ~/Developer
git clone git@github.com:pulecka/dotfiles.git

# Link dotfiles
echo "Setting up dotfile configurations..."
mkdir -p $XDG_CONFIG_HOME/git
ln -sv ~/Developer/dotfiles/git/config $XDG_CONFIG_HOME/git/config

mkdir -p $XDG_CONFIG_HOME/fish/conf.d
ln -sv ~/Developer/dotfiles/fish/config.fish $XDG_CONFIG_HOME/fish/config.fish
ln -sv ~/Developer/dotfiles/fish/functions $XDG_CONFIG_HOME/fish

mkdir -p $XDG_CONFIG_HOME/tmux/templates
ln -sv ~/Developer/dotfiles/tmux/tmux.conf $XDG_CONFIG_HOME/tmux/tmux.conf
ln -sv ~/Developer/dotfiles/tmux/project.tmux $XDG_CONFIG_HOME/tmux/templates/project.tmux

ln -sv ~/Developer/dotfiles/nvim $XDG_CONFIG_HOME

# Install Neovim plugins & Language servers
echo "Installing Neovim plugins & Language servers..."
npm_config_userconfig=$XDG_CONFIG_HOME/npm/config
npm_config_cache=$XDG_CACHE_HOME/npm

corepack enable
npm install --global typescript typescript-language-server svelte-language-server --userconfig $npm_config_userconfig --cache $npm_config_cache

curl -fLo $XDG_DATA_HOME/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim --headless -u "$XDG_CONFIG_HOME/nvim/lua/plugins.lua" -c "PlugInstall" -c "qall"

# Switch to Fish shell
echo "Setting up Fish shell..."
sudo chsh -s /usr/local/bin/fish pulecka

echo "set -Ux EDITOR /usr/local/bin/nvim" | /usr/local/bin/fish
echo "set -Ux SHELL /usr/local/bin/fish" | /usr/local/bin/fish

echo "set -Ux XDG_CONFIG_HOME $XDG_CONFIG_HOME" | /usr/local/bin/fish
echo "set -Ux XDG_CACHE_HOME $XDG_CACHE_HOME" | /usr/local/bin/fish
echo "set -Ux XDG_DATA_HOME $XDG_DATA_HOME" | /usr/local/bin/fish

echo "set -Ux COREPACK_HOME $XDG_CACHE_HOME/node/corepack" | /usr/local/bin/fish
echo "set -Ux npm_config_userconfig $npm_config_userconfig" | /usr/local/bin/fish
echo "set -Ux npm_config_cache $npm_config_cache" | /usr/local/bin/fish

echo "Mac setup complete."
