#!/bin/sh

# Set up XDG folders
XDG_CONFIG_HOME=~/.config
XDG_CACHE_HOME=~/.cache
XDG_DATA_HOME=~/.local/share

mkdir -p $XDG_CONFIG_HOME
mkdir -p $XDG_CACHE_HOME
mkdir -p $XDG_DATA_HOME

# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Brew packages
brew install fish git tmux neovim fzf ripgrep node corepack

# Install Brew apps
brew install --cask firefox slack vlc

# Install Neovim plugins & Language servers
npm_config_userconfig=$XDG_CONFIG_HOME/npm/config
npm_config_cache=$XDG_CACHE_HOME/npm

corepack enable
npm install --global typescript typescript-language-server svelte-language-server --userconfig $npm_config_userconfig --cache $npm_config_cache

curl -fLo $XDG_DATA_HOME/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim --headless -u "$XDG_CONFIG_HOME/nvim/lua/plugins.lua" -c "PlugInstall" -c "qall"

# Install Dracula terminal theme
curl -fLo $XDG_DATA_HOME/terminal/Dracula.terminal --create-dirs \
       https://raw.githubusercontent.com/dracula/terminal-app/master/Dracula.terminal

curl -fLo $XDG_CONFIG_HOME/fish/conf.d/dracula.fish --create-dirs \
       https://raw.githubusercontent.com/dracula/fish/master/conf.d/dracula.fish

# Switch to Fish shell
sudo chsh -s /usr/local/bin/fish vagrant

echo "set -Ux XDG_CONFIG_HOME $XDG_CONFIG_HOME" | /usr/local/bin/fish
echo "set -Ux XDG_CACHE_HOME $XDG_CACHE_HOME" | /usr/local/bin/fish
echo "set -Ux XDG_DATA_HOME $XDG_DATA_HOME" | /usr/local/bin/fish

echo "set -Ux COREPACK_HOME $XDG_CACHE_HOME/node/corepack" | /usr/local/bin/fish
echo "set -Ux npm_config_userconfig $npm_config_userconfig" | /usr/local/bin/fish
echo "set -Ux npm_config_cache $npm_config_cache" | /usr/local/bin/fish

echo "set -Ux EDITOR /usr/local/bin/nvim" | /usr/local/bin/fish
echo "set -Ux SHELL /usr/local/bin/fish" | /usr/local/bin/fish

open $XDG_DATA_HOME/terminal/Dracula.terminal

