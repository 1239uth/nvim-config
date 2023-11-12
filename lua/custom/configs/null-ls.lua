local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local opts = {
  sources = {
    -- Go
    formatting.gofumpt,
    formatting.goimports_reviser,
    formatting.golines,
    -- Protobuf
    formatting.buf,
    formatting.clang_format.with({
      disabled_filetypes = { "proto" },
    }),
    -- Typescript
    formatting.prettierd,
    lint.eslint_d,
    formatting.eslint_d.with({
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      args = { "--stdin", "--stdin-filename", "$FILENAME", "--fix-to-stdout" },
    }),
    -- Python
    lint.mypy,
    lint.ruff,
    formatting.black,
  },
  on_attach = function (client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function ()
          vim.lsp.buf.format({ bufnr = bufnr })
        end
      })
    end
  end
}
return opts
