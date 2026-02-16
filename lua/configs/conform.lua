local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- css = { "prettier" },
    -- html = { "prettier" },
    python = { "ruff_format", "isort" },
    cpp = { "clang-format" },
    toml = function(bufnr)
      local filepath = vim.api.nvim_buf_get_name(bufnr)
      local filename = vim.fn.fnamemodify(filepath, ":t")

      if filename == "pyproject.toml" then
        return { "pyproject-fmt" }
      else
        return {}
      end
    end,
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    if not vim.g.autoformat_enabled then
      return
    end
    -- if not vim.api.nvim_buf_is_valid(args.buf) or vim.bo[args.buf].buftype ~= "" then
    --   return
    -- end
    require("conform").format {}
  end,
})

require("conform").setup(options)
