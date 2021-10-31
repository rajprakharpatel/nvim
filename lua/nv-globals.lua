O = {
	auto_close_tree = 0,
	auto_complete = true,
	colorscheme = "nvcode",
	hidden_files = true,
	wrap_lines = true,
	number = true,
	relative_number = true,
	shell = "bash",
	database = {
		save_location = "~/.config/nvcode_db",
		auto_execute = 1,
	},
	python = {
		linter = "flake8",
		-- @usage can be 'yapf', 'black'
		formatter = "black",
		autoformat = true,
		isort = false,
		diagnostics = { virtual_text = true, signs = true, underline = true },
	},
	dart = {
		sdk_path = "/usr/lib/dart/bin/snapshots/analysis_server.dart.snapshot",
	},
	lua = {
		-- @usage can be 'lua-format'
		formatter = "lua-format",
		autoformat = true,
		diagnostics = { virtual_text = true, signs = true, underline = true },
	},
	sh = {
		-- @usage can be 'shellcheck'
		linter = "shellcheck",
		-- @usage can be 'shfmt'
		formatter = "shfmt",
		autoformat = false,
		diagnostics = { virtual_text = true, signs = true, underline = true },
	},
	tsserver = {
		-- @usage can be 'eslint'
		linter = "eslint",
		-- @usage can be 'prettier'
		formatter = "prettier",
		autoformat = false,
		diagnostics = { virtual_text = true, signs = true, underline = true },
	},
	json = {
		-- @usage can be 'prettier'
		formatter = "prettier",
		autoformat = false,
		diagnostics = { virtual_text = true, signs = true, underline = true },
	},
	tailwindls = {
		filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
	},
	-- css = {formatter = '', autoformat = false, virtual_text = true},
	-- json = {formatter = '', autoformat = false, virtual_text = true}
}

DATA_PATH = vim.fn.stdpath("data")
CACHE_PATH = vim.fn.stdpath("cache")
