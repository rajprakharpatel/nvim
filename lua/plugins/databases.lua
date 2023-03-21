return {
	{ "tpope/vim-dadbod", cmd = "DB" },
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = { "vim-dadbod" },
		cmd = "DBUI",
		init = function()
			vim.g.db_ui_auto_execute_table_helpers = 1
		end,
	},
	{
		"nanotee/sqls.nvim",
		ft = "sql",
		config = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = { "SqlsConnectionChoice", "SqlsDatabaseChoice" },
				callback = function(event)
					vim.notify(
						"Database/Connection changed to " .. event.data.choice,
						vim.log.levels.INFO
					)
				end,
			})
		end,
	},
}
