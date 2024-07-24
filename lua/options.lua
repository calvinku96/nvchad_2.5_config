require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
--
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

vim.cmd [[ let fortran_do_enddo=1 ]]
vim.cmd [[ let frotran_free_source=1 ]]
vim.cmd [[ let fortran_free_source=1 ]]
if vim.g.neovide then
  vim.g.neovide_scroll_animation_length = 0
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_cursor_trail_size = 0
  vim.g.neovide_cursor_animate_in_insert_mode = false
  vim.g.neovide_cursor_animate_command_line = false
end

vim.opt.guifont = { "UbuntuMono Nerd Font Mono:h11" }
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = "auto"
vim.opt.wrap = true
vim.opt.scrolloff = 0
vim.opt.sidescrolloff = 0
vim.opt.breakindent = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.linebreak = false
vim.opt.showmode = true
vim.opt.splitkeep = "cursor"
vim.opt.completeopt = "menuone,noselect,noinsert"
vim.g.mapleader = " "
vim.g.autoformat_enabled = true
vim.g.cmp_enabled = true
vim.g.diagnostics_mode = 0
vim.g.icons_enabled = true
vim.g.ui_notifications_enabled = true
vim.g.tex_conceal = ""
vim.g.highlighturl_enabled = false
vim.g.Tex_DefaultTargetFormat = "pdf"
vim.g.Tex_MultipleCompileFormats = "pdf"
-- vim.g.Tex_CompileRule_pdf = 'luahblatex -synctex=1 -interaction=nonstopmode -file-line-error-style "$*"'
vim.g.Tex_CompileRule_pdf = 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error-style "$*"'
vim.g.diagnostics_mode = 0
vim.diagnostic.disable()
vim.opt.spelllang = "en_us"
