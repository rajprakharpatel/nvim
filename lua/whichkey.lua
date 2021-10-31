local wk = require("which-key")

-- default opts
--[[
local opts = {
	mode = "n", -- NORMAL mode
	-- prefix: use "<leader>f" for example for mapping everything related to finding files
	-- the prefix is prepended to every mapping part of `mappings`
	prefix = "",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}]]

local pre_cmd = "<cmd>source " .. vim.fn.stdpath("config") .. "/lua/plugins.lua | "

-- Normal mode mappings with prefix space
wk.register({

	-- Telescope
	t = {
		name = "Telescope",
		f = { "<cmd>Telescope find_files<cr>", "Find File" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		b = { "<cmd>Telescope buffers<cr>", "Buffers" },
		g = { "<cmd>Telescope git_files<cr>", "Git Files" },
		e = { "<cmd>Telescope file_browser<cr>", "File Explorer" },
		s = { "<cmd>Telescope live_grep<cr>", "Grep String" },
		c = { "<cmd>Telescope colorscheme<cr>", "Colorschemes" },
		t = { "<cmd>Telescope<cr>", "Telescope all" },
		a = { "<cmd>Telescope Code actions<cr>", "Code Actions" },
		x = { "<cmd>Telescope commands<cr>", "Commands" },
		o = { "<cmd>Telescope vim_options<cr>", "Options" },
		m = { "<cmd>Telescope marks<cr>", "Marks" },
		l = { "<cmd>Telescope lsp_references<cr>", "LSP References" },
		["'"] = { "<cmd>Telescope neoclip<cr>", "Clipboard" },
	},

	-- Orgmode
	o = {
		name = "Orgmode",
		n = { "<cmd>edit ~/org/notes.org<cr>" },
	},

	-- New
	n = {
		name = "New",
		t = {
			name = "terminal",
			n = { "<cmd>Neomux<cr>", "Neomux Terminal" },
			s = { "<cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>", "lspsaga terminal" },
			f = { "<cmd>FloatermNew<cr>", "Floaterm" },
		},
	},

	-- Modify
	m = {
		name = "Modify",
	},

	-- Plugin
	p = {
		i = { pre_cmd .. "PackerInstall<cr>", "Install" },
		s = { pre_cmd .. "PackerSync<cr>", "Sync" },
		c = { pre_cmd .. "PackerClean<cr>", "Clean" },
	},

	-- Toggle/Switch
	s = {
		name = "Switch/Toggle",
		t = { "<cmd>TransparentToggle", "Transparency" },
		H = { "<C-w>t<C-w>K", "Change split to horizontal" },
		V = { "<C-w>t<C-w>H", "Change split to vertical" },
	},
}, {
	mode = "n",
	prefix = "<space>",
})
