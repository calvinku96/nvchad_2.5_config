local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- css = { "prettier" },
    -- html = { "prettier" },
    python = { "isort", "black" },
    cpp = { "clang_format" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}
-- vim.api.nvim_create_autocmd(
--   "BufWritePre", {
--     pattern = "*",
--     callback = function(arg)
--       require("conform").format{bufnr=args.buf}
--     end
--   }
--
-- )

require("conform").setup(options)
