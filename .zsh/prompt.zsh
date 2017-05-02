local host_name="%F{cyan}%m%f"
local path_string="%F{yellow}%}%~%f"
local prompt_string="»"
local return_status="%(?:%F{white}$prompt_string%f:%F{red}$prompt_string%f)"

PROMPT="${host_name} ${path_string} ${return_status} "
