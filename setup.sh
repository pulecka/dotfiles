# Set up XDG folders
XDG_CONFIG_HOME=~/.config
XDG_CACHE_HOME=~/.cache
XDG_DATA_HOME=~/.local/share

mkdir -p $XDG_CONFIG_HOME
mkdir -p $XDG_CACHE_HOME
mkdir -p $XDG_DATA_HOME

# Configure SSH
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

# Install Xcode CLI tools
xcode-select --install

# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Brew packages
brew install zsh git tmux neovim fzf ripgrep node corepack

# Install Brew apps
brew install --cask 1password artpip cleanmymac firefox little-snitch parallels slack vlc

# Checkout Dotfiles
mkdir -p ~/Developer
cd ~/Developer
git clone git@github.com:pulecka/dotfiles.git

# Link Dotfiles
mkdir -p $XDG_CONFIG_HOME/git
ln -sv "dotfiles/git/config" $XDG_CONFIG_HOME/git/config

mkdir -p $XDG_CONFIG_HOME/fish
mkdir -p $XDG_CONFIG_HOME/fish/conf.d
ln -sv "dotfiles/fish/config.fish" $XDG_CONFIG_HOME/fish/config.fish
ln -sv "dotfiles/fish/functions" $XDG_CONFIG_HOME/fish/functions
ln -sv "dotfiles/vagrant/vagrantvm.fish" $XDG_CONFIG_HOME/fish/conf.d/vagrantvm.fish

mkdir -p $XDG_CONFIG_HOME/tmux
ln -sv "dotfiles/tmux/tmux.conf" $XDG_CONFIG_HOME/tmux/tmux.conf
ln -sv "dotfiles/tmux/project.tmux" $XDG_DATA_HOME/tmux/project.tmux

ln -sv "dotfiles/nvim" $XDG_CONFIG_HOME/nvim

# Install Neovim plugins & Language servers
NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/config
NPM_CONFIG_CACHE=$XDG_CACHE_HOME/npm

npm install --global typescript typescript-language-server svelte-language-server

curl -fLo $XDG_DATA_HOME/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim --headless -u "$XDG_CONFIG_HOME/nvim/lua/plugins.lua" -c "PlugInstall" -c "qall"

# Switch to Fish shell
chsh -s /usr/local/bin/fish

set -U XDG_CONFIG_HOME $XDG_CONFIG_HOME
set -U XDG_CACHE_HOME $XDG_CACHE_HOME
set -U XDG_DATA_HOME $XDG_DATA_HOME

# Install Dracula terminal theme
mkdir -p $XDG_DATA_HOME/terminal
curl -fLo $XDG_DATA_HOME/terminal/Dracula.terminal \
       https://raw.githubusercontent.com/dracula/terminal-app/master/Dracula.terminal

curl -fLo $XDG_CONFIG_HOME/fish/conf.d/dracula.fish \
       https://raw.githubusercontent.com/dracula/fish/master/conf.d/dracula.fish

open $XDG_DATA_HOME/terminal/Dracula.terminal
