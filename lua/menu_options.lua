return function(mode)
  return {
    {
      name = "Copy",
      cmd = function()
        -- vim.cmd.normal { '"+y', bang = true }
        if mode == "n" then
          vim.cmd "y+"
        else
          vim.cmd "'<,'>y+"
        end
      end,
      rtxt = "<C-c>",
    },
    {
      name = "Paste",
      cmd = function()
        vim.cmd.normal { '"+p', bang = true }
      end,
      rtxt = "<C-v>",
    },
    {
      name = "Delete",
      cmd = function()
        if mode == "n" then
          vim.cmd "d"
        else
          vim.cmd "'<,'>d"
        end
      end,
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
end
