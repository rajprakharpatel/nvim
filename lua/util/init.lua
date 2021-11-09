function _G.define_augroups(definitions) -- {{{1
	-- Create autocommand groups based on the passed definitions
	--
	-- The key will be the name of the group, and each definition
	-- within the group should have:
	--    1. Trigger
	--    2. Pattern
	--    3. Text
	-- just like how they would normally be defined from Vim itself
	for group_name, definition in pairs(definitions) do
		vim.cmd("augroup " .. group_name)
		vim.cmd "autocmd!"

		for _, def in ipairs(definition) do
			local command = table.concat(vim.tbl_flatten { "autocmd", def }, " ")
			vim.cmd(command)
		end
		vim.cmd "augroup END"
	end
end

function _G.loadrequire(module)
	local function requiref(module)
		require(module)
		print "Module Loaded"
	end
	local res = pcall(requiref, module)
	if not res then
		print "Module not found"
	end
end

function _G.put(...)
	local objects = {}
	for i = 1, select("#", ...) do
		local v = select(i, ...)
		table.insert(objects, vim.inspect(v))
	end

	print(table.concat(objects, "\n"))
	return ...
end

function _G.packer(...)
	if packer_plugins[...] and packer_plugins[...].loaded then
		print(... .. " is loaded")
	else
		print(... .. " not loaded")
	end
end

function _G.packer_load(...)
	vim.cmd([[:PackerLoad ]] .. ...)
end
