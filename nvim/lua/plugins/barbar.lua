return {
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim",
  },
  init = function()
    vim.g.barbar_auto_setup = true
  end,
  opts = {
    animation = true,
    auto_hide = false,
    icons = {
      buffer_index = "superscript",
      buffer_number = false,
    },
    tabpages = true,
    clickable = true,
    focus_on_close = "previous",
    gitsigns = {
      added = { enabled = true, icon = "+" },
      changed = { enabled = true, icon = "~" },
      deleted = { enabled = true, icon = "-" },
    },
  },
  keys = {
    { "<leader>1", "<cmd>BufferGoto 1<cr>", desc = "Buffer 1" },
    { "<leader>2", "<cmd>BufferGoto 2<cr>", desc = "Buffer 2" },
    { "<leader>3", "<cmd>BufferGoto 3<cr>", desc = "Buffer 3" },
    { "<leader>4", "<cmd>BufferGoto 4<cr>", desc = "Buffer 4" },
    { "<leader>5", "<cmd>BufferGoto 5<cr>", desc = "Buffer 5" },
    { "<leader>6", "<cmd>BufferGoto 6<cr>", desc = "Buffer 6" },
    { "<leader>7", "<cmd>BufferGoto 7<cr>", desc = "Buffer 7" },
    { "<leader>0", "<cmd>BufferLast<cr>", desc = "Buffer previous" },
  },
}
