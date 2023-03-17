return {
	{
		"folke/neodev.nvim",
		ft = "lua",
		dependencies = {"nvim-lspconfig"},
		config = function()
			-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
			require("neodev").setup({})
			require('lspconfig').lua_ls.setup {
				settings = {
					Lua = {
						workspace = {
							checkThirdPary = false,
						},
						-- Do not send telemetry data containing a randomized but unique identifier
						telemetry = {
							enable = false,
						},
					},
				},
			}
		end,
	},
	{
		"rafcamlet/nvim-luapad",
		cmd = "Luapad"
	},
}
