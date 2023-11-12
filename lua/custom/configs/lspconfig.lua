local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- Go
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
    }
  }
}

-- Protobuf
lspconfig.bufls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"bufls", "serve"},
  filetypes = {"proto"},
  root_dir = util.root_pattern("bug.gen.yaml", "buf.yaml", ".git")
}


-- C
lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"clangd"},
  filetypes = {"c"},
}

-- Typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = false,
    }
  },
}

lspconfig.eslint.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"eslint_d", "--stdin", "--stdin-filename", "$FILENAME",},
  filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact"},
  root_dir = util.root_pattern(".eslintrc.js", ".eslintrc.json", ".eslintrc", ".git", ".eslintrc.cjs")
}

-- Python
lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
}

-- PHP
lspconfig.intelephense.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"intelephense", "--stdio"},
  filetypes = {"php"},
}
