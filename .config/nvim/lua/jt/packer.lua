-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Only required if you have packer configured as `opt`
-- vim.cmd.packadd('packer.nvim')
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- use({
	  -- 'rose-pine/neovim',
	  -- as = 'rose-pine',
	  -- config = function()
		  -- vim.cmd('colorscheme rose-pine')
	  -- end
  -- })
  use({
      "folke/trouble.nvim",
      config = function()
          require("trouble").setup {
              icons = false,
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
  })
  use {
			'nvim-treesitter/nvim-treesitter',
			run = function()
				local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
				ts_update()
			end,}
  use("nvim-treesitter/playground")
  use("theprimeagen/harpoon")
  use("theprimeagen/refactoring.nvim")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use("tpope/vim-rhubarb")
  use("nvim-treesitter/nvim-treesitter-context");
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
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
		  --{'rafamadriz/friendly-snippets'},
	  }
  }
  use("folke/zen-mode.nvim")

  -- Jon Turner cusomizations
  use("tpope/vim-rails")
  -- use("tpope/vim-commentary")
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use("RRethy/nvim-treesitter-endwise") -- lua rewrite of tpope/vim-endwise
  use("tpope/vim-repeat")
  use("christoomey/vim-tmux-navigator")
  use("ellisonleao/gruvbox.nvim")
  use("github/copilot.vim")
  use("AndrewRadev/ember_tools.vim")
  use("tpope/vim-projectionist")
  use {
    'stevearc/oil.nvim',
    config = function() require('oil').setup() end
  }
  use("ludovicchabant/vim-gutentags")
  use {
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
  }
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  })
--       Old text                    Command         New text
-- --------------------------------------------------------------------------------
--     surr*ound_words             ysiw)           (surround_words)
--     *make strings               ys$"            "make strings"
--     [delete ar*ound me!]        ds]             delete around me!
--     remove <b>HTML t*ags</b>    dst             remove HTML tags
--     'change quot*es'            cs'"            "change quotes"
--     <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
--     delete(functi*on calls)     dsf             function calls
  -- use("ThePrimeagen/vim-be-good")
  -- use("ellisonleao/glow.nvim")

  -- https://github.com/ryanoasis/nerd-fonts/#option-4-homebrew-fonts
  -- brew tap homebrew/cask-fonts
  -- brew install font-hack-nerd-font
  -- have to configure iterm2 to use the nerd font --> Appearance --> Change Font
  use("nvim-tree/nvim-web-devicons")
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use {
  'pwntester/octo.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-tree/nvim-web-devicons',
  }
  -- config = function ()
  --   require"octo".setup()
  -- end
}

  -- use("vim-ruby/vim-ruby")
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

end)

  -- add new plugin
  -- :so
  -- :PackerSync
  -- use{
  --     "vimwiki/vimwiki",
  --     init = function()
  --         -- attempting to enable copilot in vimwiki
  --         -- VimWiki was overriding the <TAB> complettion for copilot
  --         vim.g.vimwiki_key_mappings = { table_mappings = 0, }
  --     end,
  --     config = function()
  --         -- makes vimiwiki use markdown links as [text](text.md) instead of [text](text)
  --         vim.g.vimwiki_markdown_link_ext = 1
  --         vim.g.vimwiki_folding = ''
  --         vim.g.vimwiki_list = {
  --             {
  --                 path = '~/vimwiki/managed_billing',
  --                 syntax = 'markdown',
  --                 ext = '.md'
  --             },
  --             {
  --                 path = '~/vimwiki/notes',
  --                 syntax = 'markdown',
  --                 ext = '.md'
  --             },
  --             {
  --                 path = '~/vimwiki/investigations',
  --                 syntax = 'markdown',
  --                 ext = '.md'
  --             }
  --         }
  --     end
  -- }

  -- use{
  --     "tools-life/taskwiki", -- this is the one that works (for me)
  --     config = function()
  --         vim.g.taskwiki_markup_syntax = 'markdown'
  --         vim.g.taskwiki_filetypes = 'md'
  --         vim.g.taskwiki_dont_fold = 1
  --     end
  -- }
  -- use{
  --     "tbabej/taskwiki",
  --     config = function()
  --         vim.g.taskwiki_markup_syntax = 'markdown'
  --     end
  -- }
  --
  --
  --
  -- https://www.reddit.com/r/neovim/comments/vbxya0/anyone_here_using_neovim_for_ruby_on_rails/
  -- 20 upvotes!
  -- I mostly use solargraph with native lsp and rubocop via formatter.nvim (I have been using null-ls for a while, but honestly I prefer having it separated from lsp).
  --
  -- The builtin LSP works well with solargraph to provide autocompletion.

-- You can extend the default configuration for the language using a filetype plugin. Here's an example:
--
-- " In after/ftplugin/ruby.vim to work with predicate method names
-- setlocal iskeyword+=?
-- Tim Pope has many great plugins that work well for Ruby development:
--
-- tpope/vim-bundler
--
-- tpope/vim-rails
--
-- You can setup debugger for ruby following https://github.com/suketa/nvim-dap-ruby (personally I don't use it).
--
-- You can use janko/vim-test to run your tests.
--
---------------------------------------------
--I use the built-in LSP feature of neovim.
--
-- I trigger the `vim.lsp.buf.formatting_sync` function from an `autocmd` in case the formatting is a capability of the LSP server.
--
-- Solargraph supports formatting using rubocop.
--
-- I don't use null-ls to format Ruby code.
--
--
-- Ruby Focused dotfiles(author claims): https://github.com/prdanelli/dotfiles
