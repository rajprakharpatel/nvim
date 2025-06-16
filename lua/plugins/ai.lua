return {
	{
		"Exafunction/codeium.vim",
		event = "InsertEnter",
		enabled = false,
		config = function()
			-- Change '<C-g>' here to any keycode you like.
			vim.g.codeium_disable_bindings = 1
			vim.keymap.set("i", "<a-i>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<a-]>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<a-[>", function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<a-x>", function()
				return vim.fn["codeium#Clear"]()
			end, { expr = true, silent = true })
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup {
				suggestion = { enabled = false },
				panel = { enabled = false },
			}
			-- Commenting below block as we are using copilot_cmp for suggestion
			-- local cmp = require "cmp"
			-- cmp.event:on("menu_opened", function()
			--   vim.b.copilot_suggestion_hidden = true
			-- end)
			-- cmp.event:on("menu_closed", function()
			--   vim.b.copilot_suggestion_hidden = false
			-- end)
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
		},
		config = function()
			require("copilot_cmp").setup()
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		cmd = "CopilotChat",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			-- See Configuration section for options
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
	{
		"piersolenski/wtf.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		opts = {},
		keys = {
			{
				"<leader>ww",
				mode = { "n", "x" },
				function()
					require("wtf").ai()
				end,
				desc = "Debug diagnostic with AI",
			},
			{
				mode = { "n" },
				"<leader>ws",
				function()
					require("wtf").search()
				end,
				desc = "Search diagnostic with Google",
			},
			{
				mode = { "n" },
				"<leader>wh",
				function()
					require("wtf").history()
				end,
				desc = "Populate the quickfix list with previous chat history",
			},
			{
				mode = { "n" },
				"<leader>wg",
				function()
					require("wtf").grep_history()
				end,
				desc = "Grep previous chat history with Telescope",
			},
		},
	},
}
