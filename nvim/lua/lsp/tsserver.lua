local configs = require 'nvim_lsp/configs'
local util = require 'nvim_lsp/util'

local server_name = 'tsserver'

configs[server_name] = {
  default_config = util.utf8_config {
    cmd = {'javascript-typescript-stdio'};
    filetypes = {'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx'};
    root_dir = util.root_pattern('package.json');
    log_level = vim.lsp.protocol.MessageType.Debug;
    settings = {};
  };
  docs = {
    description = [[
      https://github.com/sourcegraph/javascript-typescript-langserver

      `javascript-typescript-langserver` can be installed with `yarn`:
      ```sh
        yarn global add javascript-typescript-langserver
      ```
    ]];
    default_config = {
      root_dir = [[root_pattern('package.json')]];
      on_init = [[function to handle changing offsetEncoding]];
      capabilities = [[default capabilities, with offsetEncoding utf-8]];
    };
  };
}

