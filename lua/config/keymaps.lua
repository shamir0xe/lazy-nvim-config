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
map(
  "n",
  "<leader>an",
  "<cmd>LspPyrightSetPythonPath ./.venv/bin/python3<cr>",
  { desc = "🐍 Set Pyright env path - new" }
)

map("n", "<Enter>", "o<ESC>")
map("n", "<S-Enter>", "O<ESC>")

-- No stupid paste after yanking
map("v", "p", '"_dP')

-- Remap for navigating command-line history
map("t", "<C-j>", "<Down>", { desc = "Next in command history" })
map("t", "<C-k>", "<Up>", { desc = "Previous in command history" })

-- Remap for moving left and right in the command-line
map("t", "<C-h>", "<Left>", { desc = "Move left" })
map("t", "<C-l>", "<Right>", { desc = "Move right" })

map("n", "<leader>at", "<cmd>CodeCompanionChat<cr>", { desc = "Toggle CodeCompanionChat" })

-- The <esc>k/j moving lines problem!
vim.keymap.del("i", "<A-j>")
vim.keymap.del("i", "<A-k>")
vim.keymap.del("n", "<A-j>")
vim.keymap.del("n", "<A-k>")
