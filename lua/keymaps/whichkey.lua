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

wk.add(
	{
		{ "<space>d", group = "Debugger" },
		{ "<space>d?", desc = "<cmd>lua local wserveridgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>" },
		{ "<space>da", "<cmd>lua require'dap'.step_over()<CR>", desc = "Step Over/Ahead" },
		{ "<space>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", desc = "toggle breakpoint" },
		{ "<space>dc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", desc = "Breakpoint Condition" },
		{ "<space>dd", "<cmd>lua require'dap'.continue()<CR>", desc = "Start or continue" },
		{ "<space>de", "<cmd>lua require('dapui').eval()<CR>", desc = "Eval Expression" },
		{ "<space>dh", "<cmd>lua require'dap.ui.variables'.hover()<CR>", desc = "Hover variables" },
		{ "<space>di", "<cmd>lua require'dap'.step_into()<CR>", desc = "Step into" },
		{ "<space>dm", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", desc = "Breakpoint Message" },
		{ "<space>do", "<cmd>lua require'dap'.step_out()<CR>", desc = "Step Out" },
		{ "<space>dr", "<cmd>lua require'dap'.repl.open()<CR>", desc = "Repl Open" },
		{ "<space>ds", "<cmd>lua require('dapui').toggle()<CR>", desc = "DapUI Start/Stop" },
		{ "<space>dt", group = "Telescope" },
		{ "<space>dtb", "<cmd>Telescope dap list_breakpoints<CR>", desc = "breakpoint" },
		{ "<space>dtc", "<cmd>Telescope dap commands<CR>", desc = "commands" },
		{ "<space>dtf", "<cmd>Telescope dap frames<CR>", desc = "frames" },
		{ "<space>dtg", "<cmd>Telescope dap configurations<CR>", desc = "configurations" },
		{ "<space>dtv", "<cmd>Telescope dap variables<CR>", desc = "variables" },
		{ "<space>f", group = "Files" },
		{ "<space>fY", function() vim.fn.setreg("+", vim.fn.expand "%") end, desc = "Copy path from project root" },
		{ "<space>fy", function() vim.fn.setreg("+", vim.fn.expand "%:p") end, desc = "Copy absolute path" },
		{ "<space>fc", function() local yank = vim.api.nvim_buf_get_lines(0, 0, -1, false) vim.fn.setreg("+", yank) end, desc = "Copy File Content" },
		{ "<space>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		{ "<space>fg", "<cmd>Telescope git_files<cr>", desc = "Git Files" },
		{ "<space>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
		{ "<space>g", group = "Git" },
		{ "<space>gh", group = "Github" },
		{ "<space>ghc", group = "Commits" },
		{ "<space>ghcc", "<cmd>GHCloseCommit<cr>", desc = "Close" },
		{ "<space>ghce", "<cmd>GHExpandCommit<cr>", desc = "Expand" },
		{ "<space>ghco", "<cmd>GHOpenToCommit<cr>", desc = "Open To" },
		{ "<space>ghcp", "<cmd>GHPopOutCommit<cr>", desc = "Pop Out" },
		{ "<space>ghcz", "<cmd>GHCollapseCommit<cr>", desc = "Collapse" },
		{ "<space>ghi", group = "Issues" },
		{ "<space>ghip", "<cmd>GHPreviewIssue<cr>", desc = "Preview" },
		{ "<space>ghl", group = "Litee" },
		{ "<space>ghlt", "<cmd>LTPanel<cr>", desc = "Toggle Panel" },
		{ "<space>ghp", group = "Pull Request" },
		{ "<space>ghpc", "<cmd>GHClosePR<cr>", desc = "Close" },
		{ "<space>ghpd", "<cmd>GHPRDetails<cr>", desc = "Details" },
		{ "<space>ghpe", "<cmd>GHExpandPR<cr>", desc = "Expand" },
		{ "<space>ghpo", "<cmd>GHOpenPR<cr>", desc = "Open" },
		{ "<space>ghpp", "<cmd>GHPopOutPR<cr>", desc = "PopOut" },
		{ "<space>ghpr", "<cmd>GHRefreshPR<cr>", desc = "Refresh" },
		{ "<space>ghpt", "<cmd>GHOpenToPR<cr>", desc = "Open To" },
		{ "<space>ghpz", "<cmd>GHCollapsePR<cr>", desc = "Collapse" },
		{ "<space>ghr", group = "Review" },
		{ "<space>ghrb", "<cmd>GHStartReview<cr>", desc = "Begin" },
		{ "<space>ghrc", "<cmd>GHCloseReview<cr>", desc = "Close" },
		{ "<space>ghrd", "<cmd>GHDeleteReview<cr>", desc = "Delete" },
		{ "<space>ghre", "<cmd>GHExpandReview<cr>", desc = "Expand" },
		{ "<space>ghrs", "<cmd>GHSubmitReview<cr>", desc = "Submit" },
		{ "<space>ghrz", "<cmd>GHCollapseReview<cr>", desc = "Collapse" },
		{ "<space>ght", group = "Threads" },
		{ "<space>ghtc", "<cmd>GHCreateThread<cr>", desc = "Create" },
		{ "<space>ghtn", "<cmd>GHNextThread<cr>", desc = "Next" },
		{ "<space>ghtt", "<cmd>GHToggleThread<cr>", desc = "Toggle" },
		{ "<space>h", group = "Harpoon" },
		{ "<space>h1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", desc = "File 1" },
		{ "<space>hh", "<cmd>lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>", desc = "terminal menu" },
		{ "<space>hm", "<cmd>lua require('harpoon.mark').add_file()<CR>", desc = "Mark File" },
		{ "<space>hq", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Quick Menu" },
		{ "<space>hs", "<cmd>lua require('harpoon.term').sendCommand(1, 1)<CR>", desc = "Send predefined command" },
		{ "<space>ht", "<cmd>lua require('harpoon.term').gotoTerminal(1)<CR>", desc = "Terminal 1" },
		{ "<space>m", group = "Modify" },
		{ "<space>n", group = "npm" },
		{ "<space>nc", "<cmd>lua require('package-info').change_version()<CR>", desc = "change version" },
		{ "<space>nd", "<cmd>lua require('package-info').delete()<CR>", desc = "delete" },
		{ "<space>nh", "lua require('package-info').hide()<CR>", desc = "hide" },
		{ "<space>ni", "<cmd>lua require('package-info').install()<CR>", desc = "install" },
		{ "<space>nr", "<cmd>lua require('package-info').reinstall()<CR>", desc = "reinstall" },
		{ "<space>ns", "<cmd>lua require('package-info').show()<CR>", desc = "show" },
		{ "<space>nu", "<cmd>lua require('package-info').update()<CR>", desc = "update" },
		{ "<space>o", group = "Open" },
		{ "<space>oa", "<cmd>lua require('orgmode').action('agenda.prompt')", desc = "Org agenda" },
		{ "<space>oc", "<cmd>Cheat<cr>", desc = "Cheatsheet" },
		{ "<space>oe", "<cmd>NvimTreeToggle<cr>", desc = "File Browser" },
		{ "<space>om", group = "terminal" },
		{ "<space>omf", "<cmd>FloatermNew<cr>", desc = "Floaterm" },
		{ "<space>omn", "<cmd>Neomux<cr>", desc = "Neomux Terminal" },
		{ "<space>oms", "<cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>", desc = "lspsaga terminal" },
		{ "<space>on", "<cmd>e ~/org/notes.org<cr>", desc = "Notes" },
		{ "<space>ot", "<cmd>lua require('orgmode').action('capture.prompt')<cr>", desc = "Task" },
		{ "<space>p", group = "Plugins" },
		{ "<space>pc", "<cmd>Lazy clean<cr>", desc = "Clean" },
		{ "<space>pe", "<cmd>edit /Users/prakhar.patel/.config/nvim/lua/plugins.lua<CR>", desc = "Edit" },
		{ "<space>pi", "<cmd>Lazy install<cr>", desc = "Install" },
		{ "<space>ps", "<cmd>Lazy sync<cr>", desc = "Sync" },
		{ "<space>r", group = "Run stuff" },
		{ "<space>rr", "<cmd>echo &filetype<cr>", desc = "Print filetype" },
		{ "<space>s", group = "Switch/Toggle" },
		{ "<space>sH", "<C-w>t<C-w>K", desc = "Change split to horizontal" },
		{ "<space>sV", "<C-w>t<C-w>H", desc = "Change split to vertical" },
		{ "<space>st", "<cmd>TransparentToggle<cr>", desc = "Transparency" },
		{ "<space>t", group = "Telescope" },
		{ "<space>t'", "<cmd>Telescope neoclip<cr>", desc = "Clipboard" },
		{ "<space>ta", "<cmd>Telescope Code actions<cr>", desc = "Code Actions" },
		{ "<space>tb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
		{ "<space>tc", "<cmd>Telescope colorscheme<cr>", desc = "Colorschemes" },
		{ "<space>td", "<cmd>Telescope<cr>", desc = "Debugger breakpoints" },
		{ "<space>te", "<cmd>Telescope file_browser<cr>", desc = "File Explorer" },
		{ "<space>tl", "<cmd>Telescope lsp_references<cr>", desc = "LSP References" },
		{ "<space>tm", "<cmd>Telescope marks<cr>", desc = "Marks" },
		{ "<space>to", "<cmd>Telescope vim_options<cr>", desc = "Options" },
		{ "<space>ts", "<cmd>Telescope live_grep<cr>", desc = "Grep String" },
		{ "<space>tt", "<cmd>Telescope<cr>", desc = "Telescope all" },
		{ "<space>tx", "<cmd>Telescope commands<cr>", desc = "Commands" },
	}
)

-- Normal mode mappings with prefix space
-- wk.register({
-- 	g = {
-- 		name = "+Git",
-- 		h = {
-- 			name = "+Github",
-- 			c = {
-- 				name = "+Commits",
-- 				c = { "<cmd>GHCloseCommit<cr>", "Close" },
-- 				e = { "<cmd>GHExpandCommit<cr>", "Expand" },
-- 				o = { "<cmd>GHOpenToCommit<cr>", "Open To" },
-- 				p = { "<cmd>GHPopOutCommit<cr>", "Pop Out" },
-- 				z = { "<cmd>GHCollapseCommit<cr>", "Collapse" },
-- 			},
-- 			i = {
-- 				name = "+Issues",
-- 				p = { "<cmd>GHPreviewIssue<cr>", "Preview" },
-- 			},
-- 			l = {
-- 				name = "+Litee",
-- 				t = { "<cmd>LTPanel<cr>", "Toggle Panel" },
-- 			},
-- 			r = {
-- 				name = "+Review",
-- 				b = { "<cmd>GHStartReview<cr>", "Begin" },
-- 				c = { "<cmd>GHCloseReview<cr>", "Close" },
-- 				d = { "<cmd>GHDeleteReview<cr>", "Delete" },
-- 				e = { "<cmd>GHExpandReview<cr>", "Expand" },
-- 				s = { "<cmd>GHSubmitReview<cr>", "Submit" },
-- 				z = { "<cmd>GHCollapseReview<cr>", "Collapse" },
-- 			},
-- 			p = {
-- 				name = "+Pull Request",
-- 				c = { "<cmd>GHClosePR<cr>", "Close" },
-- 				d = { "<cmd>GHPRDetails<cr>", "Details" },
-- 				e = { "<cmd>GHExpandPR<cr>", "Expand" },
-- 				o = { "<cmd>GHOpenPR<cr>", "Open" },
-- 				p = { "<cmd>GHPopOutPR<cr>", "PopOut" },
-- 				r = { "<cmd>GHRefreshPR<cr>", "Refresh" },
-- 				t = { "<cmd>GHOpenToPR<cr>", "Open To" },
-- 				z = { "<cmd>GHCollapsePR<cr>", "Collapse" },
-- 			},
-- 			t = {
-- 				name = "+Threads",
-- 				c = { "<cmd>GHCreateThread<cr>", "Create" },
-- 				n = { "<cmd>GHNextThread<cr>", "Next" },
-- 				t = { "<cmd>GHToggleThread<cr>", "Toggle" },
-- 			},
-- 		},
-- 	},

-- 	-- Files
-- 	f = {
-- 		name = "Files",
-- 		f = { "<cmd>Telescope find_files<cr>", "Find Files" },
-- 		r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
-- 		g = { "<cmd>Telescope git_files<cr>", "Git Files" },
-- 		c = {
-- 			function()
-- 				local yank = vim.api.nvim_buf_get_lines(0, 0, -1, false)
-- 				vim.fn.setreg("+", yank)
-- 			end,
-- 			"Copy File Content",
-- 		},
-- 		y = {
-- 			function()
-- 				vim.fn.setreg("+", vim.fn.expand "%:p")
-- 			end,
-- 			"Copy absolute path",
-- 		},
-- 		Y = {
-- 			function()
-- 				vim.fn.setreg("+", vim.fn.expand "%")
-- 			end,
-- 			"Copy path from project root",
-- 		},
-- 	},

-- 	-- Telescope
-- 	t = {
-- 		name = "Telescope",
-- 		b = { "<cmd>Telescope buffers<cr>", "Buffers" },
-- 		e = { "<cmd>Telescope file_browser<cr>", "File Explorer" },
-- 		s = { "<cmd>Telescope live_grep<cr>", "Grep String" },
-- 		c = { "<cmd>Telescope colorscheme<cr>", "Colorschemes" },
-- 		t = { "<cmd>Telescope<cr>", "Telescope all" },
-- 		a = { "<cmd>Telescope Code actions<cr>", "Code Actions" },
-- 		x = { "<cmd>Telescope commands<cr>", "Commands" },
-- 		o = { "<cmd>Telescope vim_options<cr>", "Options" },
-- 		m = { "<cmd>Telescope marks<cr>", "Marks" },
-- 		l = { "<cmd>Telescope lsp_references<cr>", "LSP References" },
-- 		d = { "<cmd>Telescope<cr>", "Debugger breakpoints" },
-- 		["'"] = { "<cmd>Telescope neoclip<cr>", "Clipboard" },
-- 	},

-- 	-- open
-- 	o = {
-- 		name = "Open",
-- 		n = { "<cmd>e ~/org/notes.org<cr>", "Notes" },
-- 		a = {
-- 			"<cmd>lua require('orgmode').action('agenda.prompt')",
-- 			"Org agenda",
-- 		},
-- 		e = { "<cmd>NvimTreeToggle<cr>", "File Browser" },
-- 		c = { "<cmd>Cheat<cr>", "Cheatsheet" },
-- 		m = {
-- 			name = "terminal",
-- 			n = { "<cmd>Neomux<cr>", "Neomux Terminal" },
-- 			s = {
-- 				"<cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>",
-- 				"lspsaga terminal",
-- 			},
-- 			f = { "<cmd>FloatermNew<cr>", "Floaterm" },
-- 		},
-- 		t = {
-- 			"<cmd>lua require('orgmode').action('capture.prompt')<cr>",
-- 			"Task",
-- 		},
-- 	},

-- 	-- NPM
-- 	n = {
-- 		name = "npm",
-- 		s = { "<cmd>lua require('package-info').show()<CR>", "show" },
-- 		h = { "lua require('package-info').hide()<CR>", "hide" },
-- 		u = { "<cmd>lua require('package-info').update()<CR>", "update" },
-- 		d = { "<cmd>lua require('package-info').delete()<CR>", "delete" },
-- 		i = { "<cmd>lua require('package-info').install()<CR>", "install" },
-- 		r = { "<cmd>lua require('package-info').reinstall()<CR>", "reinstall" },
-- 		c = {
-- 			"<cmd>lua require('package-info').change_version()<CR>",
-- 			"change version",
-- 		},
-- 	},

-- 	-- Modify
-- 	m = {
-- 		name = "Modify",
-- 	},

-- 	-- debugger
-- 	d = {
-- 		name = "Debugger",
-- 		b = {
-- 			"<cmd>lua require'dap'.toggle_breakpoint()<CR>",
-- 			"toggle breakpoint",
-- 		},
-- 		d = { "<cmd>lua require'dap'.continue()<CR>", "Start or continue" },
-- 		a = { "<cmd>lua require'dap'.step_over()<CR>", "Step Over/Ahead" },
-- 		o = { "<cmd>lua require'dap'.step_out()<CR>", "Step Out" },
-- 		i = { "<cmd>lua require'dap'.step_into()<CR>", "Step into" },
-- 		c = {
-- 			"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
-- 			"Breakpoint Condition",
-- 		},
-- 		m = {
-- 			"<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
-- 			"Breakpoint Message",
-- 		},
-- 		r = { "<cmd>lua require'dap'.repl.open()<CR>", "Repl Open" },
-- 		s = { "<cmd>lua require('dapui').toggle()<CR>", "Debugger Start/Stop" },
-- 		e = { "<cmd>lua require('dapui').eval()<CR>", "Eval Expression" },
-- 		h = {
-- 			"<cmd>lua require'dap.ui.variables'.hover()<CR>",
-- 			"Hover variables",
-- 		},
-- 		["?"] = {
-- 			"<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>",
-- 		},
-- 		t = {
-- 			name = "Telescope",
-- 			c = { "<cmd>Telescope dap commands<CR>", "commands" },
-- 			g = { "<cmd>Telescope dap configurations<CR>", "configurations" },
-- 			b = { "<cmd>Telescope dap list_breakpoints<CR>", "breakpoint" },
-- 			v = { "<cmd>Telescope dap variables<CR>", "variables" },
-- 			f = { "<cmd>Telescope dap frames<CR>", "frames" },
-- 		},
-- 	},

-- 	-- Plugin
-- 	p = {
-- 		name = "Plugins",
-- 		i = { "<cmd>Lazy install<cr>", "Install" },
-- 		s = { "<cmd>Lazy sync<cr>", "Sync" },
-- 		c = { "<cmd>Lazy clean<cr>", "Clean" },
-- 		e = {
-- 			"<cmd>edit " .. vim.fn.stdpath "config" .. "/lua/plugins.lua<CR>",
-- 			"Edit",
-- 		},
-- 	},

-- 	-- Run
-- 	r = {
-- 		name = "Run stuff",
-- 		r = {
-- 			function()
-- 				local current_filetype = vim.api.nvim_buf_get_option(0, "filetype")
-- 				print(current_filetype)
-- 			end,
-- 			"Print filetype",
-- 		},
-- 	},

-- 	-- Toggle/Switch
-- 	s = {
-- 		name = "Switch/Toggle",
-- 		t = { "<cmd>TransparentToggle<cr>", "Transparency" },
-- 		H = { "<C-w>t<C-w>K", "Change split to horizontal" },
-- 		V = { "<C-w>t<C-w>H", "Change split to vertical" },
-- 	},

-- 	-- Harpoon
-- 	h = {
-- 		name = "Harpoon",
-- 		q = {
-- 			"<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>",
-- 			"Quick Menu",
-- 		},
-- 		m = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "Mark File" },
-- 		["1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", "File 1" },
-- 		t = {
-- 			"<cmd>lua require('harpoon.term').gotoTerminal(1)<CR>",
-- 			"Terminal 1",
-- 		},
-- 		s = {
-- 			"<cmd>lua require('harpoon.term').sendCommand(1, 1)<CR>",
-- 			"Send predefined command",
-- 		},
-- 		h = {
-- 			"<cmd>lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>",
-- 			"terminal menu",
-- 		},
-- 	},
-- }, {
-- 	mode = "n",
-- 	prefix = "<space>",
-- })
