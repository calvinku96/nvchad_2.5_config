require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
--
vim.cmd [[ let fortran_do_enddo=1 ]]
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
-- vim.g.Tex_DefaultTargetFormat = "pdf"
-- vim.g.Tex_MultipleCompileFormats = "pdf"
-- vim.g.Tex_CompileRule_pdf = 'luahblatex -synctex=1 -interaction=nonstopmode -file-line-error-style "$*"'
-- vim.g.Tex_CompileRule_pdf = "pdflatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*"
-- vim.g.Tex_BibtexFlavor = "biber"
vim.g.diagnostics_mode = 0
vim.g.rustfmt_autosave = 1
vim.diagnostic.enable(false)
vim.opt.spelllang = "en_us"
vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/lua_snippets"
vim.g.vscode_snippets_exclude = { "latex", "tex" }
