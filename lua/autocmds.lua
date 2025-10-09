require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd
autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt.colorcolumn = "90"
  end,
})
autocmd("BufEnter", {
  callback = function()
    if vim.bo.filetype == "fortran" then
      vim.opt.expandtab = true
      vim.opt.shiftwidth = 3
      vim.opt.softtabstop = 3
      vim.opt.tabstop = 3
      vim.opt.colorcolumn = "80"
    end
  end,
})
autocmd("FileType", {
  pattern = "make",
  callback = function()
    vim.opt.expandtab = false
    vim.opt.shiftwidth = 8
    vim.opt.softtabstop = 0
    vim.opt.tabstop = 8
  end,
})
autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt.expandtab = true
    vim.opt.shiftwidth = 2
    vim.opt.softtabstop = 2
    vim.opt.tabstop = 2
  end,
})
autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.opt.expandtab = true
    vim.opt.shiftwidth = 4
    vim.opt.softtabstop = 4
    vim.opt.tabstop = 4
    vim.opt.colorcolumn = "111"
    vim.bo.commentstring = "// %s"
  end,
})

autocmd("FileType", {
  pattern = "tex",
  callback = function()
    vim.opt.expandtab = true
    vim.opt.shiftwidth = 2
    vim.opt.softtabstop = 2
    vim.cmd [[ NoMatchParen ]]

    local cmp = require "cmp"
    local sources = cmp.get_config().sources
    for i = 1, #sources do
      if sources[i].name == "latex_symbols" then
        sources[i].option.strategy = 2
      end
    end

    cmp.setup.buffer { sources = sources }

    vim.keymap.set("i", "<A-i>", "\\item ")
    vim.keymap.set("n", "j", "gj")
    vim.keymap.set("n", "k", "gk")

    local surround_visual = function(start_str, end_str)
      vim.cmd 'normal! "zd'
      -- vim.api.nvim_put({ start_str }, "c", false, false)
      -- vim.cmd 'normal! "zp'
      -- vim.api.nvim_put({ end_str }, "c", true, false)

      local selected_text = vim.fn.getreg "z"
      vim.api.nvim_put({ start_str .. selected_text .. end_str }, "c", false, false)
    end

    vim.keymap.set("v", "$$", function()
      surround_visual("$", "$")
    end, { desc = "Surround with $...$" })
    vim.keymap.set("v", "<F5>", function()
      local ls = require "luasnip"

      vim.cmd 'normal! "zd'
      local selected_text = vim.fn.getreg "z"

      local begin_env = "\\begin{" .. selected_text .. "}"
      local end_env = "\\end{" .. selected_text .. "}"

      local snip = ls.snippet({ snippetType = "snippet" }, {
        ls.text_node { begin_env, "" },
        ls.text_node "\t",
        ls.insert_node(1, "<++>"),
        ls.text_node { "", end_env, "" },
        ls.insert_node(0, "<++>"),
      })

      ls.snip_expand(snip)
    end, { desc = "Surround with environment" })
  end,
})
autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove "c"
    vim.opt_local.formatoptions:remove "r"
    vim.opt_local.formatoptions:remove "o"
  end,
})
