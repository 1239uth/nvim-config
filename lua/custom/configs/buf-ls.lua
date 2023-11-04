local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'
local util = require("lspconfig/util")

if not lspconfig.buf_ls then
  configs.buf_ls = {
    default_config = {
      cmd = {'bufls', 'serve'},
      filetypes = {'proto'},
      root_dir = util.root_pattern("bug.gen.yaml", "buf.yaml", ".git"),
    };
  }
end

