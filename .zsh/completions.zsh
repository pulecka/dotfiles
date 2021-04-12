fpath=(/usr/local/share/zsh-completions $fpath)
autoload -U compinit
compinit -i

zstyle ':completion:*' menu select

