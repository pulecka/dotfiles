# Install Xcode CLI tools
xcode-select --install

# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Brew packages
brew install zsh git tmux neovim fzf ripgrep node

# Install Brew apps
brew install --cask firefox slack vlc

# Install Store apps
# Fantastical (975937182)
# Spark (1176895641)
# The Unarchiver (425424353)
# Things (904280696)
mas install 975937182 1176895641 425424353 904280696

# Install global NPM packages (mostly for LSP)
npm install -g typescript typescript-language-server

# Load Shell XDG config
source ~/.zshenv

# Install Neovim plugins & Tree-sitter grammars
curl -fLo ${XDG_DATA_HOME}/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim --headless -u "${XDG_CONFIG_HOME}/nvim/plug.vim" -c "PlugInstall" -c "qall"

