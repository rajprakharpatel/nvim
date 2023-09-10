return {
	{
		"NeogitOrg/neogit",
		event = "BufRead",
		cmd = { "Neogit" },
		dependencies = { "plenary.nvim", "diffview.nvim" },
		opts = {
			sections = {
				untracked = {
					folded = true,
				},
				unstaged = {
					folded = true,
				},
				staged = {
					folded = true,
				},
				stashes = {
					folded = true,
				},
				unpulled_upstream = {
					folded = true,
					hidden = false
				},
				unmerged_upstream = {
					folded = true,
					hidden = false
				},
				recent = {
					folded = true,
				},
			},
			integrations = {
				diffview = true,
			},
		},
	},
	{
		"sindrets/diffview.nvim",
		dependencies = { "plenary.nvim", "diffview.nvim", "nvim-web-devicons" },
	},
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "BufRead",
		config = function()
			require("gitsigns").setup {
				signs = {
					add = { hl = "GitSignsAdd", text = "+", linehl = "GitSignsAddLn" },
					change = {
						hl = "GitSignsChange",
						text = "~",
						linehl = "GitSignsChangeLn",
					},
					delete = {
						hl = "GitSignsDelete",
						text = "-",
						linehl = "GitSignsDeleteLn",
					},
					topdelete = {
						hl = "GitSignsDelete",
						text = "﫧",
						linehl = "GitSignsDeleteLn",
					},
					changedelete = {
						hl = "GitSignsChange",
						text = "*",
						linehl = "GitSignsChangeLn",
					},
				},
				numhl = true,
				linehl = false,
				watch_gitdir = { interval = 50 },
				current_line_blame = true,
				sign_priority = 6,
				update_debounce = 20,
				status_formatter = nil, -- Use default
			}
		end,
	},
	{
		"ldelossa/gh.nvim",
		event = "VeryLazy",
		dependencies = {
			{
				"ldelossa/litee.nvim",
				config = function()
					require("litee.lib").setup {
						panel = {
							orientation = "right",
						},
					}
				end,
			},
		},
		config = function ()
			require('litee.gh').setup({})
		end
	},
}
