return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    "mfussenegger/nvim-dap-python",
  },
  lazy = false,
  branch = "regexp",
  config = function()
    require("venv-selector").setup()
  end,
  keys = {
    { "<leader>venv", "<cmd>VenvSelect<cr>" },
  },
}