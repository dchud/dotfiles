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
    -- insert YYYY-MM-DD header
    vim.g.vimwiki_auto_header = 1
    -- don't treat every markdown file as diary entry
    vim.g.vimwiki_global_ext = 0
    vim.treesitter.language.register("markdown", "vimwiki")
    -- template w/unfinished todos and calendar events
    -- via https://mkaz.blog/working-with-vim/vimwiki
    vim.api.nvim_create_autocmd({ "BufNewFile" }, {
      pattern = { "*diary/20*.md" },
      command = "0r! DOTENV_PATH=/Users/dlchudnov/bin/.env /Users/dlchudnov/bin/vimwiki-diary-template.py '%'",
    })
  end,
  keys = {
    { "<leader>j", "+Wiki", desc = "Wiki" },
    { "<leader>jd", "<cmd>VimwikiDelete<cr>", desc = "Delete page" },
    { "<leader>jg", "<cmd>VimwikiGoto<cr>", desc = "Goto" },
    { "<leader>ji", "<cmd>VimwikiDiaryIndex<cr>", desc = "Open diary index" },
    { "<leader>jj", "<cmd>VimwikiMakeDiaryNote<cr>", desc = "New diary note" },
    { "<leader>jl", "<cmd>VimwikiDiaryGenerateLinks<cr>", desc = "Regen diary links" },
    { "<leader>jr", "<cmd>VimwikiRename<cr>", desc = "Rename page" },
    { "<leader>jt", "<cmd>VimwikiTable<cr>", desc = "Insert table" },
    { "<leader>ju", "<cmd>VimwikiUISelect<cr>", desc = "Show all wiki" },
    { "<leader>jw", "<cmd>VimwikiIndex<cr>", desc = "Open wiki index" },
    { "<leader>*", "<cmd>VimwikiToggleListItem<cr>", desc = "Toggle todo" },
  },
}
