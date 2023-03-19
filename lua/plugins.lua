return {
	-- Faster filetype recognition
	{ "nathom/filetype.nvim", lazy = false },

	-- Quality of life improvements
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		keys = {
			{ "<F7>", ":UndotreeToggle<CR>", desc = "UndotreeToggle" },
		},
		init = function()
			vim.bo.undofile = true
			vim.o.undodir = vim.fn.stdpath "data" .. "/shada/undo-dir"
		end,
	},
	{ "zhimsel/vim-stay",     lazy = false,                  priority = 100 },
	{ "wsdjeg/vim-fetch",     lazy = false,                  priority = 500 },
	-- working with variants of word :- search, replace and changing cas
	{ "tpope/vim-abolish",    cmd = { "Abolish", "Subvert" } },
	{
		"tpope/vim-dispatch",
		dependencies = "radenling/vim-dispatch-neovim",
		cmd = {
			"Dispatch",
			-- "Dispatch!",
			-- "Start!",
			"Make",
			"Focus",
			"Start",
		},
	},
	{
		-- preview lines by :<num>
		"nacro90/numb.nvim",
		config = true,
	},
	{
		-- This plugin defines three key mappings by default, g<, g>, gs.
		"machakann/vim-swap",
		event = "BufEnter",
		--	config = function()
		--		vim.cmd "omap i, <Plug>(swap-textobject-i)"
		--		vim.cmd "omap i, <Plug>(swap-textobject-i)"
		--		vim.cmd "xmap i, <Plug>(swap-textobject-i)"
		--		vim.cmd "omap a, <Plug>(swap-textobject-a)"
		--		vim.cmd "xmap a, <Plug>(swap-textobject-a)"
		--	end,
	},
	{
		"junegunn/vim-easy-align",
		keys = {
			{ "gz", "<Plug>(EasyAlign)", desc = "EasyAlign" },
			{ "gz", "<Plug>(EasyAlign)", mode = "x",        desc = "EasyAlign" },
		},
	},
	{ "theprimeagen/harpoon", event = "VeryLazy" },
	{
		-- align items
		"tommcdo/vim-lion",
		enabled = false,
		init = function()
			vim.g.lion_squeeze_spaces = 1
		end,
	},
	{
		"matze/vim-move",
		event = "VeryLazy",
		init = function()
			vim.g.move_key_modifier = "C"
		end,
	},
	{ "tommcdo/vim-exchange", event = "VeryLazy" },
	{ "tpope/vim-surround",   event = "VeryLazy" }, -- TODO: mini.surround
	{ "tpope/vim-repeat",     event = "VeryLazy" },
	{ "tpope/vim-sleuth",     event = "VeryLazy" },
	{ "tpope/vim-unimpaired", event = "VeryLazy" },
	{ "tpope/vim-eunuch",     event = "VeryLazy" },
	{ "tpope/vim-commentary", event = "VeryLazy" },
	{
		"airblade/vim-rooter",
		lazy = false,
		priority = 900,
		config = function()
			vim.g.rooter_patterns = {
				".git",
				"CMakeLists.txt",
				"Makefile",
				"*.sln",
				".idea",
				".root",
				".vscode",
			}
		end,
	},
	{
		"AndrewRadev/switch.vim",
		init = function()
			vim.g.switch_mapping = "-"
		end,
		event = "VeryLazy",
		config = function()
			vim.cmd("source " .. vim.fn.stdpath "config" .. "/viml/switch.vim")
		end,
	},
	{
		"andymass/vim-matchup",
		init = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
		event = "VeryLazy",
	},
	{ "gennaro-tedesco/nvim-peekup", event = "VeryLazy" },
	{
		-- sqlite binary is needed
		"AckslD/nvim-neoclip.lua",
		event = "VeryLazy",
		dependencies = { "tami5/sqlite.lua", "telescope.nvim", module = "sqlite" },
		config = function()
			require("neoclip").setup {
				enable_persistent_history = true,
			}
			require("telescope").load_extension "neoclip"
		end,
	},
	-- call SwoopFreezeContext();call SwoopUnFreezeContext() to use with other plugins
	{ "pelodelfuego/vim-swoop",      cmd = "Swoop" },
	{ "sk1418/Join",                 cmd = "Join" },
	{
		"metakirby5/codi.vim",
		cmd = "Codi",
		init = function()
			-- change the color
			vim.cmd "highlight CodiVirtualText guifg=cyan"
			vim.cmd [[let g:codi#virtual_text_prefix = "❯ "]]
		end,
	},
	{
		-- Automatically make dirs when opening new paths
		"jghauser/mkdir.nvim",
		event = "VeryLazy",
	},
	{
		"folke/which-key.nvim",
		opts = {
			plugins = {
				spelling = {
					enabled = true,
					suggestions = 20,
				},
			},
			key_labels = {
				["<space>"] = "SPC",
				["<cr>"] = "RET",
				["<tab>"] = "TAB",
			},
		},
	},
	{ "folke/neoconf.nvim",        lazy = false },
	{
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		opts = {
			theme = "hyper",
			config = {
				week_header = {
					enable = true,
				},
				shortcut = {
					{
						desc = " Update",
						group = "@property",
						action = "Lazy update",
						key = "u",
					},
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
					{
						desc = " Apps",
						group = "DiagnosticHint",
						action = "Telescope app",
						key = "a",
					},
					{
						desc = " dotfiles",
						group = "Number",
						action = "Telescope dotfiles",
						key = "d",
					},
				},
			},
		},
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	{ "mhinz/vim-sayonara",        cmd = "Sayonara" },
	{ "justinmk/vim-syntax-extra", enabled = false, ft = { "flex", "bison" } },
	{
		"abecodes/tabout.nvim",
		event = "InsertEnter",
		dependencies = { "nvim-treesitter" },
		opts = {
			tabkey = "<C-o>",
			backwards_tabkey = "<C-i>",
		},
	},
	{
		"glepnir/dbsession.nvim",
		cmd = { "SessionSave", "SessionDelete", "SessionLoad" },
		config = true,
	},
}
