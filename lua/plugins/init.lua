return {
  {
    "stevearc/conform.nvim",
    -- event = "BufWritePre", -- uncomment for format on save
    lazy = false,
    config = function()
      require "configs.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },
  {
    "barreiroleo/ltex_extra.nvim",
  },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  {
    "williamboman/mason.nvim",
    opts = {
      PATH = "append",
      ensure_installed = {
        "lua-language-server",
        "bash-language-server",
        "clangd",
        "cmake-language-server",
        "fortls",
        "pyright",
        "rust-analyzer",
        "black",
        "isort",
        "stylua",
        "clang-format",
        "ltex-ls",
      },
      max_concurrent_installers = 1,
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "calvinku96/telescope_tags",
    },
    opts = function()
      local actions = require "telescope.actions"
      local def = require "nvchad.configs.telescope"
      local new = {
        extensions_list = { "ctags" },
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
          },
        },
        pickers = {
          find_files = {
            follow = true,
          },
        },
      }
      return vim.tbl_deep_extend("force", def, new)
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter",
    cmd = { "TSUpdate", "TSInstall", "TSUninstall" },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "syntax")
      require("nvim-treesitter.configs").setup(opts)
      if vim.fn.has "win32" == 1 then
        require("nvim-treesitter.install").compilers = { "clang" }
      end
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "kdheepak/cmp-latex-symbols" },
    },
    opts = function()
      return require "configs.cmp"
    end,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup {
        timeout = vim.o.timeoutlen,
        default_mappings = false,
        mappings = {
          i = {
            f = {
              j = "<Esc>",
              J = "<Esc>",
            },
          },
          n = {
            f = {
              j = "<Esc>",
              J = "<Esc>",
            },
          },
          v = {
            f = {
              j = "<Esc>",
              J = "<Esc>",
            },
          },
        },
      }
    end,
  },
  {
    "windwp/nvim-autopairs",
    enabled = false,
  },
  {
    "calvinku96/vim-latex",
    branch = "own",
    ft = "tex",
  },
  {
    "junegunn/vim-easy-align",
    lazy = false,
  },
  {
    "ntpeters/vim-better-whitespace",
    lazy = false,
    config = function()
      vim.g["better_whitespace_enabled"] = 0
      vim.g["strip_whitespace_on_save"] = 1
      vim.g["strip_whitespace_confirm"] = 0
    end,
  },
  {
    "mbbill/undotree",
    cmd = {
      "UndotreeToggle",
    },
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
  },
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = { "LazyGit" },
  },
  {
    "folke/which-key.nvim",
    lazy = false,
  },
  {
    "m00qek/baleia.nvim",
    config = function()
      vim.g.baleia = require("baleia").setup {}
    end,
    keys = {
      {
        "<leader>C",
        function()
          vim.g.baleia.once(vim.api.nvim_get_current_buf())
        end,
        desc = "Colorize text",
      },
    },
  },
}
