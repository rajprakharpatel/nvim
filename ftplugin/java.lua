-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.

-- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.expand "$HOME" .. "/.cache/jdtls/" .. project_name

local config = {
	-- The command that starts the language server
	-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
	cmd = {

		-- 💀
		"java", -- or '/path/to/java21_or_newer/bin/java'
		-- depends on if `java` is in your $PATH env variable and if it points to the right version.

		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		-- 💀
		"-jar",
		vim.fn.stdpath "data"
			.. "/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.7.0.v20250331-1702.jar",
		-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
		-- Must point to the                                                     Change this to
		-- eclipse.jdt.ls installation                                           the actual version

		-- 💀
		"-configuration",
		vim.fn.stdpath "data" .. "/mason/packages/jdtls/config_linux",
		-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
		-- Must point to the                      Change to one of `linux`, `win` or `mac`
		-- eclipse.jdt.ls installation            Depending on your system.

		-- 💀
		-- See `data directory configuration` section in the README
		"-data",
		workspace_dir,
	},

	-- 💀
	-- This is the default if not provided, you can remove it. Or adjust as needed.
	-- One dedicated LSP server & client will be started per unique root_dir
	--
	-- vim.fs.root requires Neovim 0.10.
	-- If you're using an earlier version, use: require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
	root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew", ".iml" }),

	-- Here you can configure eclipse.jdt.ls specific settings
	-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
	-- for a list of options
	settings = {
		java = {},
	},

	-- Language server `initializationOptions`
	-- You need to extend the `bundles` with paths to jar files
	-- if you want to use additional eclipse.jdt.ls plugins.
	--
	-- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
	--
	-- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
	init_options = {
		bundles = {
			vim.fn.glob(vim.fn.stdpath "data" .. "/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", true)
		},
	},
}

-- Keymaps
vim.cmd [[set softtabstop=4]]
vim.cmd [[set shiftwidth=4]]
-- vim.cmd[[set noexpandtab]]

local function buf_set_keymap(...)
	vim.api.nvim_buf_set_keymap(0, ...)
end

local function options(desc)
	return {
		desc = desc,
		noremap = true,
		silent = true,
	}
end

-- Mappings.
local opts = { noremap = true, silent = true }
buf_set_keymap(
	"n",
	"gD",
	"<Cmd>lua vim.lsp.buf.declaration()<CR>",
	options "Goto declaration"
)
buf_set_keymap(
	"n",
	"gd",
	"<Cmd>lua vim.lsp.buf.definition()<CR>",
	options "Goto definition"
)
-- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
buf_set_keymap(
	"n",
	"<c-b>",
	"<cmd>lua vim.lsp.buf.references()<CR>",
	options "Open references in Qf"
)
buf_set_keymap(
	"n",
	"gi",
	"<cmd>lua vim.lsp.buf.implementation()<CR>",
	options "Goto implementation"
)
buf_set_keymap(
	"n",
	"<space>k",
	"<cmd>lua vim.lsp.buf.signature_help()<CR>",
	options "Signature help"
)
buf_set_keymap(
	"n",
	"<leader>wa",
	"<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
	options "Add workspace folder"
)
buf_set_keymap(
	"n",
	"<leader>wr",
	"<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
	options "Remove workspace folder"
)
buf_set_keymap(
	"n",
	"<leader>wl",
	"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
	options "List workspace folders"
)
buf_set_keymap(
	"n",
	"<space>D",
	"<cmd>lua vim.lsp.buf.type_definition()<CR>",
	options "Gpto Type definition"
)
-- buf_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
buf_set_keymap("n", "<space>r", "<cmd>Lspsaga rename<CR>", options "Rename")
buf_set_keymap(
	"n",
	"<space>pr",
	"<cmd>Lspsaga rename ++project<CR>",
	options "Project rename"
)
buf_set_keymap(
	"n",
	"<space>pd",
	"<cmd>Lspsaga peek_definition<CR>",
	options "Peek definition"
)
-- buf_set_keymap('n', '<space>l', '<cmd>lua vim.diagnostic.show_line_diagnostics()<CR>', opts)
-- buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
-- buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
buf_set_keymap(
	"n",
	"<space>q",
	"<cmd>lua vim.diagnostic.setloclist()<CR>",
	options "Set loclist"
)

-- Few language severs support these three
buf_set_keymap(
	"n",
	"<leader>ai",
	"<cmd>lua vim.lsp.buf.incoming_calls()<CR>",
	options "Incoming calls"
)
buf_set_keymap(
	"n",
	"<leader>ao",
	"<cmd>lua vim.lsp.buf.outgoing_calls()<CR>",
	options "Outgoing Calls"
)
-- lsp provider to find the cursor word definition and reference
buf_set_keymap(
	"n",
	"gh",
	"<cmd>Lspsaga lsp_finder<CR>",
	options "Lspsaga Finder"
)
-- code action
buf_set_keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", options "Hover docs")
buf_set_keymap(
	"n",
	"<space>a",
	"<cmd>Lspsaga code_action<CR>",
	options "Code Action"
)
buf_set_keymap(
	"v",
	"<space>a",
	"<cmd>Lspsaga code_action<CR>",
	options "Code Action"
)
-- show
buf_set_keymap(
	"n",
	"<space>l",
	"<cmd>Lspsaga show_line_diagnostics<CR>",
	options "Show Line diagnostics"
)
-- only show diagnostic if cursor is over the area
buf_set_keymap(
	"n",
	"<space>c",
	"<cmd>Lspsaga show_cursor_diagnostics<CR>",
	options "Show cursor diagnostics"
)
buf_set_keymap(
	"n",
	"<leader>sb",
	"<cmd>Lspsaga show_buf_diagnostics<CR>",
	options "Show buffer diagnostics"
)
-- jump diagnostic
buf_set_keymap(
	"n",
	"[d",
	"<cmd>Lspsaga diagnostic_jump_prev<CR>",
	options "Jump to next diagnostic"
)
buf_set_keymap(
	"n",
	"]d",
	"<cmd>Lspsaga diagnostic_jump_next<CR>",
	options "Jump to prev diagnostic"
)
buf_set_keymap(
	"n",
	"<m-c-l>",
	"<cmd>lua vim.lsp.buf.format{async=false}<CR>",
	opts
)
buf_set_keymap(
	"v",
	"<m-c-l>",
	"<cmd>lua vim.lsp.buf.range_formatting()<CR>",
	opts
)
buf_set_keymap(
	"n",
	"<A-o>",
	"<Cmd>lua require'jdtls'.organize_imports()<CR>",
	options "Organizw imports"
)
buf_set_keymap(
	"n",
	"crv",
	"<Cmd>lua require'jdtls'.extract_variable()<CR>",
	options "Extract variable"
)
buf_set_keymap(
	"v",
	"crv",
	"<Esc><Cmd>lua require'jdtls'.extract_variable(true)<CR>",
	options "Extract variable"
)
buf_set_keymap(
	"n",
	"crc",
	"<Cmd>lua require'jdtls'.extract_constant()<CR>",
	options "Extract constant"
)
buf_set_keymap(
	"v",
	"crc",
	"<Esc><Cmd>lua require'jdtls'.extract_constant(true)<CR>",
	options "Extract constant"
)
buf_set_keymap(
	"v",
	"crm",
	"<Esc><Cmd>lua require'jdtls'.extract_method(true)<CR>",
	options "Extract method"
)

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require("jdtls").start_or_attach(config)
