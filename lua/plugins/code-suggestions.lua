return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = vim.tbl_deep_extend("force", opts.mapping, {
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-l>"] = cmp.mapping.confirm({ select = true }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      })
      table.insert(opts.sources, { name = "emoji" })
      return opts
    end,
  },
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        keyword = { range = "prefix", regex = "[-_a-zA-Z0-9]" },
        trigger = {
          show_on_keyword = true,
          show_on_trigger_character = true,
        },
        ghost_text = { enabled = true },
        menu = {
          draw = {
            columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
          },
        },
      },
      cmdline = {
        enabled = true,
        keymap = {
          preset = "cmdline",
          ["<C-l>"] = { "show_and_insert", "select_next" },
          ["<C-k>"] = { "select_prev", "fallback" },
          ["<C-j>"] = { "select_next", "fallback" },
        },
        sources = {
          -- "buffer",
          "cmdline",
        },
      },
      keymap = {
        preset = "enter",
        ["<C-l>"] = { "select_and_accept" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
      },
      sources = {
        default = {
          "lsp",
          "path",
          "snippets",
          -- "buffer",
          -- "codeium",
        },
        providers = {
          -- codeium = { name = "Codeium", async = true },
        },
      },
    },
  },
  {
    -- Codeium
    -- "Exafunction/windsurf.vim",
    -- event = "BufEnter",
  },
  {
    "github/copilot.vim",
  },
}
