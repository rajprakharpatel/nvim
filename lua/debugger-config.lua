local map = vim.api.nvim_set_keymap

-------------------
--  DAP-keymaps  --
-------------------

map("n", "<space>cc", ":lua require'dap'.continue()<CR>", { noremap = true })
map(
	"n",
	"<space>oo",
	":lua require'dap'.step_over()<CR>",
	{ noremap = true, silent = true }
)
map(
	"n",
	"<space>ii",
	":lua require'dap'.step_into()<CR>",
	{ noremap = true, silent = true }
)
map(
	"n",
	"<space>ou",
	":lua require'dap'.step_out()<CR>",
	{ noremap = true, silent = true }
)
map(
	"n",
	"<space>db",
	":lua require'dap'.toggle_breakpoint()<CR>",
	{ noremap = true, silent = true }
)
map(
	"n",
	"<space>dbc",
	":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	{ noremap = true, silent = true }
)
map(
	"n",
	"<space>dbm",
	":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
	{ noremap = true, silent = true }
)
map(
	"n",
	"<space>drpl",
	":lua require'dap'.repl.open()<CR>",
	{ noremap = true, silent = true }
)
map(
	"n",
	"<space>drl",
	":lua require'dap'.run_last()<CR>",
	{ noremap = true, silent = true }
)
map(
	"n",
	"<space>de",
	':lua require"dap".disconnect();require"dap".close();require"dap".run_last()<CR>',
	{ noremap = true, silent = true }
)
map(
	"n",
	"<space>dh",
	':lua require"dap.ui.variables".hover()<CR>',
	{ noremap = true, silent = true }
)
map(
	"n",
	"<leader>dk",
	':lua require"dap".up()<CR>',
	{ noremap = true, silent = true }
)
map(
	"n",
	"<leader>dj",
	':lua require"dap".down()<CR>',
	{ noremap = true, silent = true }
)
map(
	"n",
	"<leader>di",
	':lua require"dap.ui.variables".visual_hover()<CR>',
	{ noremap = true, silent = true }
)
map(
	"n",
	"<leader>d?",
	':lua require"dap.ui.variables".scopes()<CR>',
	{ noremap = true, silent = true }
)
map(
	"n",
	"<leader>dea",
	':lua require"dap".set_exception_breakpoints({"all"})<CR>',
	{ noremap = true, silent = true }
)
map(
	"n",
	"<leader>da",
	':lua require"debugHelper".attach()<CR>',
	{ noremap = true, silent = true }
)
map(
	"n",
	"<leader>dA",
	':lua require"debugHelper".attachToRemote()<CR>',
	{ noremap = true, silent = true }
)
map(
	"n",
	"<leader>di",
	':lua require"dap.ui.widgets".hover()<CR>',
	{ noremap = true, silent = true }
)
map(
	"n",
	"<leader>d?",
	':lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>',
	{ noremap = true, silent = true }
)

--------------------------
--  telescope-dap.nvim  --
--------------------------
-- require('telescope').load_extension('dap')
map(
	"n",
	"<leader>ds",
	":Telescope dap frames<CR>",
	{ noremap = true, silent = true }
)
map(
	"n",
	"<leader>dc",
	":Telescope dap commands<CR>",
	{ noremap = true, silent = true }
)
map(
	"n",
	"<leader>db",
	":Telescope dap list_breakpoints<CR>",
	{ noremap = true, silent = true }
)

-----------------------------
--  nvim-dap-virtual-text  --
-----------------------------
vim.g.dap_virtual_text = true

-----------------------
--  adapter-configs  --
-----------------------
local dap = require("dap")
dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb-vscode", -- adjust as needed
	name = "lldb",
}

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input(
				"Path to executable: ",
				vim.fn.getcwd() .. "/",
				"file"
			)
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = true,
		args = {},

		-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
		--
		--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
		--
		-- Otherwise you might get the following error:
		--
		--    Error on launch: Failed to attach to the target process
		--
		-- But you should be aware of the implications:
		-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
		runInTerminal = true,
	},
}

-- If you want to use this for rust and c, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
