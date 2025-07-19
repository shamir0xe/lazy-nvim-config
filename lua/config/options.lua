-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.snacks_animate = false
vim.g.lazyvim_picker = "telescope"
vim.g.lazyvim_check_order = false

local opt = vim.opt

opt.autowrite = false
opt.relativenumber = false
