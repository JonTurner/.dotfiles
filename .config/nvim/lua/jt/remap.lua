
local f = require("utils.functions")
local r = require("utils.remaps")

vim.g.mapleader = " "
r.map("n", "<leader>pv", vim.cmd.Ex, "loads the NetRW")
r.map("v", "J", ":m '>+1<CR>gv=gv", "move highlighted text down")
r.map("v", "K", ":m '<-2<CR>gv=gv", "move highlighted text up")

vim.keymap.set("n", "J", "mzJ`z") -- join lines keeping cursor in place")
r.map("n", "<C-d>", "<C-d>zz", "1/2 page down - center cursor")
r.map("n", "<C-u>", "<C-u>zz", "1/2 page up - center cursor")
r.map("x", "<leader>p", [["_dP]], "pastes over selected text - without affecting last yanked text")
r.map({"n", "v"}, "<leader>y", [["+y]], "yank to system clipboard")
r.map("n", "<leader>Y", [["+Y]], "yank line to system clipboard")
r.map({"n", "v"}, "<leader>d", [["_d]], "delete to black hole register")
r.map("n", "Q", "<nop>", "map Q to nothing - avoid old school Ex mode")
r.map("n", "<leader>f", vim.lsp.buf.format, "format current buffer")

r.map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "search and replace")

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end, {  desc = "Shout Out (resource lua file)" })

r.map("n", "<C-s>", "<Esc>:w<CR>", "save file")
r.map("v", "<C-s>", "<Esc>:w<CR>", "save file")
r.map("i", "<C-s>", "<Esc>:w<CR>", "save file")
r.map("n", "<C-j>", "<C-W>j", "move to window below")
r.map("n", "<C-k>", "<C-W>k", "move to window above")
r.map("n", "<C-h>", "<C-W>h", "move to window left")
r.map("n", "<C-l>", "<C-W>l", "move to window right")

-- generate repo URL to code on GitHub
-- tpope/vim-fugitive
-- tpope/vim-rhubarb
r.map("n", "<Leader>gh", ":GBrowse!<CR>", "GitHub URL to code")
r.map("v", "<Leader>gh", ":GBrowse!<CR>", "GitHub URL to code w/ lines")
r.map("n", "<LocalLeader>gh", ":GBrowse!<CR>", "GitHub URL to code")
r.map("v", "<LocalLeader>gh", ":GBrowse!<CR>", "GitHub URL to code w/ lines")

r.map("n", "<C-a>", "ggVG", "Select all contents in the buffer")
r.map("i", "<C-c>", "<Esc>", "escape insert mode")
r.map("i", "jk", "<esc>", "escape insert mode")

r.map({"n", "v"}, "H", "<Home>", "Move to the beginning of the line")
r.map({"n", "v"}, "L", "<End>", "Move to the end of the line")

require("jt.open_pivotal_story")
vim.cmd([[
  augroup fugitive_ext
    autocmd!
    autocmd FileType fugitiveblame nnoremap <buffer> <leader>gpv :lua require('jt.open_pivotal_story').OpenPivotalStory(vim.fn.expand("<cword>"))<cr>
  augroup END
]])

-- moves the cursor to the next error or warning in the quickfix list.
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- Neovim will navigate to the next item in the location list for the current window and then center the cursor's line in the window.
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
-- r.map("n", "n", "nzzzv", "center cursor on next match (opens any closed folds cursor is on)")
-- r.map("n", "N", "Nzzzv", "center cursor on last match (opens any closed folds cursor is on)")
-- r.map("n", "<leader>x", "<cmd>!chmod +x %<CR>", "make file executable - chmod +x", { silent = true })
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- Clear the search highlight by pressing <ESC>
-- r.map({ "i", "n" }, "<esc>", "<cmd>nohlsearch<cr><esc>", "Escape & clear highlighted search")
