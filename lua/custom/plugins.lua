local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "buf-language-server",
        "clangd",
        "eslint-lsp",
        "prettierd",
        "pyright",
        "mypy",
        "ruff",
        "black",
        "intelephense",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    ft = {"go", "c", "cpp", "cs", "java", "cuda", "proto", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "jsonc", "yaml", "markdown", "markdown.mdx", "graphql", "handlebars", "python" },
    opts = function ()
      return require "custom.configs.null-ls"
    end
  },
  {
    "ThePrimeagen/vim-be-good",
  },
  {
    "github/copilot.vim",
    ft = "*",
  },
  {
    "typescript-language-server",
  },
}
return plugins
