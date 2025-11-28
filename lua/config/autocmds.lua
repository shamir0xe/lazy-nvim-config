-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- vim.api.nvim_del_augroup_by_name("LazyFormat")

local augroup = vim.api.nvim_create_augroup("HelmFiletype", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufRead" }, {
  group = augroup,
  pattern = "*", -- Check on every file
  callback = function()
    -- Find the root of the helm chart by looking for Chart.yaml
    local chart_yaml_path = vim.fn.findfile("Chart.yaml", ".;")

    -- If a Chart.yaml is found, we are inside a helm chart
    if chart_yaml_path ~= "" then
      -- Get the file extension of the current buffer
      local extension = vim.fn.expand("%:e")

      -- Set the filetype to 'helm' for common helm file extensions
      if extension == "yaml" or extension == "yml" or extension == "tpl" then
        vim.bo.filetype = "helm"
      end
    end
  end,
})
