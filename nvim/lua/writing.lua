local zen_mode = require 'zen-mode'
local twilight = require 'twilight'

zen_mode.setup {
  window = {
    backdrop = 1,
    height = 1,
    options = {
      number = false,
      relativenumber = false,
    },
  },
  plugins = {
    twilight = { enabled = true },
  },
}

twilight.setup {
  dimming = {
    alpha = 0.25,
  },
}

vim.g['pencil#wrapModeDefault'] = 'soft'
vim.cmd [[
  autocmd FileType markdown,mkd,text call pencil#init()
]]
