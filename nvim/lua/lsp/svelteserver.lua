local configs = require 'lspconfig/configs'
local util = require 'lspconfig/util'

local server_name = 'svelteserver'

configs[server_name] = {
  default_config = {
    cmd = {'svelteserver', '--stdio'};
    filetypes = {'svelte', 'html.svelte'};
    root_dir = util.root_pattern('yarn.lock', 'package.json');
    log_level = vim.lsp.protocol.MessageType.Info;
    settings = {};
  };
  docs = {
    description = [[
      https://github.com/sveltejs/language-tools

      `svelte-language-server` can be installed with `yarn`:
      ```sh
        yarn global add svelte-language-server
      ```
    ]];
    default_config = {
      root_dir = [[root_pattern('package.json')]];
      on_init = [[function to handle changing offsetEncoding]];
      capabilities = [[default capabilities, with offsetEncoding utf-8]];
    };
  };
}


