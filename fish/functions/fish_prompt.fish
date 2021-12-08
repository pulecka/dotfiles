function fish_prompt
  set -g fish_prompt_pwd_dir_length 0
  set -g __fish_git_prompt_showcolorhints true
  set -g __fish_git_prompt_showdirtystate true
  set -g __fish_git_prompt_show_informative_status true
  set -g __fish_git_prompt_char_stateseparator '|'
  set -g __fish_git_prompt_color_branch $fish_color_command
  set -g __fish_git_prompt_color_dirtystate $fish_color_param
  set -g __fish_git_prompt_char_dirtystate '*'
  set -g __fish_git_prompt_color_invalidstate $fish_color_error
  set -g __fish_git_prompt_char_invalidstate 'x'
  set -g __fish_git_prompt_color_stagedstate $fish_color_command
  set -g __fish_git_prompt_char_stagedstate '+'
  set -g __fish_git_prompt_color_untrackedfiles $fish_color_quote
  set -g __fish_git_prompt_char_untrackedfiles '?'

  if set -q SSH_TTY
    set prompt_host $hostname
  end
  printf '%s%s@%s %s%s%s%s > ' (set_color $fish_color_param) $USER $prompt_host (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) (fish_git_prompt)
end
