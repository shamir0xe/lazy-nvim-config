-- lua/plugins/tmux.lua
return {
  "christoomey/vim-tmux-navigator",
  -- You can add cmd or keys to lazy-load it, but it's so small it's fine to load on startup.
  -- For example, you can tell lazy.nvim which keys this plugin uses.
  keys = {
    { "<c-h>", "<cmd>TmuxNavigateLeft<cr>" },
    { "<c-j>", "<cmd>TmuxNavigateDown<cr>" },
    { "<c-k>", "<cmd>TmuxNavigateUp<cr>" },
    { "<c-l>", "<cmd>TmuxNavigateRight<cr>" },
  },
}
