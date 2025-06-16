return {
	{
		"kristijanhusak/orgmode.nvim",
		event = "VeryLazy",
		ft = "org",
		dependencies = {
			{
				"akinsho/org-bullets.nvim",
				config = true,
			},
			{ "danilshvalov/org-modern.nvim" },
		},
		config = function()
			local Menu = require "org-modern.menu"
			require("orgmode").setup {
				ui = {
					menu = {
						handler = function(data)
							Menu:new({
								window = {
									margin = { 1, 0, 1, 0 },
									padding = { 0, 1, 0, 1 },
									title_pos = "center",
									border = "single",
									zindex = 1000,
								},
								icons = {
									separator = "➜",
								},
							}):open(data)
						end,
					},
				},
				org_agenda_files = { "~/wrkspc/org/**/*" },
				org_default_notes_file = "~/wrkspc/org/notes.org",
			}
		end,
	},
}
