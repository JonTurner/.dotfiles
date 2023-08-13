-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not vim.loop.fs_stat(lazypath) then
--   vim.fn.system({
--     "git",
--     "clone",
--     "--filter=blob:none",
--     "https://github.com/folke/lazy.nvim.git",
--     "--branch=stable", -- latest stable release
--     lazypath,
--   })
-- end
-- vim.opt.rtp:prepend(lazypath)

require('lazy').set({
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },

  -- use({
	  -- 'rose-pine/neovim',
	  -- as = 'rose-pine',
	  -- config = function()
		  -- vim.cmd('colorscheme rose-pine')
	  -- end
  -- })

  {
      "folke/trouble.nvim",
      config = function()
          require("trouble").setup {
              icons = false,
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
  },

  {
			'nvim-treesitter/nvim-treesitter',
			build = function()
				local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
				ts_update()
			end,},
  "nvim-treesitter/playground",
  "theprimeagen/harpoon",
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

  -- masks config file values with ********
  -- "laytan/cloak.nvim",
  -- configure here: after/plugin/cloak.lua
  "tpope/vim-rails",
  "tpope/vim-commentary",
  -- This is just a rewrite of https://github.com/tpope/vim-endwise to leverage
  -- Treesitter so it can be more accurate and work without having to run
  -- Neovim's slow regex based highlighting along with nvim-treesitter highlighting.
  "RRethy/nvim-treesitter-endwise",

  "tpope/vim-repeat",

  "christoomey/vim-tmux-navigator",
  -- "morhetz/gruvbox",
  "github/copilot.vim",
  "AndrewRadev/ember_tools.vim",
  "tpope/vim-projectionist",
  {
      "folke/which-key.nvim",
      config = function()
          vim.o.timeout = true
          vim.o.timeoutlen = 300
          require("which-key").setup {
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
  },
  "tpope/vim-rhubarb",
  {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
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
  {
      "vimwiki/vimwiki",
      init = function()
          -- attempting to enable copilot in vimwiki
          -- VimWiki was overriding the <TAB> complettion for copilot
          vim.g.vimwiki_key_mappings = { table_mappings = 0, }
      end,
      config = function()
          -- makes vimiwiki use markdown links as [text](text.md) instead of [text](text)
          vim.g.vimwiki_markdown_link_ext = 1
          vim.g.vimwiki_folding = ''
          vim.g.vimwiki_list = {
              {
                  path = '~/vimwiki/managed_billing',
                  syntax = 'markdown',
                  ext = '.md'
              },
              {
                  path = '~/vimwiki/notes',
                  syntax = 'markdown',
                  ext = '.md'
              },
              {
                  path = '~/vimwiki/investigations',
                  syntax = 'markdown',
                  ext = '.md'
              }
          }
      end
  },

  {
      "tools-life/taskwiki",
      config = function()
          vim.g.taskwiki_markup_syntax = 'markdown'
          vim.g.taskwiki_filetypes = 'md'
          vim.g.taskwiki_dont_fold = 1
      end
  },

  -- https://github.com/ryanoasis/nerd-fonts/#option-4-homebrew-fonts
  -- brew tap homebrew/cask-fonts
  -- brew install font-hack-nerd-font
  -- have to configure iterm2 to use the nerd font --> Appearance --> Change Font
  "nvim-tree/nvim-web-devicons",
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
  },
  -- use{
  --     "tbabej/taskwiki",
  --     config = function()
  --         vim.g.taskwiki_markup_syntax = 'markdown'
  --     end
  -- }

})

-- rm -rf ~/.local/share/nvim/site/pack/packer/
-- rm -rf ~/.config/nvim/plugin/packer_compiled.lua


