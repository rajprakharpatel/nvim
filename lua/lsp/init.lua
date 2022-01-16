vim.fn.sign_define("LspDiagnosticsSignError", {
	texthl = "LspDiagnosticsSignError",
	text = "",
	numhl = "LspDiagnosticsSignError",
})
vim.fn.sign_define("LspDiagnosticsSignWarning", {
	texthl = "LspDiagnosticsSignWarning",
	text = "",
	numhl = "LspDiagnosticsSignWarning",
})
vim.fn.sign_define("LspDiagnosticsSignHint", {
	texthl = "LspDiagnosticsSignHint",
	text = "",
	numhl = "LspDiagnosticsSignHint",
})
vim.fn.sign_define("LspDiagnosticsSignInformation", {
	texthl = "LspDiagnosticsSignInformation",
	text = "",
	numhl = "LspDiagnosticsSignInformation",
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { "documentation", "detail", "additionalTextEdits" },
}
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local nvim_lsp = require "lspconfig"
local on_attach = function(client, bufnr)
	require("lsp_signature").on_attach()

	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }
	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	-- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap(
		"n",
		"K",
		[[<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]],
		opts
	)
	buf_set_keymap("n", "<c-b>", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	-- buf_set_keymap('n', '<space>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap(
		"n",
		"<space>k",
		[[<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>]],
		opts
	)
	buf_set_keymap(
		"n",
		"<leader>wa",
		"<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
		opts
	)
	buf_set_keymap(
		"n",
		"<leader>wr",
		"<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
		opts
	)
	buf_set_keymap(
		"n",
		"<leader>wl",
		"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
		opts
	)
	buf_set_keymap(
		"n",
		"<space>D",
		"<cmd>lua vim.lsp.buf.type_definition()<CR>",
		opts
	)
	-- buf_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap(
		"n",
		"<space>r",
		[[<cmd>lua require('lspsaga.rename').rename()<CR>]],
		opts
	)
	-- buf_set_keymap('n', '<space>l', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	-- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	-- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	buf_set_keymap(
		"n",
		"<space>q",
		"<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>",
		opts
	)

	-- Few language severs support these three
	buf_set_keymap(
		"n",
		"<leader>ai",
		"<cmd>lua vim.lsp.buf.incoming_calls()<CR>",
		opts
	)
	buf_set_keymap(
		"n",
		"<leader>ao",
		"<cmd>lua vim.lsp.buf.outgoing_calls()<CR>",
		opts
	)
	-- lsp provider to find the cursor word definition and reference
	buf_set_keymap(
		"n",
		"gh",
		[[<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>]],
		opts
	)
	-- code action
	buf_set_keymap(
		"n",
		"<space>a",
		[[<cmd>lua require('lspsaga.codeaction').code_action()<CR>]],
		opts
	)
	buf_set_keymap(
		"v",
		"<space>a",
		[[<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>]],
		opts
	)
	-- scroll down hover doc or scroll in definition preview
	-- buf_set_keymap('n', '<C-f>', [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]], opts)
	-- scroll up hover doc
	-- buf_set_keymap('n', '<C-b>', [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]], opts)
	-- preview definition
	buf_set_keymap(
		"n",
		"<space>pd",
		[[<cmd>lua require'lspsaga.provider'.preview_definition()<CR>]],
		opts
	)
	-- show
	buf_set_keymap(
		"n",
		"<space>l",
		[[<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>]],
		opts
	)
	-- only show diagnostic if cursor is over the area
	buf_set_keymap(
		"n",
		"<space>c",
		[[<cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>]],
		opts
	)
	-- jump diagnostic
	buf_set_keymap("n", "[d", [[<cmd>:Lspsaga diagnostic_jump_prev<CR>]], opts)
	buf_set_keymap("n", "]d", [[<cmd>Lspsaga diagnostic_jump_next<CR>]], opts)
	-- Set some keybinds conditional on server capabilities
	if client.resolved_capabilities.document_formatting then
		buf_set_keymap(
			"n",
			"<m-c-l>",
			"<cmd>lua vim.lsp.buf.formatting()<CR>",
			opts
		)
	elseif client.resolved_capabilities.document_range_formatting then
		buf_set_keymap(
			"v",
			"<m-c-l>",
			"<cmd>lua vim.lsp.buf.range_formatting()<CR>",
			opts
		)
	end

	-- Set autocommands conditional on server_capabilities
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
			false
		)
	end
