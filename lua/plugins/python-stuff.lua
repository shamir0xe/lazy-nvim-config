return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["python"] = { "black" },
        ["yaml"] = { "prettier" },
      },
    },
  },
  {
    "tweekmonster/django-plus.vim",
  },
}
