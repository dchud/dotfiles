-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Format text to 80 char width
map("n", "<leader>F", "{!}fmt -w 80<cr>}", { desc = "¶ → 80" })
