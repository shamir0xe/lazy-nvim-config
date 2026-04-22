return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters = {
        mbake = {
          command = "mbake",
          args = {
            "format",
            "--config",
            vim.fn.expand("~/.bake.toml"),
            "$FILENAME",
          },
          stdin = false,
        },
      },
      formatters_by_ft = {
        ["python"] = { "black" },
        ["yaml"] = { "prettier" },
        ["make"] = { "mbake" },
      },
    },
  },
  {
    "tweekmonster/django-plus.vim",
  },
}
