return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      -- pyright will be automatically installed with mason and loaded with lspconfig
      pyright = {},
    },
    require("lspconfig").ruff_lsp.setup({
      init_options = {
        settings = {
          args = {},
        },
      },
    }),
  },
}
