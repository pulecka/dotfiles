#!/bin/sh

# Set up XDG folders
XDG_CONFIG_HOME=~/.config
XDG_CACHE_HOME=~/.cache
XDG_DATA_HOME=~/.local/share

mkdir -p $XDG_CONFIG_HOME
mkdir -p $XDG_CACHE_HOME
mkdir -p $XDG_DATA_HOME

# Install Apt packages
sudo apt-get update
sudo apt-get install -y git fish tmux fzf ripgrep ubuntu-desktop

# Install Snap apps
sudo snap install vlc
sudo snap install nvim --classic
sudo snap install node --classic
sudo snap install slack --classic
 
# Install Neovim plugins & Language servers
npm_config_userconfig=$XDG_CONFIG_HOME/npm/config
npm_config_cache=$XDG_CACHE_HOME/npm

sudo npm install --global typescript typescript-language-server svelte-language-server --userconfig $npm_config_userconfig --cache $npm_config_cache

curl -fLo $XDG_DATA_HOME/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim --headless -u "$XDG_CONFIG_HOME/nvim/lua/plugins.lua" -c "PlugInstall" -c "qall"

# Switch to Fish shell
sudo chsh -s /usr/bin/fish vagrant

echo "set -Ux XDG_CONFIG_HOME $XDG_CONFIG_HOME" | /usr/bin/fish
echo "set -Ux XDG_CACHE_HOME $XDG_CACHE_HOME" | /usr/bin/fish
echo "set -Ux XDG_DATA_HOME $XDG_DATA_HOME" | /usr/bin/fish

echo "set -Ux npm_config_userconfig $npm_config_userconfig" | /usr/bin/fish
echo "set -Ux npm_config_cache $npm_config_cache" | /usr/bin/fish

echo "set -Ux EDITOR /usr/local/bin/nvim" | /usr/local/bin/fish
echo "set -Ux SHELL /usr/local/bin/fish" | /usr/local/bin/fish

sudo shutdown --reboot now
