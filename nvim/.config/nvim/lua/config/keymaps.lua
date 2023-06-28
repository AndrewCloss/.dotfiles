-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Move to window using the <ctrl> neio keys (colemak)
vim.keymap.set("n", "<C-n>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-e>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-i>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-o>", "<C-w>l", { desc = "Go to right window" })
