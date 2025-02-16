-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "bashls", "cmake", "fortls", "rust_analyzer" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = vim.tbl_deep_extend("force", capabilities, { offsetEncoding = "utf-8" }),
  cmd = { "clangd", "--header-insertion=never" },
}
lspconfig.pyright.setup {
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
}
if vim.fn.executable "java" then
  word_file = (vim.fn.stdpath "config") .. "/spell/en.utf-8.add"
  lspconfig.ltex.setup {
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
  }
end
