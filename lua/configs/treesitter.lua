local M = {
  ensure_installed = {
    "bash",
    "bibtex",
    "c",
    "cmake",
    "comment",
    "cpp",
    "cuda",
    "diff",
    "gitignore",
    "glsl",
    "hlsl",
    "java",
    "json",
    -- "lua",
    "make",
    "markdown",
    "matlab",
    "meson",
    "ninja",
    -- "perl",
    "python",
    "rust",
    "vim",
    "yaml",
    -- "query",
    "latex",
  },
  indent = {
    enable = false,
    -- disable = {
    --   "python"
    -- },
  },
  ignore_install = { "fortran" },
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
return M
