--------------------
--  colorschemes  --
--------------------

return {
	{
		"folke/tokyonight.nvim",
	},
	{ "miikanissi/modus-themes.nvim", priority = 1000 },
	{
		"marko-cerovac/material.nvim",
		init = function()
			vim.g.material_style = "deep_ocean"
		end,
		config = function()
			require("material").setup {
				contrast = {
					terminal = true,
					sidebars = false,
					floating_windows = false,
					cursor_line = false,
					non_current_windows = true,
					popup_menu = false,
					filetypes = {
						"terminal",
						"packer",
						"qf",
						"NvimTree",
						"undotree",
						"diff",
					},
				},
				borders = true,
				styles = {
					-- Give comments style such as bold, italic, underline etc.
					comments = { italic = true },
					strings = { bold = true },
					keywords = {},
					functions = { bold = true },
					variables = {},
					operators = {},
					types = {},
				},
				high_visibility = { lighter = false, darker = true },
				disable = {
					background = false,
					term_colors = false,
					eob_lines = false,
				},
				plugins = { -- Uncomment the plugins that you use to highlight them
					-- Available plugins:
					"dap",
					"dashboard",
					"gitsigns",
					"hop",
					"indent-blankline",
					"lspsaga",
					"mini",
					"neogit",
					"nvim-cmp",
					"nvim-navic",
					"nvim-tree",
					"sneak",
					"telescope",
					"trouble",
					"which-key",
				},
				async_loading = true,
			}
			vim.g.material_variable_color = "#d17CB4"

			vim.api.nvim_set_keymap(
				"n",
				"<leader>ml",
				[[<Cmd>lua require('material.functions').change_style('lighter')<CR>]],
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>mo",
				[[<Cmd>lua require('material.functions').change_style('deep ocean')<CR>]],
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>md",
				[[<Cmd>lua require('material.functions').change_style('darker')<CR>]],
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>~",
				":lua require('material.functions').toggle_eob()<CR>",
				{ noremap = true }
			)
		end,
	},

	{
		"projekt0n/github-nvim-theme",
	},

	{
		"bluz71/vim-nightfly-guicolors",
	},

	{
		"kristijanhusak/vim-hybrid-material",
	},

	{
		"savq/melange",
	},

	{
		"sainnhe/gruvbox-material",
	},

	{
		"sainnhe/sonokai",
	},

	{ "loctvl842/monokai-pro.nvim" },

	{
		"ChristianChiarulli/nvcode-color-schemes.vim",
	},

	{
		"tiagovla/tokyodark.nvim",
	},

	{
		"xiyaowong/nvim-transparent",
		cmd = { "TransparentEnable", "TransparentDisable", "TransparentToggle" },
		config = true,
	},
	{
		"sainnhe/everforest",
		config = function()
			vim.g.everforest_background = "hard"
		end,
	},
	{
		"dharmx/nvim-colo",
		enabled = false,
		-- event = "VeryLazy",
		lazy = false,
		opts = {
			theme = "radium_dark",
			extensions = {
				bufferline = {
					enable = false,
				},
				devicons = {
					enable = true,
				},
				aggregates = {
					enable = true,
					items = {
						bold = true,
						undercurl = true,
						underline = true,
						italic = true,
						transparent = true,
					},
				},
			},
			presets = {
				enable = true,
				items = {
					italic_comments = true,
					dotted_spell = true,
					contrast = true,
				},
			},
		},
	},
}
