local coding_file_types = {
  "go", "c", "cpp", "cs", "java", "cuda", "proto",
  "javascript", "javascriptreact", "typescript", "typescriptreact",
  "vue", "python", "ruby", "php", "perl", "rust",
  "lua", "bash", "sh", "zsh", "kotlin", "scala",
  "swift", "objective-c", "dart", "groovy", "elixir", "erlang",
  "haskell", "ocaml", "fsharp", "clojure", "r", "sql"
}

local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "buf-language-server",
        "clangd",
        "eslint_d",
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
    "nvim-treesitter/nvim-treesitter-context",
    after = "nvim-treesitter",
    config = function()
      require("treesitter-context.config").setup()
    end,
  },
  {
    "typescript-language-server",
  },
  -- Highlight variables on hover
  {
    "RRethy/vim-illuminate",
    ft = coding_file_types,
    config = function()
      require('illuminate').configure({
        providers = { 'lsp', 'treesitter' },
        filetypes_denylist = {},
        filetypes_allowlist = coding_file_types,
      })
    end
  },
  -- https://github.com/sontungexpt/stcursorword
  -- {
  --   "sontungexpt/stcursorword",
  --   event = "VeryLazy",
  --   config = function()
  --     require("stcursorword").setup({ highlight = { underline = false, bg = "#ffffff" } })
  --   end,
  -- },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    'karb94/neoscroll.nvim',
    keys = { '<C-d>', '<C-u>', '<C-b>', '<C-f>', 'zt', 'zz', 'zb' },
    config = function()
      require('neoscroll').setup()
    end,
  },
  -- Vim practice game
  {
    "ThePrimeagen/vim-be-good",
  },
  {
    "github/copilot.vim",
    ft = "*",
  },
}
return plugins
