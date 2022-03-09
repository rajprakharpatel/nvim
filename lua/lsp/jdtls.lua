local M = {}
M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { "documentation", "detail", "additionalTextEdits" },
}
function M.setup()
	local on_attach = function(client, bufnr)
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

		require("jdtls.setup").add_commands()
		require("jdtls").setup_dap()

		require("formatter").setup {
			filetype = {
				java = {
					function()
						return {
							exe = "google-java-format",
							args = {
								vim.api.nvim_buf_get_name(0),
							},
							stdin = true,
						}
					end,
				},
			},
		}

		vim.api.nvim_exec(
			[[
        augroup FormatAutogroup
          autocmd!
          autocmd BufWritePost *.java FormatWrite
        augroup end
      ]],
			true
		)

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
		buf_set_keymap(
			"n",
			"<space>D",
			"<cmd>lua vim.lsp.buf.type_definition()<CR>"
		)
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
		buf_set_keymap(
			"n",
			"<leader>ai",
			"<cmd>lua vim.lsp.buf.incoming_calls()<CR>"
		)
		buf_set_keymap(
			"n",
			"<leader>ao",
			"<cmd>lua vim.lsp.buf.outgoing_calls()<CR>"
		)
		-- Diagnostics mapping
		-- buf_set_keymap('n', '<space>l', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
		buf_set_keymap(
			"n",
			"<space>l",
			[[<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>]]
		)
		buf_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.set_loclist()<cr>")
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
		vim.api.nvim_exec(
			[[
          hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
          hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
          hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
          augroup lsp_document_highlight
            autocmd!
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
          augroup END
      ]],
			false
		)
	end

	local root_markers = { "gradlew", "pom.xml" }
	local root_dir = require("jdtls.setup").find_root(root_markers)
	local home = os.getenv "HOME"

	local capabilities = {
		workspace = {
			configuration = true,
		},
		textDocument = {
			completion = {
				completionItem = {
					snippetSupport = true,
				},
			},
		},
	}

	local workspace_folder = home
		.. "/.workspace/"
		.. vim.fn.fnamemodify(root_dir, ":p:h:t")
	local config = {
		flags = {
			allow_incremental_sync = true,
		},
		capabilities = capabilities,
		on_attach = on_attach,
	}

	config.settings = {
		["java.format.settings.url"] = home
			.. "/.config/nvim/language-servers/java-google-formatter.xml",
		["java.format.settings.profile"] = "GoogleStyle",
		java = {
			signatureHelp = { enabled = true },
			contentProvider = { preferred = "fernflower" },
			completion = {
				favoriteStaticMembers = {
					"org.hamcrest.MatcherAssert.assertThat",
					"org.hamcrest.Matchers.*",
					"org.hamcrest.CoreMatchers.*",
					"org.junit.jupiter.api.Assertions.*",
					"java.util.Objects.requireNonNull",
					"java.util.Objects.requireNonNullElse",
					"org.mockito.Mockito.*",
				},
			},
			sources = {
				organizeImports = {
					starThreshold = 9999,
					staticStarThreshold = 9999,
				},
			},
			codeGeneration = {
				toString = {
					template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
				},
			},
			configuration = {
				runtimes = {
					{
						name = "JavaSE-11",
						path = home .. "/.sdkman/candidates/java/11.0.10-open/",
					},
					{
						name = "JavaSE-14",
						path = home .. "/.sdkman/candidates/java/14.0.2-open/",
					},
					{
						name = "JavaSE-15",
						path = home .. "/.sdkman/candidates/java/15.0.1-open/",
					},
				},
			},
		},
	}
	config.cmd = { "jdtls", "-data", workspace_folder }
	config.on_attach = on_attach
	config.on_init = function(client, _)
		client.notify(
			"workspace/didChangeConfiguration",
			{ settings = config.settings }
		)
	end

	-- local jar_patterns = {
	--     '/dev/microsoft/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar',
	--     '/dev/dgileadi/vscode-java-decompiler/server/*.jar',
	--     '/dev/microsoft/vscode-java-test/server/*.jar',
	-- }

	-- local bundles = {}
	-- for _, jar_pattern in ipairs(jar_patterns) do
	--   for _, bundle in ipairs(vim.split(vim.fn.glob(home .. jar_pattern), '\n')) do
	--     if not vim.endswith(bundle, 'com.microsoft.java.test.runner.jar') then
	--       table.insert(bundles, bundle)
	--     end
	--   end
	-- end

	local extendedClientCapabilities = require("jdtls").extendedClientCapabilities
	extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
	config.init_options = {
		-- bundles = bundles;
		extendedClientCapabilities = extendedClientCapabilities,
	}

	-- UI
	local finders = require "telescope.finders"
	local sorters = require "telescope.sorters"
	local actions = require "telescope.actions"
	local pickers = require "telescope.pickers"
	require("jdtls.ui").pick_one_async = function(items, prompt, label_fn, cb)
		local opts = {}
		pickers.new(opts, {
			prompt_title = prompt,
			finder = finders.new_table {
				results = items,
				entry_maker = function(entry)
					return {
						value = entry,
						display = label_fn(entry),
						ordinal = label_fn(entry),
					}
				end,
			},
			sorter = sorters.get_generic_fuzzy_sorter(),
			attach_mappings = function(prompt_bufnr)
				actions.goto_file_selection_edit:replace(function()
					local selection = actions.get_selected_entry(prompt_bufnr)
					actions.close(prompt_bufnr)

					cb(selection.value)
				end)

				return true
			end,
		}):find()
	end

	-- Server
	require("jdtls").start_or_attach(config)
end

return M
