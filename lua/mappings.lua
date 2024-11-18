require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local unmap = vim.keymap.del

unmap("n", "<C-s>")
unmap("n", "<C-n>")
unmap("n", "<A-v>")
-- unmap("n", "<A-i>")
unmap("n", "<C-h>")
unmap("n", "<C-j>")
unmap("n", "<C-k>")
unmap("n", "<C-l>")
unmap("n", "<leader>n")

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<M-h>", "<C-w>h", { desc = "Window left" })
map("n", "<M-l>", "<C-w>l", { desc = "Window right" })
map("n", "<M-j>", "<C-w>j", { desc = "Window down" })
map("n", "<M-k>", "<C-w>k", { desc = "Window up" })
-- map("n", "<F4>", "<cmd>NvimTreeToggle <CR>", { desc = "Toggle nvimtree" })
-- map("n", "<leader>e", "<cmd>NvimTreeToggle <CR>", { desc = "Toggle nvimtree" })
map("n", "<F9>", function()
  if vim.bo.filetype == "tex" then
    vim.cmd [[ :wa ]]
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(vimtex-compile)", true, true, true), "")
  elseif vim.bo.filetype == "rust" then
    vim.cmd [[
      execute ':wa'
      let &makeprg= "cargo build"
      make
      copen 15
      ]]
  else
    vim.cmd [[
        execute ':wa'
        if filereadable("CMakeLists.txt")
            let build_dir = get(g:, "cmake_build_dir", "build")
            let &makeprg = "cmake --build " . build_dir . " -j16"
            make
        elseif filereadable("build.sh")
            let &makeprg = "./build.sh"
            make
        else
            let &makeprg= "make"
            make -j8
        endif
        copen 15
        execute ':cc'
      ]]
  end
end)
map("n", "<S-F9>", function()
  if vim.bo.filetype == "tex" then
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(vimtex-clean)", true, true, true), "")
  else
    vim.cmd [[
      execute ':wa'
      if filereadable("CMakeLists.txt")
          let build_dir = get(g:, "cmake_build_dir", "build")
          let &makeprg = "cmake --build " . build_dir . " --target clean"
          make
      elseif filereadable("build.sh")
      else
          let &makeprg= "make"
          make -j8 clean
      endif
    ]]
  end
end)
map("n", "<C-9>", "<cmd>cc<CR>", { desc = "current error" })
map("n", "<C-0>", "<cmd>cn<CR>", { desc = "next error" })
map("n", "<C-8>", "<cmd>cp<CR>", { desc = "prev error" })
map("n", "<leader>9", "<cmd>cc<CR>", { desc = "current error" })
map("n", "<leader>0", "<cmd>cn<CR>", { desc = "next error" })
map("n", "<leader>8", "<cmd>cp<CR>", { desc = "prev error" })
map("n", "ga", "<Plug>(EasyAlign)", { desc = "EasyAlign" })
map("n", "<F10>", "<cmd>ToggleWhitespace<cr>", { desc = "Toggle whitespace highlighting" })
map("n", "<F12>", function()
  vim.o.spell = not vim.o.spell
  if vim.o.spell then
    print("Spell check on with language: " .. vim.o.spelllang)
  else
    print "Spell check off"
  end
end, { desc = "Toggle spell" })
map("n", "<C-F10>", "<cmd>StripWhitespace<cr>", { desc = "Clean extra whitespace" })
map("n", "<leader>uP", "<cmd>TSPlaygroundToggle<cr>", { desc = "Treesitter Playground" })
map("n", "<leader>uu", vim.cmd.UndotreeToggle, { desc = "Undo Tree" })
map("n", "\\", "<cmd>split<cr>", { desc = "Horizontal Split" })
map("n", "|", "<cmd>vs<cr>", { desc = "Vertical Split" })
map("n", "]b", function()
  require("nvchad.tabufline").tabuflineNext()
end, { desc = "Goto next buffer" })
map("n", "[b", function()
  require("nvchad.tabufline").tabuflinePrev()
end, { desc = "Goto prev buffer" })
map("n", "]t", "<cmd>tabnext<cr>", { desc = "Goto next tab" })
map("n", "[t", "<cmd>tabprevious<cr>", { desc = "Goto prev tab" })
map("n", "<>", "<cmd> noh <CR>", { desc = "Clear highlights" })
map("n", "<leader>q", "<cmd>confirm q<cr>", { desc = "Quit" })
map("n", "<leader>n", "<cmd>enew<cr>", { desc = "New buffer" })
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
map("n", "<leader>b", "<cmd>tabnew<cr>", { desc = "New tab" })
map("n", "<leader>tt", function()
  require("nvchad.term").toggle {
    pos = "float",
    id = "float_term",
    float_opts = {
      row = 0.05,
      col = 0.05,
      width = 0.9,
      height = 0.9,
      border = "single",
    },
  }
end)
map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle {
    pos = "float",
    id = "float_term",
    float_opts = {
      row = 0.05,
      col = 0.05,
      width = 0.9,
      height = 0.9,
      border = "single",
    },
  }
