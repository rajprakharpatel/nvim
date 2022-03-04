------------------
--  treesitter  --
------------------

-- Load custom tree-sitter grammar for org filetype
require("orgmode").setup_ts_grammar()

require("nvim-treesitter.configs").setup {
	-- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ensure_installed = {
		"c",
		"cpp",
		"java",
		"python",
		"json",
		"yaml",
		"vim",
		"org",
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		additional_vim_regex_highlighting = { "org" },
	},
	-- indent = {enable = true, disable = {"python", "html", "javascript"}},
	-- indent = { enable = { "javascriptreact" } },
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
	},
	autotag = { enable = true },
	rainbow = { enable = true },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
		config = { javascriptreact = { style_element = "{/* %s */}" } },
	},
	refactor = { highlight_definitions = { enable = true } },
}

vim.cmd "set foldmethod=expr"
vim.cmd "set foldexpr=nvim_treesitter#foldexpr()"
