local keymap = vim.keymap
local check_duplicates = require("utils.duplicates").check_duplicates

local X = {}

local which_key_lazy_registers = nil
-- local function lazy_register_which_key(input, description)
-- 	if which_key_lazy_registers == nil then
-- 		which_key_lazy_registers = {}
-- 	end
--
-- 	which_key_lazy_registers[input] = description
-- end
local function lazy_register_which_key(input, description)
    if which_key_lazy_registers == nil then
        which_key_lazy_registers = {}
    end

    -- Convert to new format
    table.insert(which_key_lazy_registers, { input, desc = description })
end

local function try_add_to_which_key_by_input(input, description)
	local present_which_key, which_key = pcall(require, "which-key")

	local has_leader = string.find(input, "<leader>")
	if has_leader then
		if present_which_key then
			if which_key_lazy_registers ~= nil then
				which_key.register(which_key_lazy_registers)
				which_key_lazy_registers = nil
			end
			-- which_key.register({
			-- 	[input] = description,
			-- })

      -- Use the new format for registration
      which_key.register({
        { input, desc = description }
      })
		else
			lazy_register_which_key(input, description)
		end
	end
end

function X.map(type, input, output, description, additional_options)
	local options = { remap = true, desc = description }
	if additional_options then
		options = vim.tbl_deep_extend("force", options, additional_options)
	end
	keymap.set(type, input, output, options)
	check_duplicates(type, input, description)
end

function X.noremap(type, input, output, description, additional_options)
	local options = { noremap = true }
	-- local options = { remap = false }
	if additional_options then
		options = vim.tbl_deep_extend("force", options, additional_options)
	end
	X.map(type, input, output, description, options)
end

function X.map_virtual(input, description)
	check_duplicates(type, input, description)
	try_add_to_which_key_by_input(input, description)
end

function X.which_key(input, description)
	try_add_to_which_key_by_input(input, description)
end

-- Handle group registrations separately
function X.which_key_group(input, group_name)
    local present_which_key, which_key = pcall(require, "which-key")

    local has_leader = string.find(input, "<leader>")
    if has_leader then
        if present_which_key then
            if which_key_lazy_registers ~= nil then
                which_key.register(which_key_lazy_registers)
                which_key_lazy_registers = nil
            end

            -- Use the new format for group registration
            which_key.register({
                { input, group = group_name }
            })
        else
            if which_key_lazy_registers == nil then
                which_key_lazy_registers = {}
            end
            table.insert(which_key_lazy_registers, { input, group = group_name })
        end
    end
end
return X
