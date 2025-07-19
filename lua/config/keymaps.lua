-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set
map("n", "<leader><Tab>", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Format
map({ "n", "v" }, "<leader>F", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

vim.keymap.del("n", "<leader><tab>l")
vim.keymap.del("n", "<leader><tab>o")
vim.keymap.del("n", "<leader><tab>f")
vim.keymap.del("n", "<leader><tab><tab>")
vim.keymap.del("n", "<leader><tab>]")
vim.keymap.del("n", "<leader><tab>[")
vim.keymap.del("n", "<leader><tab>d")

map("n", "<leader>bb", function()
  require("telescope.builtin").buffers({ sort_mru = true })
end, { desc = "Find buffers" })

map("n", "<leader>b%", "<cmd>vsplit<cr>", { desc = "split the buffer to right" })
map("n", '<leader>b"', "<cmd>split<cr>", { desc = "split the buffer to bot" })

map("n", "<leader>ap", "<cmd>PyrightSetPythonPath ./.venv/bin/python3<cr>", { desc = "🐍 Set Pyright env path" })

map("n", "<Enter>", "o<ESC>")
map("n", "<S-Enter>", "O<ESC>")

-- No stupid paste after yanking
map("v", "p", '"_dP')
