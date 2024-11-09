require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd
autocmd("FileType", {
  pattern = "python",
  callback = function(args)
    vim.opt.colorcolumn = "90"
  end,
})
autocmd("BufEnter", {
  callback = function(args)
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
  callback = function(args)
    vim.opt.expandtab = false
    vim.opt.shiftwidth = 8
    vim.opt.softtabstop = 0
    vim.opt.tabstop = 8
  end,
})
autocmd("FileType", {
  pattern = "lua",
  callback = function(args)
    vim.opt.expandtab = true
    vim.opt.shiftwidth = 2
    vim.opt.softtabstop = 2
    vim.opt.tabstop = 2
  end,
})
autocmd("FileType", {
  pattern = "cpp",
  callback = function(args)
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
  callback = function(args)
    vim.opt.expandtab = true
    vim.opt.shiftwidth = 2
    vim.opt.softtabstop = 2

    local cmp = require "cmp"
    local sources = cmp.get_config().sources
    for i = 1, #sources do
      if sources[i].name == "latex_symbols" then
        sources[i].option.strategy = 2
      end
    end

    cmp.setup.buffer { sources = sources }

    vim.keymap.set("i", "<A-i>", "\\item ")
  end,
})
autocmd("FileType", {
  pattern = "*",
  callback = function(args)
    vim.opt_local.formatoptions:remove "c"
    vim.opt_local.formatoptions:remove "r"
    vim.opt_local.formatoptions:remove "o"
  end,
})
