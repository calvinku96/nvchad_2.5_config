local def = require "nvchad.configs.cmp"
local cmp = require "cmp"
local snip = require "luasnip"
local override = {
  mapping = {
    ["<C-j>"] = cmp.mapping(function(fallback)
      -- if vim.bo.filetype == "tex" then
      --   vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>IMAP_JumpForward", true, true, true), "")
      -- elseif snip.expand_or_jumpable() then
      if snip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      elseif cmp.visible() then
        cmp.select_next_item { behaviour = cmp.SelectBehavior.Insert }
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-k>"] = cmp.mapping(function(fallback)
      if snip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      elseif cmp.visible() then
        cmp.select_prev_item { behaviour = cmp.SelectBehavior.Insert }
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-n>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item { behaviour = cmp.SelectBehavior.Insert }
      elseif snip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-p>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item { behaviour = cmp.SelectBehavior.Insert }
      elseif snip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<tab>"] = cmp.mapping(function(fallback)
      if snip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-tab>"] = cmp.mapping(function(fallback)
      if snip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-y>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ["<C-l>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ["<CR>"] = cmp.config.disable,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
    {
      name = "latex_symbols",
      option = {
        strategy = 0,
      },
    },
  },
}
-- print "===========================BEFORE==========================="
-- vim.print(def)
res = vim.tbl_deep_extend("force", def, override)
-- print "===========================AFTER==========================="
-- vim.print(res)
return res
