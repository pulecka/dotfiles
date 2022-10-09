local function get_filetype()
  local filetype = vim.bo.filetype

  if filetype == '' then return '' end
  return string.format(' %s ', filetype)
end

local modes = {
  ['n']  = 'Normal',
  ['v']  = 'Visual',
  ['V']  = 'Visual',
  ['s']  = 'Select',
  ['S']  = 'Select',
  ['i']  = 'Insert',
  ['ic'] = 'Insert',
  ['R']  = 'Replace',
  ['Rv'] = 'V·Replace',
  ['c']  = 'Command',
  ['cv'] = 'Vim·Ex ',
  ['ce'] = 'Ex ',
  ['r']  = 'Prompt ',
  ['rm'] = 'More ',
  ['r?'] = 'Confirm ',
  ['!']  = 'Shell ',
  ['t']  = 'Terminal ',
}

local modeColors = {
  ['n']  = 'StatusNormal',
  ['v']  = 'StatusVisual',
  ['V']  = 'StatusVisual',
  ['s']  = 'StatusNormal',
  ['S']  = 'StatusNormal',
  ['i']  = 'StatusInsert',
  ['ic'] = 'StatusInsert',
  ['R']  = 'StatusNormal',
  ['Rv'] = 'StatusNormal',
  ['c']  = 'StatusCommand',
  ['cv'] = 'StatusNormal',
  ['ce'] = 'StatusNormal',
  ['r']  = 'StatusNormal',
  ['rm'] = 'StatusNormal',
  ['r?'] = 'StatusNormal',
  ['!']  = 'StatusCommand',
  ['t']  = 'StatusCommand',
}

local function get_mode()
  local mode = modes[vim.fn.mode()]
  local color = modeColors[vim.fn.mode()]

  return string.format('%s%s%s %s ', "%#", color, "#", mode)
end

function status_line()
  return table.concat {
    get_mode(),
    "%#Status#",
    " %f ",
    "%-m",
    "%=",
    " Ln %l, Col %c "
  }
end
