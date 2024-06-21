return {
  "akinsho/bufferline.nvim",
  config = function()
    require("bufferline").setup({
      options = {
        always_show_bufferline = true,
        diagnostics = "nvim_lsp",
        -- highlights = require("catppuccin.groups.integrations.bufferline").get(),
        indicator = {
          style = "underline",
        },
        numbers = function(opts)
          -- lsp error on `opts.raise` and `opts.id` but works!
          return string.format(opts.raise(opts.ordinal))
        end,
        separator_style = "thin",
      },
    })
  end,
  keys = {
    { "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "Buffer 1" },
    { "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "Buffer 2" },
    { "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "Buffer 3" },
    { "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "Buffer 4" },
    { "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "Buffer 5" },
    { "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", desc = "Buffer 6" },
    { "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>", desc = "Buffer 7" },
    { "<leader>b]", "<cmd>BufferLineMoveNext<cr>", desc = "Buffer next" },
    { "<leader>b[", "<cmd>BufferLineMovePrev<cr>", desc = "Buffer prev" },
  },
}
