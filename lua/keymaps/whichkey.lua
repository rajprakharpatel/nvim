local wk = require "which-key"

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

local pre_cmd = "<cmd>source "
	.. vim.fn.stdpath "config"
	.. "/lua/plugin/init.lua | "

-- Normal mode mappings with prefix space
wk.register({
	g = {
		name = "+Git",
		h = {
			name = "+Github",
			c = {
				name = "+Commits",
				c = { "<cmd>GHCloseCommit<cr>", "Close" },
				e = { "<cmd>GHExpandCommit<cr>", "Expand" },
				o = { "<cmd>GHOpenToCommit<cr>", "Open To" },
				p = { "<cmd>GHPopOutCommit<cr>", "Pop Out" },
				z = { "<cmd>GHCollapseCommit<cr>", "Collapse" },
			},
			i = {
				name = "+Issues",
				p = { "<cmd>GHPreviewIssue<cr>", "Preview" },
			},
			l = {
				name = "+Litee",
				t = { "<cmd>LTPanel<cr>", "Toggle Panel" },
			},
			r = {
				name = "+Review",
				b = { "<cmd>GHStartReview<cr>", "Begin" },
				c = { "<cmd>GHCloseReview<cr>", "Close" },
				d = { "<cmd>GHDeleteReview<cr>", "Delete" },
				e = { "<cmd>GHExpandReview<cr>", "Expand" },
				s = { "<cmd>GHSubmitReview<cr>", "Submit" },
				z = { "<cmd>GHCollapseReview<cr>", "Collapse" },
			},
			p = {
				name = "+Pull Request",
				c = { "<cmd>GHClosePR<cr>", "Close" },
				d = { "<cmd>GHPRDetails<cr>", "Details" },
				e = { "<cmd>GHExpandPR<cr>", "Expand" },
				o = { "<cmd>GHOpenPR<cr>", "Open" },
				p = { "<cmd>GHPopOutPR<cr>", "PopOut" },
				r = { "<cmd>GHRefreshPR<cr>", "Refresh" },
				t = { "<cmd>GHOpenToPR<cr>", "Open To" },
				z = { "<cmd>GHCollapsePR<cr>", "Collapse" },
			},
			t = {
				name = "+Threads",
				c = { "<cmd>GHCreateThread<cr>", "Create" },
				n = { "<cmd>GHNextThread<cr>", "Next" },
				t = { "<cmd>GHToggleThread<cr>", "Toggle" },
			},
		},
	},

	-- Files
	f = {
		name = "Files",
		f = { "<cmd>Telescope find_files<cr>", "Find Files" },
		r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
		g = { "<cmd>Telescope git_files<cr>", "Git Files" },
		c = {
			function()
				local yank = vim.api.nvim_buf_get_lines(0, 0, -1, false)
				vim.fn.setreg("+", yank)
			end,
			"Copy File Content",
		},
		y = {
			function()
				vim.fn.setreg("+", vim.fn.expand "%:p")
			end,
			"Copy absolute path",
		},
		Y = {
			function()
				vim.fn.setreg("+", vim.fn.expand "%")
			end,
			"Copy path from project root",
		},
	},

	-- Telescope
	t = {
		name = "Telescope",
		b = { "<cmd>Telescope buffers<cr>", "Buffers" },
		e = { "<cmd>Telescope file_browser<cr>", "File Explorer" },
		s = { "<cmd>Telescope live_grep<cr>", "Grep String" },
		c = { "<cmd>Telescope colorscheme<cr>", "Colorschemes" },
		t = { "<cmd>Telescope<cr>", "Telescope all" },
		a = { "<cmd>Telescope Code actions<cr>", "Code Actions" },
		x = { "<cmd>Telescope commands<cr>", "Commands" },
		o = { "<cmd>Telescope vim_options<cr>", "Options" },
		m = { "<cmd>Telescope marks<cr>", "Marks" },
		l = { "<cmd>Telescope lsp_references<cr>", "LSP References" },
		d = { "<cmd>Telescope<cr>", "Debugger breakpoints" },
		["'"] = { "<cmd>Telescope neoclip<cr>", "Clipboard" },
	},

	-- Orgmode
	o = {
		name = "Open",
		n = { "<cmd>e ~/org/notes.org<cr>", "Notes" },
		a = {
			"<cmd>lua require('orgmode').action('agenda.prompt')",
			"Org agenda",
		},
		e = { "<cmd>NvimTreeToggle<cr>", "File Browser" },
		c = { "<cmd>Cheat<cr>", "Cheatsheet" },
		m = {
			name = "terminal",
			n = { "<cmd>Neomux<cr>", "Neomux Terminal" },
			s = {
				"<cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>",
				"lspsaga terminal",
			},
			f = { "<cmd>FloatermNew<cr>", "Floaterm" },
		},
		t = {
			"<cmd>lua require('orgmode').action('capture.prompt')<cr>",
			"Task",
		},
	},

	-- NPM
	n = {
		name = "npm",
		s = { "<cmd>lua require('package-info').show()<CR>", "show" },
		h = { "lua require('package-info').hide()<CR>", "hide" },
		u = { "<cmd>lua require('package-info').update()<CR>", "update" },
		d = { "<cmd>lua require('package-info').delete()<CR>", "delete" },
		i = { "<cmd>lua require('package-info').install()<CR>", "install" },
		r = { "<cmd>lua require('package-info').reinstall()<CR>", "reinstall" },
		c = {
			"<cmd>lua require('package-info').change_version()<CR>",
			"change version",
		},
	},

	-- Modify
	m = {
		name = "Modify",
	},

	-- debugger
	d = {
		name = "Debugger",
		b = {
			"<cmd>lua require'dap'.toggle_breakpoint()<CR>",
			"toggle breakpoint",
		},
		d = { "<cmd>lua require'dap'.continue()<CR>", "Start or continue" },
		a = { "<cmd>lua require'dap'.step_over()<CR>", "Step Over/Ahead" },
		o = { "<cmd>lua require'dap'.step_out()<CR>", "Step Out" },
		i = { "<cmd>lua require'dap'.step_into()<CR>", "Step into" },
		c = {
			"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
			"Breakpoint Condition",
		},
		m = {
			"<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
			"Breakpoint Message",
		},
		r = { "<cmd>lua require'dap'.repl.open()<CR>", "Repl Open" },
		s = { "<cmd>lua require('dapui').toggle()<CR>", "Debugger Start/Stop" },
		e = { "<cmd>lua require('dapui').eval()<CR>", "Eval Expression" },
		h = {
			"<cmd>lua require'dap.ui.variables'.hover()<CR>",
			"Hover variables",
		},
		["?"] = {
			"<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>",
		},
		t = {
			name = "Telescope",
			c = { "<cmd>Telescope dap commands<CR>", "commands" },
			g = { "<cmd>Telescope dap configurations<CR>", "configurations" },
			b = { "<cmd>Telescope dap list_breakpoints<CR>", "breakpoint" },
			v = { "<cmd>Telescope dap variables<CR>", "variables" },
			f = { "<cmd>Telescope dap frames<CR>", "frames" },
		},
	},

	-- Plugin
	p = {
		name = "Plugins",
		i = { pre_cmd .. "PackerInstall<cr>", "Install" },
		s = { pre_cmd .. "PackerSync<cr>", "Sync" },
		c = { pre_cmd .. "PackerClean<cr>", "Clean" },
		e = {
			"<cmd>edit " .. vim.fn.stdpath "config" .. "/lua/plugin/init.lua<CR>",
			"Edit",
		},
	},

	-- Run
	r = {
		name = "Run stuff",
		r = {
			function()
				local current_filetype = vim.api.nvim_buf_get_option(0, "filetype")
				print(current_filetype)
			end,
			"Print filetype",
		},
	},

	-- Toggle/Switch
	s = {
		name = "Switch/Toggle",
		t = { "<cmd>TransparentToggle<cr>", "Transparency" },
		H = { "<C-w>t<C-w>K", "Change split to horizontal" },
		V = { "<C-w>t<C-w>H", "Change split to vertical" },
	},

	-- Harpoon
	h = {
		name = "Harpoon",
		q = {
			"<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>",
			"Quick Menu",
		},
		m = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "Mark File" },
		["1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", "File 1" },
		t = {
			"<cmd>lua require('harpoon.term').gotoTerminal(1)<CR>",
			"Terminal 1",
		},
		s = {
			"<cmd>lua require('harpoon.term').sendCommand(1, 1)<CR>",
			"Send predefined command",
		},
		h = {
			"<cmd>lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>",
			"terminal menu",
		},
	},
}, {
	mode = "n",
	prefix = "<space>",
})
