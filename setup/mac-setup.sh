# Install Xcode CLI tools
xcode-select --install

# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Brew packages
brew install zsh git tmux neovim fzf ripgrep node yarn

# Install Brew apps
brew install --cask 1password artpip cleanmymac firefox little-snitch parallels slack vlc

# Install Store apps
# Fantastical (975937182)
# GoodNotes (1444383602)
# Magic Lasso (1198047227)
# Pixelmator Pro (1289583905)
# Spark (1176895641)
# The Unarchiver (425424353)
# Things (904280696)
mas install 975937182 1444383602 1198047227 1289583905 1176895641 425424353 904280696

# Install global NPM packages (mostly for LSP)
yarn global add typescript typescript-language-server svelte-language-server

# Link Dotfiles
ln -sv "/users/pulecka/developer/dotfiles/.zshenv" ~
ln -sv "/users/pulecka/developer/dotfiles/zsh" ~/.config/zsh
ln -sv "/users/pulecka/developer/dotfiles/git" ~/.config/git
ln -sv "/users/pulecka/developer/dotfiles/nvim" ~/.config/nvim
ln -sv "/users/pulecka/developer/dotfiles/tmux" ~/.config/tmux

# Load Shell XDG config
source ~/.zshenv

# Install Neovim plugins & Tree-sitter grammars
curl -fLo ${XDG_DATA_HOME}/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim --headless -u "${XDG_CONFIG_HOME}/nvim/lua/plugins.lua" -c "PlugInstall" -c "qall"
