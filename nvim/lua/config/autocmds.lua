-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- https://github.com/LazyVim/LazyVim/discussions/392#discussioncomment-5214174
vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