end)
map("n", "<leader>tl", "<cmd>LazyGit<CR>", { desc = "LazyGit" })
map("n", "fj", "<cmd> noh <CR>", { desc = "Clear highlights" })
map("n", "<leader>la", function()
  if vim.g["strip_whitespace_on_save"] == 0 then
    vim.g["strip_whitespace_on_save"] = 1
    print "Strip whitespace on save enabled"
  else
    vim.g["strip_whitespace_on_save"] = 0
    print "Strip whitespace on save disabled"
  end
end)
map("n", "<leader>ll", function()
  vim.g.autoformat_enabled = not vim.g.autoformat_enabled
  if vim.g.autoformat_enabled then
    print "Autoformat Enabled"
  else
    print "Autoformat Disabled"
  end
end, { desc = "Toggle autoformat" })
map("n", "<leader>ln", function()
  if not vim.g.autoformat_enabled then
    return
  end
  require("conform").format {}
end, { desc = "Autoformat" })

map("t", "<M-h>", "<C-w>h", { desc = "Window left" })
map("t", "<M-l>", "<C-w>l", { desc = "Window right" })
map("t", "<M-j>", "<C-w>j", { desc = "Window down" })
map("t", "<M-k>", "<C-w>k", { desc = "Window up" })

map("i", "fj", "<Esc>")
map("i", "fJ", "<Esc>")

map("x", "ga", "<Plug>(EasyAlign)", { desc = "EasyAlign" })

map("n", "<leader>n", "<cmd>set nu!<CR>")
map("n", "<leader>rn", "<cmd>set rnu!<CR>")

map("n", "<leader>B", function()
  if vim.diagnostic.is_enabled() then
    print "Diagnostics enabled"
  else
    print "Diagnostics disabled"
  end
end, { desc = "Toggle diagnostics" })
map("n", "<leader>d", function()
  local d = vim.diagnostic
  if d.is_enabled() then
    d.enable(false)
    print "Diagnostics disabled"
  else
    d.enable()
    print "Diagnostics enabled"
  end
end, { desc = "Toggle diagnostics" })
map("n", "<leader>k", function()
  vim.diagnostic.open_float()
end, { desc = "Diagnostics float" })
map("n", "<leader>lq", function()
  vim.diagnostic.setqflist()
end, { desc = "Diagnostics setqflist" })

map("n", "<leader>ft", function()
  require("telescope").extensions.ctags.tags { ctags_file = "tags" }
end, { desc = "telescope find ctags" })
map("n", "<leader>b", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })

local autocmd = vim.api.nvim_create_autocmd
autocmd("FileType", {
  pattern = "tex",
  callback = function()
    map("n", "<C-j>", "<Plug>IMAP_JumpForward")
  end,
})
map("n", "<leader>a", function()
  vim.lsp.buf.code_action()
end, { desc = "Code actions" })
map({ "n", "v" }, "<RightMouse>", function()
  local options = require "menu_options"
  require("menu").open(options(vim.fn.mode()), { mouse = true })
end, { desc = "Menu" })

map("n", "<leader>e", "<cmd>Oil .<cr>", { desc = "Open oil in cwd" })
map("n", "<leader>E", "<cmd>Oil<cr>", { desc = "Open oil in parent of current file" })
