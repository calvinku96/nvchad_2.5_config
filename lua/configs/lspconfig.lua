-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "bashls", "cmake", "fortls", "rust_analyzer", "julials" }
local enable_ltex = false

-- lsps with default config
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })
  vim.lsp.enable(lsp)
end

vim.lsp.config("clangd", {
  on_attach = on_attach,
  capabilities = vim.tbl_deep_extend("force", capabilities, { offsetEncoding = "utf-8" }),
  cmd = { "clangd", "--header-insertion=never" },
})
vim.lsp.enable "clangd"
vim.lsp.config("pyright", {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
      },
    },
  },
})
vim.lsp.enable "pyright"
if vim.fn.executable "java" and enable_ltex then
  -- local word_file = (vim.fn.stdpath "config") .. "/spell/en.utf-8.add"
  vim.lsp.config("ltex", {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      require("ltex_extra").setup {
        path = vim.fn.stdpath "config" .. "/spell/",
      }
    end,
    on_init = on_init,
    capabilities = capabilities,
    filetypes = { "tex" },
    settings = {
      ltex = {
        dictionary = {
          -- ["en-US"] = { ":" .. word_file },
          ["en-US"] = { ":/home/calvin/.config/nvim/spell/spell.txt" },
        },
      },
    },
  })
  vim.lsp.enable "ltex"
end
