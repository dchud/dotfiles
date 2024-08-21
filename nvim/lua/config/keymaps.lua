-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Format text to 80 char width
map("n", "<leader>F", "{!}fmt -w 80<cr>}", { desc = "¶ → 80" })

-- Typewriter options
-- https://github.com/joshuadanpeterson/typewriter.nvim/wiki/TW-%60keep_cursor_position%60-Feature#example-key-mappings
vim.api.nvim_set_keymap("n", "<leader>t", "+Typewriter", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>te", ":TWEnable<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>td", ":TWDisable<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tw", ":TWToggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tc", ":TWCenter<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tt", ":TWTop<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tb", ":TWBottom<cr>", { noremap = true, silent = true })
