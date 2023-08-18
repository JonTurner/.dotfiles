-- local mark = require("harpoon.mark")
-- local ui = require("harpoon.ui")

-- vim.keymap.set("n", "<leader>a", mark.add_file)
-- vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

-- vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
-- vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
-- vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
-- vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)

  -- vim.keymap.set("n", "<C-o>", function() ui.nav_file(1) end),
  -- vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end),
  -- vim.keymap.set("n", "<C-i>", function() ui.nav_file(3) end),
  -- vim.keymap.set("n", "<C-f>", function() ui.nav_file(4) end),


local r = require("utils.remaps")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
require("harpoon").setup {
  r.map("n", "<leader>a", mark.add_file, "harpoon: add file"),
  r.map("n", "<C-e>", ui.toggle_quick_menu, "harpoon: toggle quick menu"),
}

-- return {
-- 	'ThePrimeagen/harpoon',
-- 	config = function()
-- 		local mark = require("harpoon.mark")
-- 		local ui = require("harpoon.ui")
-- 		require("harpoon").setup {
-- 			vim.keymap.set("n", "<leader>a", mark.add_file),
-- 			vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu),

-- 			-- vim.keymap.set("n", "<C-o>", function() ui.nav_file(1) end),
-- 			-- vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end),
-- 			-- vim.keymap.set("n", "<C-i>", function() ui.nav_file(3) end),
-- 			-- vim.keymap.set("n", "<C-f>", function() ui.nav_file(4) end),
-- 		}
-- 	end
-- }
