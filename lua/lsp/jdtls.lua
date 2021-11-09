local M = {}
M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { "documentation", "detail", "additionalTextEdits" },
}
function M.on_attach(client, bufnr)
	vim.fn.sign_define("LspDiagnosticsSignError", {
		texthl = "LspDiagnosticsSignError",
		text = "❌",
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

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
	buf_set_option("shiftwidth", 4)
	buf_set_option("softtabstop", 4)
	-- vim.cmd [[set softtabstop=4]]
	-- vim.cmd [[set shiftwidth=4]]
	-- vim.cmd[[set noexpandtab]]
	-- require('jdtls').start_or_attach({cmd = {'launch_jdtls', vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t') .. 'jdtls'}})
	-- Utility servers
	local buf_set_keymap = function(type, key, value)
		vim.api.nvim_buf_set_keymap(
			0,
			type,
			key,
			value,
			{ noremap = true, silent = true }
		)
	end
	-- GOTO mappings
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
	buf_set_keymap("n", "<C-b>", "<cmd>lua vim.lsp.buf.references()<CR>")
	buf_set_keymap("n", "<space>k", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
	buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
	buf_set_keymap(
		"n",
		"<leader>ds",
		"<cmd>lua vim.lsp.buf.document_symbol()<CR>"
	)
	buf_set_keymap(
		"n",
		"<leader>ws",
		"<cmd>lua vim.lsp.buf.workspace_symbol()<CR>"
	)
	buf_set_keymap(
		"n",
		"gh",
		[[<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>]]
	)
	-- ACTION mappings
	buf_set_keymap("n", "<space>a", '<cmd>lua require"jdtls".code_action()<CR>')
	-- buf_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.buf.rename()<CR>')
	buf_set_keymap(
		"n",
		"<space>r",
		[[<cmd>lua require('lspsaga.rename').rename()<CR>]]
	)
	-- Few language severs support these three
	buf_set_keymap("n", "<c-a-l>", "<cmd>lua vim.lsp.buf.formatting()<CR>")
	buf_set_keymap("n", "<leader>ai", "<cmd>lua vim.lsp.buf.incoming_calls()<CR>")
	buf_set_keymap("n", "<leader>ao", "<cmd>lua vim.lsp.buf.outgoing_calls()<CR>")
	-- Diagnostics mapping
	-- buf_set_keymap('n', '<space>l', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
	buf_set_keymap(
		"n",
		"<space>l",
		[[<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>]]
	)
	buf_set_keymap(
		"n",
		"<space>q",
		"<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>"
	)
	buf_set_keymap(
		"n",
		"[d",
		[[<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>]]
	)
	buf_set_keymap(
		"n",
		"]d",
		[[<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>]]
	)
	buf_set_keymap(
		"n",
		"<C-f>",
		[[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]]
	)
	-- scroll up hover doc
	buf_set_keymap(
		"n",
		"<C-b>",
		[[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]]
	)
	-- preview definition
	buf_set_keymap(
		"n",
		"<space>pd",
		[[<cmd>lua require'lspsaga.provider'.preview_definition()<CR>]]
	)
	-- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
	-- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')

	buf_set_keymap(
		"n",
		[[<leader>oi]],
		[[<Cmd>lua require('jdtls').organize_imports()<CR>]]
	)
	buf_set_keymap(
		"n",
		[[<leader>ev]],
		[[<Cmd>lua require('jdtls').extract_variable()<CR>]]
	)
	buf_set_keymap(
		"v",
		[[<leader>ev]],
		[[<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>]]
	)
	buf_set_keymap(
		"v",
		[[<leader>em]],
		[[<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>]]
	)
	-- buf_set_keymap('n', [[<leader>aR]], [[<Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>]])

	local jdtls_ui = require "jdtls.ui"
	function jdtls_ui.pick_one_async(items, _, _, cb)
		require("lsputil.codeAction").code_action_handler(
			nil,
			nil,
			items,
			nil,
			nil,
			nil,
			cb
		)
	end
	vim.cmd [[command! -buffer JdtCompile lua require('jdtls').compile()]]
	vim.cmd [[command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()]]
	vim.cmd [[command! -buffer JdtJol lua require('jdtls').jol()]]
	vim.cmd [[command! -buffer JdtBytecode lua require('jdtls').javap()]]
	vim.cmd [[command! -buffer JdtJshell lua require('jdtls').jshell()]]
	vim.g.lsp_utils_location_opts = {
		height = 24,
		mode = "split",
		list = { border = true, numbering = true },
		preview = { title = "Location Preview", border = true },
	}

	vim.g.lsp_utils_symbols_opts = {
		height = 24,
		mode = "editor",
		list = { border = true, numbering = false },
		preview = { title = "Symbols Preview", border = true },
		prompt = {},
	}
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
	vim.lsp.handlers["textDocument/codeAction"] =
		require("lsputil.codeAction").code_action_handler
	vim.lsp.handlers["textDocument/references"] =
		require("lsputil.locations").references_handler
	vim.lsp.handlers["textDocument/definition"] =
		require("lsputil.locations").definition_handler
	vim.lsp.handlers["textDocument/declaration"] =
		require("lsputil.locations").declaration_handler
	vim.lsp.handlers["textDocument/typeDefinition"] =
		require(
			"lsputil.locations"
		).typeDefinition_handler
	vim.lsp.handlers["textDocument/implementation"] =
		require(
			"lsputil.locations"
		).implementation_handler
	vim.lsp.handlers["textDocument/documentSymbol"] =
		require("lsputil.symbols").document_handler
	vim.lsp.handlers["workspace/symbol"] =
		require("lsputil.symbols").workspace_handler
end
return M
-- vim.cmd([[
-- if has('nvim-0.5')
-- augroup lsp
-- au!
-- au FileType java lua require('jdtls').start_or_attach({cmd = {'launch_jdtls'}})
-- augroup end
-- endif
-- ]])
