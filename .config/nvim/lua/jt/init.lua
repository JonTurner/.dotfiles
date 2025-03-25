--                                     ██
--                                    ░░
--  ███████   █████   ██████  ██    ██ ██ ██████████
-- ░░██░░░██ ██░░░██ ██░░░░██░██   ░██░██░░██░░██░░██
--  ░██  ░██░███████░██   ░██░░██ ░██ ░██ ░██ ░██ ░██
--  ░██  ░██░██░░░░ ░██   ░██ ░░████  ░██ ░██ ░██ ░██
--  ███  ░██░░██████░░██████   ░░██   ░██ ███ ░██ ░██
-- ░░░   ░░  ░░░░░░  ░░░░░░     ░░    ░░ ░░░  ░░  ░░
--
--  ▓▓▓▓▓▓▓▓▓▓
-- ░▓ author ▓ Jon Turner (sort of **cough** ThePrimeagen )
-- ░▓ code   ▓ https://github.com/JonTurner/init.lua
-- ░▓ mirror ▓ https://github.com/JonTurner/init.lua
-- ░▓▓▓▓▓▓▓▓▓▓
-- ░░░░░░░░░░

require("jt.packer")
require("jt.open_pivotal_story")
require("jt.set")
require("jt.remap")
require("jt.lualine-config")
require("jt.nvim-web-devicons-config")


local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup('ThePrimeagen', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

local autocmd = vim.api.nvim_create_autocmd
local vimwiki_group = augroup('VimWiki', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = ThePrimeagenGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- adds ability to link non markdown files in vimwiki
-- instead of [foo](foo.rb) - simply do foo.rb
-- when cursor is on foo.rb, press <enter> to navigate to it
-- This remaps enter to `gf` in vimwiki buffers
autocmd({"FileType"}, {
    group = vimwiki_group,
    pattern = 'vimwiki',
    callback = function()
        vim.api.nvim_buf_set_keymap(0, 'n', '<CR>', 'gf', {silent=true})
    end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.python3_host_prog = "/opt/homebrew/bin/python3"

vim.g.LanguageClient_serverCommands = {
    sql = {'sql-language-server', 'up', '--method', 'stdio'}
}
require'lspconfig'.sqlls.setup{
   cmd = {"/Users/jon.turner/.local/share/nvim/mason/bin/sql-language-server", "up", "--method", "stdio"},
   root_dir = function(fname)
      return require'lspconfig'.util.root_pattern('.git')(fname) or require'lspconfig'.util.path.dirname(fname)
   end,
}
require("which-key").setup {
  -- other which-key settings can go here
}
require("which-key").add({
  { "<leader>g", group = "[G]ithub" },
  { "<leader>gs", desc = "Git [S]tatus" },
  { "<leader>a", desc = "[a]dd file Harpoon" },
  { "<leader>e", desc = "Harpoon [E]xplorer " },
  { "<leader>p", group = "Telescope" },
  { "<leader>pa", desc = "[A]uto commands" },
  { "<leader>pf", desc = "[F]ind File" },
  { "<leader>pg", group = "[G]it" },
  { "<leader>pgb", desc = "[B]ranches" },
  { "<leader>pgc", desc = "[C]ommits" },
  { "<leader>pgs", desc = "[S]tatus" },
  { "<leader>pb", desc = "[B]uffers" },
  { "<leader>pm", desc = "[M]marks" },
  { "<leader>pr", desc = "[R]egesters" },
  { "<leader>ps", desc = "Grep" },
  { "<leader>v", group = "CoPilot" },
  { "<leader>vh", desc = "CoPilot [H]elp" },
  { "<leader>vp", group = "[P]acker" },
  -- { "<leader>w", group = "VimWiki" },
  { "<leader>z", group = "[Z]oom" },
  { "<leader>zz", desc = "Zoom In" },
  { "<leader>zZ", desc = "Zoom Out" },
})

-- require("which-key").register({
--   ["<leader>"] = {
--     g = {
--       name = "[G]ithub",  -- optional group name for "a"
--       s = "Git [S]tatus"
--     },
--     a = "[a]dd file Harpoon",
--     e = "Harpoon [E]xplorer ",
--     p = {
--       name = "Telescope",
--       a = "[A]uto commands",
--       f = "[F]ind File",
--       g = {
--         name = "[G]it",
--         b = "[B]ranches",
--         c = "[C]ommits",
--         s = "[S]tatus",
--       },
--       b = "[B]uffers",
--       m = "[M]marks",
--       r = "[R]egesters",
--       s = "Grep"
--     },
--     v = {
--       name = "CoPilot",
--       h = "CoPilot [H]elp",
--       p = {
--         name = "[P]acker",
--       },
--     },
--     -- w = {
--     --   name = "VimWiki"
--     -- },
--     z = {
--       name = "[Z]oom",
--       z = "Zoom In",
--       Z = "Zoom Out"
--     },
--
--   },
-- })

