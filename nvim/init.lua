-- Modeled after Ed's at https://github.com/edsu/nvim
--
-- not ported over yet
vim.cmd 'source ~/.config/nvim/config.vim'

-- https://github.com/nvim-tree/nvim-tree.lua#quick-start
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Use lazy for plugins https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
 
require("lazy").setup({
  { "vim-airline/vim-airline", lazy = false },
  { "vim-airline/vim-airline-themes" },

  { "romgrk/barbar.nvim",
    dependencies = { "lewis6991/gitsigns.nvim" },
    init = function () vim.g.barbar_auto_setup = false end,
  },
  { "nvim-tree/nvim-tree.lua", lazy = false },
  { "nvim-tree/nvim-web-devicons", lazy = true},

  { "airblade/vim-gitgutter" },

  { "ludovicchabant/vim-gutentags" },
  { "preservim/tagbar" },

  { "karb94/neoscroll.nvim" },

  { "hiphish/rainbow-delimiters.nvim" },

  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

  { "neovim/nvim-lspconfig" },
  { "microsoft/pyright" },

  { "stevearc/conform.nvim", opts = {} },

  {
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
      dependencies = { 
        "nvim-lua/plenary.nvim", 
        "debugloop/telescope-undo.nvim",
      }
  },

  {
    "linux-cultist/venv-selector.nvim",
      dependencies = {
        "neovim/nvim-lspconfig", 
        "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
        { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
      },
      lazy = false,
      branch = "regexp", -- This is the regexp branch, use this for the new version
      config = function()
          require("venv-selector").setup()
        end,
        keys = {
          { "<leader>venv", "<cmd>VenvSelect<cr>" },
        },
  },

  { "vim-pandoc/vim-pandoc" },
  { "vim-pandoc/vim-pandoc-syntax" },
  { "preservim/vim-pencil" },

  { "f-person/git-blame.nvim" },

})

-- Ed's plugins
-- Plug('folke/trouble.nvim')
-- Plug('catppuccin/nvim', {as = 'catppuccin'})
--
-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- key mappings
local function nvimtree_on_attach(bufnr)
  local api = require "nvim-tree.api" 
  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  -- default mappings
  api.config.mappings.default_on_attach(bufnr)
end

require("nvim-tree").setup {
  on_attach = nvimtree_on_attach,
  renderer = {
    highlight_git = true,
    highlight_opened_files = "all",
    root_folder_label = false,
  },
  view = {
    width = 30
  }
}
vim.api.nvim_set_keymap("n", "<leader>|", "<cmd>lua require('nvim-tree.api').tree.toggle()<CR>", { noremap = true })

-- https://github.com/romgrk/barbar.nvim?tab=readme-ov-file#options
require("barbar").setup {
  animation = true,
  auto_hide = false,
  icons = {
    buffer_index = "supercript",
    buffer_number = false,
  },
  tabpages = true,
  clickable = true,
  focus_on_close = "left",
}
-- https://github.com/romgrk/barbar.nvim?tab=readme-ov-file#lua
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
-- FIXME: what to do about the <A-?> options, maybe just delete?
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<leader>6', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<leader>7', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<leader>0', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<leader>p', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
-- map('n', '<leader>bd', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

require("rainbow-delimiters.setup").setup {
  highlight = {
    'RainbowDelimiterYellow',
    'RainbowDelimiterBlue',
    'RainbowDelimiterViolet',
    'RainbowDelimiterGreen',
    'RainbowDelimiterOrange',
    'RainbowDelimiterRed',
    -- 'RainbowDelimiterCyan',
  },
}

require("ibl").setup ()
map('n', '<leader>]', '<Cmd>IBLToggle<CR>', opts)

require("lspconfig").pyright.setup {}

-- https://github.com/astral-sh/ruff/blob/main/crates/ruff_server/docs/setup/NEOVIM.md#tips
require('lspconfig').ruff.setup {
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { '*' },
      },
    },
  },
}

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { 
      {"ruff_format", "black" }, 
      {"ruff_organize_imports", "isort" } 
    },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", "prettier" } },
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

-- https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#usage
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- https://github.com/debugloop/telescope-undo.nvim?tab=readme-ov-file#installation
require("telescope").load_extension("undo")
vim.keymap.set('n', '<leader>fz', "<cmd>Telescope undo<cr>")

require("neoscroll").setup( {
  easing = "quadratic"
} )

require("gitblame").setup {
  enabled = false,
}
vim.keymap.set('n', '<leader>gb', "<cmd>GitBlameToggle<cr>")

