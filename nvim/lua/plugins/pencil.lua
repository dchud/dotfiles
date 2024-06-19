return {
  "preservim/vim-pencil",
  init = function()
    vim.g["pencil#wrapModeDefault"] = "hard"
  end,
  keys = {
    { "<leader>cP", "+Pencil", desc = "Pencil" },
    { "<leader>cPt", "<cmd>PencilToggle<cr>", desc = "Pencil toggle" },
    { "<leader>cPh", "<cmd>PencilHard<cr>", desc = "Pencil hard" },
    { "<leader>cPs", "<cmd>PencilSoft<cr>", desc = "Pencil soft" },
  },
}
