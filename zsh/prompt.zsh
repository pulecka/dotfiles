autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
precmd() {
  vcs_info
}
zstyle ':vcs_info:git*' formats '%F{007}on%f %F{yellow}%b%f '
zstyle ':vcs_info:git*' actionformats '%F{yellow}%a%f %F{007}on%f %F{yellow}%b%f '

local path_string="%F{cyan}%}%~%f"
local prompt_string="»"
local return_status="%(?:%F{white}$prompt_string%f:%F{red}$prompt_string%f) "

setopt prompt_subst
PROMPT='${path_string} ${vcs_info_msg_0_}${return_status}'
