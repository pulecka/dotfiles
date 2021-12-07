alias git=/usr/local/bin/git
alias vim=/usr/local/bin/nvim

function vim
  /usr/local/bin/nvim
end

function git
  /usr/local/bin/nvim $argv
end

alias update="zsh ~/.scripts/update.zsh"

alias cleanupds="find . -type f -name '*.DS_Store' -ls -delete"
