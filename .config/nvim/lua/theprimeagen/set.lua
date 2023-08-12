vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true -- Display the row number relative to the up/down rows
vim.opt.tabstop = 2 -- Number of Spaces, a single tab counts for
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2 -- The default size of an indentation (this will be configure per filetype later on)
vim.opt.expandtab = true -- Use spaces instead of tabs

vim.opt.smartindent = true

vim.opt.wrap = false -- Configure Neovim to not wrap the contents of the buffer

vim.opt.swapfile = false --Disable swapfile creation since it gets annoying after a while
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true -- True color support for various plugins

-- keeps this many lines above or below the cursor
vim.opt.scrolloff = 8 -- Maintain a buffer of rows between the current row & the either ends of the window
vim.opt.signcolumn = "yes" -- Allow the sign column to show else it'll keep shifting later on
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50 -- milliseconds - Save swap file & trigger CursorHold

-- vim.opt.colorcolumn = "80"
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of the current

-- vimwiki/vimwiki settings
vim.cmd('filetype plugin on')
vim.cmd('syntax on')

-- no folding
vim.wo.foldenable = false

vim.opt.smartcase = true -- Don't ignore casing with capitals
vim.opt.ignorecase = true -- Ignore casing when searching for a word

-- local opt = vim.opt
-- opt.number = true -- Display the row number on the left side of the window
-- opt.autowrite = true -- Save the contents of the buffer after exiting Insert mode
-- opt.clipboard = "unnamedplus" -- Sync the system clipboard with Neovim
-- opt.laststatus = 3 -- Enable the global status line
-- opt.completeopt = "menu,menuone,noselect" -- Make the autocompletion window more accessible
-- opt.conceallevel = 3 -- Hide the * markups for bold & italics
-- opt.confirm = true -- Prompt to save the contents of the buffer before exiting
-- -- opt.formatoptions = "jcroqlnt" -- Some formatting configuration, needs more research
-- opt.inccommand = "nosplit" -- Preview incremental substitute
-- opt.list = true -- Show invisible whitespace characters
-- opt.pumblend = 10 -- Make the completion popup window a bit transparent
-- opt.pumheight = 10 -- Display only 10 rows for the completion menu
-- opt.shiftround = true -- Roundup indentations
-- -- TODO: Figure a way out to configure these options specific to the filetype instead
-- opt.showmode = false -- Disable showing the current mode since its already visible on the statusline
-- opt.spelllang = { "en" } -- The language to use when spelling checking
-- opt.timeoutlen = 300 -- ??
-- opt.undolevels = 10000 -- ??
-- opt.wildmode = "longest:full,full" -- Command-line completion mode
-- opt.winminwidth = 5 -- Minimum window width
-- opt.iskeyword:append("-") -- Make Neovim recognise dash-seperated words as a single word
-- opt.cursorline = true -- Configure Neovim to highlight the current location of the cursor
