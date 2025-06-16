return {
	-- Status Line
	{
		"NTBBloodbath/galaxyline.nvim",
		enabled = false,
		lazy = false,
		dependencies = { "package-info.nvim", "yamatsum/nvim-nonicons" },
		config = function()
			require "plugins/statuslinethemes/galaxyline-bubbles"
		end,
	},
	{
		"rebelot/heirline.nvim",
		enabled = false,
		lazy = false,
		dependencies = { "lewis6991/gitsigns.nvim", "Smitesh/nvim-navic" },
		config = function()
			require "plugin/heirline"
		end,
	},
	{
		"windwp/windline.nvim",
		enabled = false,
		lazy = false,
		config = function()
			require "wlsample.evil_line"
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		enabled = true,
		lazy = false,
		dependencies = { "folke/trouble.nvim" },
		opts = function(_, opts)
			local lualine = require('lualine').get_config()
			local trouble = require "trouble"
			local symbols = trouble.statusline {
				mode = "lsp_document_symbols",
				groups = {},
				title = false,
				filter = { range = true },
				format = "{kind_icon}{symbol.name:Normal}",
				-- The following line is needed to fix the background color
				-- Set it to the lualine section you want to use
				hl_group = "lualine_c_normal",
			}
			table.insert(lualine.sections.lualine_c, {
				symbols.get,
				cond = symbols.has,
			})
		end,
	},
}
