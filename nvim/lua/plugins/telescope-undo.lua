return {
  "debugloop/telescope-undo.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  keys = {
    {
      "<leader>fz",
      "<cmd>Telescope undo<cr>",
      desc = "Undo history",
    },
  },
}
