# Set up XDG folders
XDG_CONFIG_HOME=~/.config
XDG_CACHE_HOME=~/.cache
XDG_DATA_HOME=~/.local/share

mkdir -p $XDG_CONFIG_HOME
mkdir -p $XDG_CACHE_HOME
mkdir -p $XDG_DATA_HOME

NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/config
NPM_CONFIG_CACHE=$XDG_CACHE_HOME/npm

# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Brew packages
brew install fish git tmux neovim fzf ripgrep node corepack

# Install Brew apps
brew install --cask firefox slack vlc

# Install Neovim plugins & Language servers
corepack enable
npm install --global typescript typescript-language-server

curl -fLo $XDG_DATA_HOME/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim --headless -u "$XDG_CONFIG_HOME/nvim/lua/plugins.lua" -c "PlugInstall" -c "qall"

# Install Dracula terminal theme
mkdir -p $XDG_DATA_HOME/terminal
curl -fLo $XDG_DATA_HOME/terminal/Dracula.terminal \
       https://raw.githubusercontent.com/dracula/terminal-app/master/Dracula.terminal

curl -fLo $XDG_CONFIG_HOME/fish/conf.d/dracula.fish \
       https://raw.githubusercontent.com/dracula/fish/master/conf.d/dracula.fish

# Switch to Fish shell
sudo chsh -s /usr/local/bin/fish vagrant

echo "set -U XDG_CONFIG_HOME $XDG_CONFIG_HOME" | /usr/local/bin/fish
echo "set -U XDG_CACHE_HOME $XDG_CACHE_HOME" | /usr/local/bin/fish
echo "set -U XDG_DATA_HOME $XDG_DATA_HOME" | /usr/local/bin/fish

echo "set -U NPM_CONFIG_USERCONFIG $NPM_CONFIG_USERCONFIG" | /usr/local/bin/fish
echo "set -U NPM_CONFIG_CACHE $NPM_CONFIG_CACHE" | /usr/local/bin/fish

open $XDG_DATA_HOME/terminal/Dracula.terminal

# Switch to Fish shell
sudo chsh -s /usr/local/bin/fish pulecka

echo "set -U XDG_CONFIG_HOME $XDG_CONFIG_HOME" | /usr/local/bin/fish
echo "set -U XDG_CACHE_HOME $XDG_CACHE_HOME" | /usr/local/bin/fish
echo "set -U XDG_DATA_HOME $XDG_DATA_HOME" | /usr/local/bin/fish

open $XDG_DATA_HOME/terminal/Dracula.terminal

