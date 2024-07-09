return {
  "vimwiki/vimwiki",
  lazy = false,
  init = function()
    vim.g.vimwiki_list = {
      {
        path = "~/Documents/vimwiki",
        syntax = "markdown",
        ext = ".md",
      },
    }
    vim.g.vimwiki_auto_header = 1
    vim.g.vimwiki_global_ext = 0
    vim.treesitter.language.register("markdown", "vimwiki")
  end,
  keys = {
    { "<leader>j", "+Wiki", desc = "Wiki" },
    { "<leader>jw", "<cmd>VimwikiIndex<cr>", desc = "Open wiki index" },
    { "<leader>ju", "<cmd>VimwikiUISelect<cr>", desc = "Show all wiki" },
    { "<leader>jg", "<cmd>VimwikiGoto<cr>", desc = "Goto" },
    { "<leader>jr", "<cmd>VimwikiRename<cr>", desc = "Rename page" },
    { "<leader>jd", "<cmd>VimwikiDelete<cr>", desc = "Delete page" },
    { "<leader>ji", "<cmd>VimwikiDiaryIndex<cr>", desc = "Open diary index" },
    { "<leader>jl", "<cmd>VimwikiDiaryGenerateLinks<cr>", desc = "Regen diary links" },
    { "<leader>jj", "<cmd>VimwikiMakeDiaryNote<cr>", desc = "New diary note" },
    { "<leader>jt", "<cmd>VimwikiTable<cr>", desc = "Insert table" },
    { "<leader>*", "<cmd>VimwikiToggleListItem<cr>", desc = "Toggle todo" },
  },
}
