local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  },
  {
    "folke/trouble.nvim",
    opts = {
      icons = false,
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate"
  },
  "nvim-treesitter/playground",
  "theprimeagen/harpoon",
  -- {
  --   "theprimeagen/harpoon",
  --   config = function()
  --     local mark = require("harpoon.mark")
  --     local ui = require("harpoon.ui")
  --     require("harpoon").setup({
  --       vim.keymap.set("n", "<leader>a", mark.add_file),
  --       vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu),
  --     })
  --   end
  -- },
  "theprimeagen/refactoring.nvim",
  "mbbill/undotree",
  "tpope/vim-fugitive",
  "nvim-treesitter/nvim-treesitter-context",

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      -- Linters
      {'mfussenegger/nvim-lint'},
      -- Formatters
      {'mhartington/formatter.nvim'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},
      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  },
  "folke/zen-mode.nvim",
  "eandrju/cellular-automaton.nvim",
  -- "laytan/cloak.nvim", masks config file values with ********
  "tpope/vim-rails",
  "tpope/vim-commentary",
  "RRethy/nvim-treesitter-endwise", -- rewrite of tpope/vim-endwise
  "tpope/vim-repeat",
  "christoomey/vim-tmux-navigator",
  -- "morhetz/gruvbox",
  "github/copilot.vim",
  "AndrewRadev/ember_tools.vim",
  "tpope/vim-projectionist",
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  "tpope/vim-rhubarb",
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  --       Old text                    Command         New text
  -- --------------------------------------------------------------------------------
  --     surr*ound_words             ysiw)           (surround_words)
  --     *make strings               ys$"            "make strings"
  --     [delete ar*ound me!]        ds]             delete around me!
  --     remove <b>HTML t*ags</b>    dst             remove HTML tags
  --     'change quot*es'            cs'"            "change quotes"
  --     <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
  --     delete(functi*on calls)     dsf             function calls
  -- https://github.com/ryanoasis/nerd-fonts/#option-4-homebrew-fonts
  -- brew tap homebrew/cask-fonts
  -- brew install font-hack-nerd-font
  -- have to configure iterm2 to use the nerd font --> Appearance --> Change Font
  "nvim-tree/nvim-web-devicons",
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
  },
}

require("lazy").setup(plugins)
-- {
--   "vimwiki/vimwiki",
--   init = function()
--     -- attempting to enable copilot in vimwiki
--     -- VimWiki was overriding the <TAB> complettion for copilot
--     vim.g.vimwiki_key_mappings = { table_mappings = 0, }
--   end,
--   config = function()
--     -- makes vimiwiki use markdown links as [text](text.md) instead of [text](text)
--     vim.g.vimwiki_markdown_link_ext = 1
--     vim.g.vimwiki_folding = ''
--     vim.g.vimwiki_list = {
--       {
--         path = '~/vimwiki/managed_billing',
--         syntax = 'markdown',
--         ext = '.md'
--       },
--       {
--         path = '~/vimwiki/notes',
--         syntax = 'markdown',
--         ext = '.md'
--       },
--       {
--         path = '~/vimwiki/investigations',
--         syntax = 'markdown',
--         ext = '.md'
--       }
--     }
--   end
-- },
-- {
--   "tools-life/taskwiki",
--   config = function()
--     vim.g.taskwiki_markup_syntax = 'markdown'
--     vim.g.taskwiki_filetypes = 'md'
--     vim.g.taskwiki_dont_fold = 1
--   end
-- },
-- {
--   "tbabej/taskwiki",
--   config = function()
--     vim.g.taskwiki_markup_syntax = 'markdown'
--   end
-- }
