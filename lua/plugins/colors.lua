--------------------
--  colorschemes  --
--------------------

return {
	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
	},

	{
		"marko-cerovac/material.nvim",
		-- cmd = 'colo material',
		config = function()
			vim.g.material_style = "deep ocean"
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
				styles = { -- Give comments style such as bold, italic, underline etc.
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
			-- cmd = "colo github_light",
	},

	{ "bluz71/vim-nightfly-guicolors", 
	-- cmd = "colo nightfly" 
	},

	{
		"kristijanhusak/vim-hybrid-material",
		-- cmd = { "colo hybrid_material", "colo hybrid_reverse" 
	},

	{ "savq/melange", 
	-- cmd = "colo melange" 
	},

	{ "sainnhe/gruvbox-material", -- cmd = "colo gruvbox-material"
	},

	{ "sainnhe/sonokai", 
	-- cmd = "colo sonokai" 
	},

	{ "tanvirtin/monokai.nvim" },

	{
		"ChristianChiarulli/nvcode-color-schemes.vim",
		-- cmd = { "colo gruvbox", "colo nvcode", "colo aurora" },
	},

	{
		"tiagovla/tokyodark.nvim",
		-- cmd = "colo tokyodark",
	},

	{
		"xiyaowong/nvim-transparent",
		config = function()
			require("transparent").setup { enable = false }
		end,
	},

	{
		"sainnhe/everforest",
		config = function()
			vim.g.everforest_background = "hard"
		end,
	}
}

