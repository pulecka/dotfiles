# Install Apt packages
sudo apt update
sudo apt install -y git zsh tmux neovim fzf ripgrep nodejs npm

# Install Snap apps
sudo snap install firefox vlc
sudo snap install slack --classic
 
# Install global NPM packages (mostly for LSP)
npm install -g typescript typescript-language-server

# Switch Shell
chsh -s /bin/zsh

# Install Neovim plugins & Tree-sitter grammars
curl -fLo ${XDG_DATA_HOME}/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim --headless -u "${XDG_CONFIG_HOME}/nvim/plug.vim" -c "PlugInstall" -c "qall"