end
-- Register configs for installed servers in lspconfig.
-- require'lspinstall'.setup()
-- Get list of installed servers and then setup each
-- server with lspconfig as usual.
-- local servers = require'lspinstall'.installed_servers()
-- for _, server in pairs(servers) do
--   require'lspconfig'[server].setup{}
-- end
-- Use a loop to conveniently both setup defined serversw
-- and map buffer local keybindings when the language server attaches
local servers = {
	"clangd",
	"cmake",
	"pylsp",
	"vimls",
	"tsserver",
	"html",
	"cssls",
}
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup { on_attach = on_attach, capabilities = capabilities }
end

--------------------------------------------------------------------------------
--                         lua for plugin development                         --
--------------------------------------------------------------------------------

local luadev = require("lua-dev").setup {
	library = { vimruntime = true, types = true, plugins = true },
	lspconfig = {
		capabilities = capabilities,
		on_attach = on_attach,
		cmd = {
			"/usr/bin/lua-language-server",
			"-E",
			"/usr/share/lua-language-server/main.lua",
		},
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
					-- Setup your lua path
					path = vim.split(package.path, ";"),
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = {
						[vim.fn.expand "$VIMRUNTIME/lua"] = true,
						[vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
					},
				},
			},
		},
	},
}
nvim_lsp.sumneko_lua.setup(luadev)

--------------------------------------------------------------------------------
--                                   bashls                                   --
--------------------------------------------------------------------------------

nvim_lsp.bashls.setup {
	cmd = { "bash-language-server", "start" },
	on_attach = on_attach,
}

--------------------------------------------------------------------------------
--                                 sqls.nvim                                  --
--------------------------------------------------------------------------------
require("lspconfig").sqls.setup {
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		client.resolved_capabilities.execute_command = true

		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end

		buf_set_keymap(
			"n",
			"<m-l>",
			"<plug>(sqls-execute-query)jj",
			{ silent = true }
		)
		buf_set_keymap(
			"n",
			"<s-m-l>",
			"<cmd>SqlsExecuteQuery<CR>",
			{ silent = true }
		)
		-- connections config in ~/.config/sqls/config.yml
		require("sqls").setup {
			picker = "telescope",
			-- settings = {
			-- sqls = {connections = {{driver = 'mysql', dataSourceName = 'world:rajp@tcp(127.0.0.1:3306)/world'}}}
			-- }
		}
	end,
}
--------------------------------------------------------------------------------
--                              emmet-ls      								  --
--------------------------------------------------------------------------------
require("lspconfig").emmet_ls.setup {
	filetypes = {
		"html",
		"css",
		"scss",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"haml",
		"xml",
		"xsl",
		"pug",
		"slim",
		"sass",
		"stylus",
		"less",
		"sss",
	},
	root_dir = function()
		return vim.loop.cwd()
	end,
	capabilities = capabilities,
}

--------------------------------------------------------------------------------
--                              jsonls      								  --
--------------------------------------------------------------------------------
nvim_lsp.jsonls.setup {
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
		},
	},
	commands = {
		Format = {
			function()
				vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
			end,
		},
	},
	capabilities = capabilities,
}

--------------------------------------------------------------------------------
--                              null-ls.nvim								  --
--------------------------------------------------------------------------------
local null_ls = require "null-ls"

local sources = {
	null_ls.builtins.formatting.prettier,
	null_ls.builtins.formatting.rustfmt,
	null_ls.builtins.diagnostics.shellcheck,
	null_ls.builtins.formatting.shfmt.with {
		extra_args = { "-i", "2", "-ci" },
	},
	null_ls.builtins.diagnostics.eslint_d,
	null_ls.builtins.formatting.fish_indent,
	null_ls.builtins.diagnostics.write_good,
	null_ls.builtins.code_actions.gitsigns,
	null_ls.builtins.diagnostics.eslint,
	null_ls.builtins.diagnostics.luacheck,
	null_ls.builtins.formatting.stylua,
}
require("null-ls").setup {
	sources = sources,
}
-- require("lspconfig")["null-ls"].setup {
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- }
