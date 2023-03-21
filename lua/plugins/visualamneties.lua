return {
	{
		"folke/twilight.nvim",
		cmd = {
			"Twilight",
			"TwilightEnable",
			"TwilightDisable",
		},
		opts = { context = 5 },
	},
	{
		"folke/zen-mode.nvim",
		dependencies = { "twilight.nvim" },
		cmd = "ZenMonde",
		config = true,
	},
	{
		"norcalli/nvim-colorizer.lua",
		event = "BufWinEnter",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"yamatsum/nvim-nonicons",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = true,
	},
	{
		"edluffy/specs.nvim",
		event = "VeryLazy",
		config = function()
			require("specs").setup {
				show_jumps = true,
				min_jump = 5,
				popup = {
					delay_ms = 0, -- delay before popup displays
					inc_ms = 4, -- time increments used for fade/resize effects
					blend = 20, -- starting blend, between 0-100 (fully transparent), see :h winblend
					width = 50,
					winhl = "PMenu",
					fader = require("specs").linear_fader,
					resizer = require("specs").shrink_resizer,
				},
				ignore_filetypes = { "dashboard" },
				ignore_buftypes = { nofile = true },
			}
		end,
	},
	{
		"rcarriga/nvim-notify",
		lazy = false,
		priority = 500,
		config = function()
			require("notify").setup {
				timeout = 500,
				-- background_colour = "#000000",
			}
			vim.notify = require "notify"
		end,
	},
	{ "RRethy/vim-illuminate",  event = "VeryLazy" },
	{ "mg979/vim-visual-multi", event = "InsertEnter" },
	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		config = true,
	},
	{
		"camspiers/lens.vim",
		event = "VeryLazy",
		dependencies = { "camspiers/animate.vim" },
		init = function()
			vim.cmd "let g:lens#disabled_filetypes = ['nerdtree', 'fzf', 'NvimTree']"
			vim.cmd "let g:lens#disabled_buftypes = ['nofile']"
		end,
	},
	{
		"lukas-reineke/headlines.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		ft = { "org", "rmd", "markdown", "vimwiki", "yaml" },
		config = true, -- or `opts = {}`
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		init = function()
			vim.g.indent_blankline_buftype_exclude = { "terminal" }
			vim.g.indent_blankline_filetype_exclude = {
				"help",
				"startify",
				"dashboard",
				"packer",
				"neogitstatus",
				"qf",
			}
			vim.g.indent_blankline_char = "▏"
			vim.g.indent_blankline_use_treesitter = true
			vim.g.indent_blankline_show_trailing_blankline_indent = false
			vim.g.indent_blankline_show_current_context = true
			vim.g.indent_blankline_context_patterns = {
				"class",
				"return",
				"function",
				"method",
				"^if",
				"^while",
				"jsx_element",
				"^for",
				"^object",
				"^table",
				"block",
				"arguments",
				"if_statement",
				"else_clause",
				"jsx_element",
				"jsx_self_closing_element",
				"try_statement",
				"catch_clause",
				"import_statement",
				"operation_type",
			}
		end,
	},
}
