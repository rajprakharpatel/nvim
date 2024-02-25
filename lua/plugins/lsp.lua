return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"cmp-nvim-lsp",
			{ "b0o/SchemaStore.nvim" },
			{
				"nvimtools/none-ls.nvim",
				dependencies = {
					"gitsigns.nvim",
				},
			},
			{ "ray-x/lsp_signature.nvim" },
		},
		config = function()
			-- print("loading lsp's ...")
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
			capabilities.offsetEncoding = { "utf-16" }
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			capabilities.textDocument.completion.completionItem.resolveSupport = {
				properties = { "documentation", "detail", "additionalTextEdits" },
			}
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			local nvim_lsp = require "lspconfig"
			local common_on_attach = function(client, bufnr)
				require("lsp_signature").on_attach()

				local function buf_set_keymap(...)
					vim.api.nvim_buf_set_keymap(bufnr, ...)
				end

				local function buf_set_option(...)
					vim.api.nvim_buf_set_option(bufnr, ...)
				end

				local function options(desc)
					return {
						desc = desc,
						noremap = true,
						silent = true,
					}
				end

				buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

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
				buf_set_keymap(
					"n",
					"<space>r",
					"<cmd>Lspsaga rename<CR>",
					options "Rename"
				)
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
				buf_set_keymap(
					"n",
					"K",
					"<cmd>Lspsaga hover_doc<CR>",
					options "Hover docs"
				)
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
				-- Set some keybinds conditional on server capabilities
				--[[vim.cmd [[
				augroup LspFormatting
					autocmd! * <buffer>
					autocmd BufWritePre <buffer> lua vim.lsp.buf.format{async=false}
				augroup END
				--]]
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

				-- Set autocommands conditional on server_capabilities
				if client.server_capabilities.document_highlight then
					print "LSP server has document_highlight"
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
				"astro",
				"tailwindcss",
				"html",
				"cssls",
				"emmet_language_server",
				"gopls",
			}
			for _, lsp in ipairs(servers) do
				nvim_lsp[lsp].setup {
					on_attach = common_on_attach,
					capabilities = capabilities,
				}
			end

			--------------------------------------------------------------------------------
			--                                   bashls                                   --
			--------------------------------------------------------------------------------

			nvim_lsp.bashls.setup {
				cmd = { "bash-language-server", "start" },
				on_attach = common_on_attach,
			}

			--------------------------------------------------------------------------------
			--                                 sqlls.nvim                                  --
			--------------------------------------------------------------------------------
			nvim_lsp.sqlls.setup {
				root_dir = function()
					return vim.fn.getcwd()
				end
			}

			--------------------------------------------------------------------------------
			--                              jsonls      								                  --
			--------------------------------------------------------------------------------
			nvim_lsp.jsonls.setup {
				cmd = {
					"vscode-json-languageserver",
					"--stdio",
				},
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
			--                                  html                                      --
			--------------------------------------------------------------------------------
			nvim_lsp.html.setup {
				cmd = {
					"vscode-html-languageserver",
					"--stdio",
				},
				init_options = { documentFormatting = true },
				on_attach = common_on_attach,
				capabilities = capabilities,
			}

			--------------------------------------------------------------------------------
			--                                  cssls                                     --
			--------------------------------------------------------------------------------
			nvim_lsp.cssls.setup {
				cmd = {
					"vscode-css-languageserver",
					"--stdio",
				},
				init_options = { documentFormatting = true },
				on_attach = common_on_attach,
				capabilities = capabilities,
			}

			--------------------------------------------------------------------------------
			--										  groovy-language-server																--
			--------------------------------------------------------------------------------
			nvim_lsp.groovyls.setup {
				-- Unix
				cmd = {
					"java",
					"-jar",
					"/usr/share/java/groovyls/groovy-language-server-all.jar",
				},
			}

			--------------------------------------------------------------------------------
			--                              null-ls.nvim																  --
			--------------------------------------------------------------------------------
			local null_ls = require "null-ls"
			local sources = {
				-- null_ls.builtins.formatting.prettier,
				-- null_ls.builtins.formatting.rustfmt,
				null_ls.builtins.diagnostics.shellcheck,
				null_ls.builtins.formatting.shfmt.with {
					extra_args = { "-i", "2", "-ci" },
				},
				-- null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.formatting.fish_indent,
				null_ls.builtins.diagnostics.write_good,
				-- null_ls.builtins.code_actions.gitsigns,
				-- null_ls.builtins.diagnostics.eslint,
				-- null_ls.builtins.diagnostics.luacheck,
				null_ls.builtins.formatting.stylua,
			}
			require("null-ls").setup {
				sources = sources,
				on_attach = common_on_attach,
				capabilities = capabilities,
			}
			-- require("lspconfig")["null-ls"].setup {
			-- 	on_attach = on_attach,
			-- 	capabilities = capabilities,
			-- }
		end,
	},
	{
		"glepnir/lspsaga.nvim",
		event = "BufRead",
		opts = {
			ui = {
				-- Border type can be single, double, rounded, solid, shadow.
				border = "rounded",
			},
			beacon = {
				enable = false,
			},
			outline = {
				show_detail = true,
				auto_preview = true,
				auto_refresh = true,
				auto_close = true,
				keys = {
					jump = "<CR>",
					expand_collapse = "<TAB>",
					quit = "q",
				},
			},
			callhierarchy = {
				show_detail = true,
				keys = {
					edit = "<CR>",
					vsplit = "v",
					split = "s",
					tabe = "t",
					jump = "o",
					quit = "q",
					expand_collapse = "<TAB>",
				},
			},
			lightbulb = {
				enable_in_insert = false,
			},
			rename = {
				quit = "<C-c>",
				exec = "<CR>",
				mark = "<space>",
				confirm = "<CR>",
				in_select = true,
			},
			code_action = {
				show_server_name = true,
				extend_gitsigns = false,
				keys = {
					-- string | table type
					quit = "q",
					exec = "<CR>",
				},
			},
		},
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			--Please make sure you install markdown and markdown_inline parser
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
	{
		"olrtg/nvim-emmet",
		config = function()
			vim.keymap.set({ "n", "v" }, '<leader>xe', require('nvim-emmet').wrap_with_abbreviation)
		end,
	},
}
