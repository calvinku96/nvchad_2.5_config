local concurrency = nil
if vim.env.MAX_PROCS ~= "" then
  concurrency = tonumber(vim.env.MAX_PROCS)
elseif jit.os.find "Windows" then
  concurrency = vim.iv.available_parallelism() * 2
end

return {
  defaults = { lazy = true },
  install = { colorscheme = { "nvchad" } },
  lockfile = vim.fn.stdpath "data" .. "/lazy-lock.json",
  concurrency = concurrency,
  ui = {
    icons = {
      ft = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "",
    },
  },

  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },
}
