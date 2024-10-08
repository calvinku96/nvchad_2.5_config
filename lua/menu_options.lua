return {
  {
    name = "Copy",
    cmd = "%y+",
    rtxt = "<C-c>",
  },
  {
    name = "Paste",
    cmd = "%p+",
    rtxt = "<C-v>",
  },
  {
    name = "Delete",
    cmd = "%d",
    rtxt = "dc",
  },
  { name = "separator" },
  {
    name = "  Lsp Actions",
    hl = "Exblue",
    items = "lsp",
  },
  {
    name = "Code Actions",
    cmd = vim.lsp.buf.code_action,
    rtxt = "<leader>a",
  },
  {
    name = "Format Buffer",
    cmd = function()
      local ok, conform = pcall(require, "conform")

      if ok then
        conform.format { lsp_fallback = true }
      else
        vim.lsp.buf.format()
      end
    end,
    rtxt = "<leader>fm",
  },
  { name = "separator" },

  {
    name = "  Color Picker",
    cmd = function()
      require("minty.huefy").open()
    end,
  },
}
