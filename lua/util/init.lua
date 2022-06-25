function _G.loadrequire(module)
	local function requiref(mod)
		require(mod)
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
	if packer_plugins[...] then
		_G.put(packer_plugins[...])
	else
		print(... .. " not installed")
	end
end

function _G.packer_load(...)
	vim.cmd([[:PackerLoad ]] .. ...)
end
