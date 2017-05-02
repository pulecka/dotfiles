# Link brewfile
ln -sv "/users/pulecka/developer/dotfiles/.brewfile" ~

# Link scripts
ln -sv "/users/pulecka/developer/dotfiles/.scripts" ~

# Link dotfiles
ln -sv "/users/pulecka/developer/dotfiles/.gitconfig" ~
ln -sv "/users/pulecka/developer/dotfiles/.tmux.conf" ~
ln -sv "/users/pulecka/developer/dotfiles/.vimrc" ~
ln -sv "/users/pulecka/developer/dotfiles/.zshrc" ~
ln -sv "/users/pulecka/developer/dotfiles/.atom" ~
ln -sv "/users/pulecka/developer/dotfiles/.vim" ~
ln -sv "/users/pulecka/developer/dotfiles/.zsh" ~

# Reload current shell profile
source ~/.zshrc
