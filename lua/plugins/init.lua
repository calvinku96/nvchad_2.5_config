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
  {
    "stevearc/oil.nvim",
    cmd = { "Oil" },
    dependencies = {
      { "echasnovski/mini.icons", opts = {} },
    },
    opts = {
      use_default_keymaps = false,
      keymaps = {
        -- default keymaps
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        -- ["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
        -- ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
        -- ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        -- ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory", mode = "n" },
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",

        ["<C-h>"] = "actions.parent",
        ["<leader>s"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
        ["<leader>h"] = {
          "actions.select",
          opts = { horizontal = true },
          desc = "Open the entry in a horizontal split",
        },
        ["<leader>t"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
        ["<leader>q"] = "actions.close",
      },
      view_options = {
        show_hidden = true,
      },
    },
  },
}
