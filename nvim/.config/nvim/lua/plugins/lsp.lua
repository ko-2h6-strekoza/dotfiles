return {

  -- Mason
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {},
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "pyright",
        "jsonls",
        "yamlls",
      },
    },
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })

      vim.lsp.enable("lua_ls")
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("pyright")
      vim.lsp.enable("jsonls")
      vim.lsp.enable("yamlls")

      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
      vim.keymap.set("n", "[e", vim.diagnostic.goto_prev)
      vim.keymap.set("n", "]e", vim.diagnostic.goto_next)

      vim.keymap.set("n", "K", vim.lsp.buf.hover)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
      -- vim.keymap.set("n", "gr", vim.lsp.buf.references)
      vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references)
      vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
      vim.keymap.set("v", "<leader>f", vim.lsp.buf.format)
    end,
  },

  -- Completion
  {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
      keymap = { preset = "default" },
      appearance = { nerd_font_variant = "mono" },
      completion = { documentation = { auto_show = true } },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
  },

}
