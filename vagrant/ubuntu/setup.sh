# Install Apt packages
sudo apt update
sudo apt install -y git fish tmux fzf ripgrep

# Install Snap apps
sudo snap install firefox vlc
sudo snap install nvim --classic
sudo snap install node --classic
sudo snap install slack --classic
 
# Install global NPM packages (mostly for LSP)
npm install -g typescript typescript-language-server

# Switch Shell
chsh -s /usr/bin/fish

# Install Neovim plugins & Tree-sitter grammars
curl -fLo ${XDG_DATA_HOME}/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim --headless -u "${XDG_CONFIG_HOME}/nvim/lua/plugins.lua" -c "PlugInstall" -c "qall"
