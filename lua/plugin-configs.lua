local map = vim.api.nvim_set_keymap
-----------------
--  undo-tree  --
-----------------
map("n", "<F7>", ":UndotreeToggle<cr>", { noremap = true })
vim.bo.undofile = true
vim.o.undodir = vim.fn.stdpath("data") .. "/shada/undo-dir"

-----------------
--  Ultisnips  --
-----------------
-- Trigger configuration. You need to change this to something other than <tab>
-- if you use one of completion plugins
vim.g.UltiSnipsExpandTrigger = "<c-l>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-j>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-k>"
vim.g.UltiSnipsEditSplit = "vertical"

----------------
--  vim-move  --
----------------
vim.g.move_key_modifier = "C"

------------------
--  easy-align  --
------------------
-- vimp.rbind('x', 'ga', '<Plug>(EasyAlign)')
-- vimp.rbind('n', 'ga', '<Plug>(EasyAlign)')
vim.cmd("nmap ga <Plug>(EasyAlign)")
vim.cmd("xmap ga <Plug>(EasyAlign)")

----------------
--  vim-stay  --
----------------
vim.cmd(":set viewoptions=cursor,folds,slash,unix")

----------------
--  FastFold  --
----------------
-- map('x', 'iz', ':<c-u>FastFoldUpdate<cr><esc>:<c-u>normal! ]zv[z<cr>', {noremap = true})
-- map('x', 'az', ':<c-u>FastFoldUpdate<cr><esc>:<c-u>normal! ]zV[z<cr>', {noremap = true})
-- vim.cmd("autocmd BufWinEnter * let b:nrrw_aucmd_create = \"let w:lastfdm = getwinvar(winnr('#'), 'lastfdm')\"")

----------------
--  vim-swap  --
----------------
vim.cmd("omap i, <Plug>(swap-textobject-i)")
vim.cmd("omap i, <Plug>(swap-textobject-i)")
vim.cmd("xmap i, <Plug>(swap-textobject-i)")
vim.cmd("omap a, <Plug>(swap-textobject-a)")
vim.cmd("xmap a, <Plug>(swap-textobject-a)")

------------------
--  vim-rooter  --
------------------
vim.cmd(
	"let g:rooter_patterns = ['.git', 'CMakeLists.txt', 'Makefile', '*.sln', '.idea', '.root', '.vim']"
)

---------------
--  matchup  --
---------------
vim.cmd("let g:matchup_matchparen_offscreen = {'method': 'popup'}")

------------------
--  simpylfold  --
------------------
-- vim.g.SimpylFold_docstring_preview = 1
-- vim.g.SimpylFold_fold_docstring = 0
-- vim.b.SimpylFold_fold_docstring = 0

----------------
--  floaterm  --
----------------
vim.g.floaterm_shell = "fish"
-- vim.g.floaterm_wintype = 'normal'
vim.cmd(
	"let g:floaterm_rootmarkers = ['.project', '.vscode', '.idea', '.git', '.hg', '.svn', '.root', '.gitignore', '.CP']"
)
vim.g.floaterm_open_command = "vsplit"
vim.g.floaterm_keymap_new = "<Leader>ft"
vim.g.floaterm_keymap_prev = "<leader>fp"
vim.g.floaterm_keymap_next = "<leader>fn"
vim.g.floaterm_keymap_toggle = "<M-t>"
vim.g.floaterm_keymap_kill = "<leader>fk"
-- Set floaterm window's background to black
-- hi Floaterm guibg=black
-- Set floating window border line color to cyan, and background to orange
-- hi FloatermBorder guibg=orange guifg=cyan
-- hi FloatermNC guibg=gray

----------
--  lf  --
----------
-- vimp.rbind('n', '<leader>lf', '<Plug>LfSplit')
vim.cmd("nmap <leader>lf <Plug>LfSplit")
---------------------
--  nvim-lsputils  --
---------------------
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

-----------------
--  dashboard  --
-----------------
vim.g.dashboard_custom_header = {
	"$$\\   $$\\ $$$$$$$$\\  $$$$$$\\  $$\\    $$\\ $$$$$$\\ $$\\      $$\\ ",
	"$$$\\  $$ |$$  _____|$$  __$$\\ $$ |   $$ |\\_$$  _|$$$\\    $$$ |",
	"$$$$\\ $$ |$$ |      $$ /  $$ |$$ |   $$ |  $$ |  $$$$\\  $$$$ |",
	"$$ $$\\$$ |$$$$$\\    $$ |  $$ |\\$$\\  $$  |  $$ |  $$\\$$\\$$ $$ |",
	"$$ \\$$$$ |$$  __|   $$ |  $$ | \\$$\\$$  /   $$ |  $$ \\$$$  $$ |",
	"$$ |\\$$$ |$$ |      $$ |  $$ |  \\$$$  /    $$ |  $$ |\\$  /$$ |",
	"$$ | \\$$ |$$$$$$$$\\  $$$$$$  |   \\$  /   $$$$$$\\ $$ | \\_/ $$ |",
	"\\__|  \\__|\\________| \\______/     \\_/    \\______|\\__|     \\__|",
}
vim.g.dashboard_default_executive = "telescope"

vim.g.dashboard_custom_section = {
	a = {
		description = { " Find File          " },
		command = "Telescope find_files",
	},
	b = {
		description = { " Recently Used Files" },
		command = "Telescope oldfiles",
	},
	c = {
		description = { " Load Last Session  " },
		command = "SessionLoad",
	},
	d = {
		description = { " Find Word          " },
		command = "Telescope live_grep",
	},
	e = {
		description = { " Marks              " },
		command = "Telescope marks",
	},
}
-- vim.cmd 'let g:dashboard_session_directory = "~/.config/lvim/.sessions"'
vim.cmd(
	"let packages = len(globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1))"
)
local time = vim.fn.localtime() - STime
local st = "let g:dashboard_custom_footer = ['NeoVim loaded '..packages..' plugins  in '.."
	.. time
	.. "..' seconds']"
-- vim.api.nvim_exec([[
-- let g:dashboard_custom_footer = ['NeoVim loaded '..packages..' plugins ']
-- ]], false)
vim.api.nvim_exec(st, false)

-- vim.g.dashboard_custom_shortcut = {
--     a = 'f',
--     find_word = 'SPC f a',
--     last_session = 'SPC s l',
--     new_file = 'SPC c n',
--     book_marks = 'SPC f b'
-- }
-- find_history = 'SPC f h',
vim.g.dashboard_session_directory = vim.fn.stdpath("cache") .. "/session"
map("n", "<leader>ss", ":<c-u>SessionSave<cr>", { noremap = true })
map("n", "<leader>sl", ":<c-u>SessionLoad<cr>", { noremap = true })
vim.cmd(
	"autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2"
)

--------------------
--  nvim_comment  --
--------------------
-- require('nvim_comment').setup({comment_empty = false})
-- require('commented').setup()
-- map('n', '<c-_>', [[:Comment<cr><cr>]], {noremap = true})

------------------
--  treesitter  --
------------------
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.org = {
	install_info = {
		url = "https://github.com/milisims/tree-sitter-org",
		revision = "main",
		files = { "src/parser.c", "src/scanner.cc" },
	},
	filetype = "org",
}

require("nvim-treesitter.configs").setup({
	-- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ensure_installed = {
		"c",
		"cpp",
		"java",
		"python",
		"json",
		"yaml",
		"vim",
		"org",
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		additional_vim_regex_highlighting = { "org" },
	},
	-- indent = {enable = true, disable = {"python", "html", "javascript"}},
	indent = { enable = { "javascriptreact" } },
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
	},
	autotag = { enable = true },
	rainbow = { enable = true },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
		config = { javascriptreact = { style_element = "{/* %s */}" } },
	},
	refactor = { highlight_definitions = { enable = true } },
})

------------------------
--  indent_blankline  --
------------------------
vim.g.indent_blankline_buftype_exclude = { "terminal" }
vim.g.indent_blankline_filetype_exclude = {
	"help",
	"startify",
	"dashboard",
	"packer",
	"neogitstatus",
	"qf",
}
vim.g.indent_blankline_char = "▏"
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_context_patterns = {
	"class",
	"return",
	"function",
	"method",
	"^if",
	"^while",
	"jsx_element",
	"^for",
	"^object",
	"^table",
	"block",
	"arguments",
	"if_statement",
	"else_clause",
	"jsx_element",
	"jsx_self_closing_element",
	"try_statement",
	"catch_clause",
	"import_statement",
	"operation_type",
}

--------------------------------------------------------------------------------
--                                    Codi                                    --
--------------------------------------------------------------------------------
-- change the color
vim.cmd("highlight CodiVirtualText guifg=cyan")
vim.cmd([[let g:codi#virtual_text_prefix = "❯ "]])

--------------------------------------------------------------------------------
--                                  LspSaga                                   --
--------------------------------------------------------------------------------
local saga = require("lspsaga")

-- add your config value here
-- default value
-- use_saga_diagnostic_sign = true
-- error_sign = '',
-- warn_sign = '',
-- hint_sign = '',
-- infor_sign = '',
-- dianostic_header_icon = '   ',
-- code_action_icon = ' ',
-- code_action_prompt = {
--   enable = true,
--   sign = true,
--   sign_priority = 20,
--   virtual_text = true,
-- },
-- finder_definition_icon = '  ',
-- finder_reference_icon = '  ',
-- max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
-- finder_action_keys = {
--   open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
-- },
-- code_action_keys = {
--   quit = 'q',exec = '<CR>'
-- },
-- rename_action_keys = {
--   quit = '<C-c>',exec = '<CR>'  -- quit can be a table
-- },
-- definition_preview_icon = '  '
-- 1: thin border | 2: rounded border | 3: thick border | 4: ascii border
-- border_style = 1
-- rename_prompt_prefix = '➤',
-- if you don't use nvim-lspconfig you must pass your server name and
-- the related filetypes into this table
-- like server_filetype_map = {metals = {'sbt', 'scala'}}
-- server_filetype_map = {}

saga.init_lsp_saga({
	error_sign = "",
	warn_sign = "",
	finder_action_keys = {
		open = "o",
		vsplit = "v",
		split = "s",
		quit = "q",
		scroll_down = "<C-f>",
		scroll_up = "<C-b>", -- quit can be a table
	},
})

--------------------------------------------------------------------------------
--                                lspkind-nvim                                --
--------------------------------------------------------------------------------
-- commented options are defaults
-- require('lspkind').init({
-- with_text = true,
-- symbol_map = {
--   Text = '',
--   Method = 'ƒ',
--   Function = '',
--   Constructor = '',
--   Variable = '',
--   Class = '',
--   Interface = 'ﰮ',
--   Module = '',
--   Property = '',
--   Unit = '',
--   Value = '',
--   Enum = '了',
--   Keyword = '',
--   Snippet = '﬌',
--   Color = '',
--   File = '',
--   Folder = '',
--   EnumMember = '',
--   Constant = '',
--   Struct = ''
-- },
-- })

--------------------------------------------------------------------------------
--                                 vim-vsnip                                  --
--------------------------------------------------------------------------------
-- Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
-- See https://github.com/hrsh7th/vim-vsnip/pull/50
map("n", "<M-s>", [[<Plug>(vsnip-select-text)]], { noremap = true })
map("x", "<M-s>", [[<Plug>(vsnip-select-text)]], { noremap = true })
map("n", "<M-S>", [[<Plug>(vsnip-cut-text)]], { noremap = true })
map("x", "<M-S>", [[<Plug>(vsnip-cut-text)]], { noremap = true })

--------------------------------------------------------------------------------
--                                  gitsigns                                  --
--------------------------------------------------------------------------------
require("gitsigns").setup({
	signs = {
		add = { hl = "GitSignsAdd", text = "+", linehl = "GitSignsAddLn" },
		change = {
			hl = "GitSignsChange",
			text = "~",
			linehl = "GitSignsChangeLn",
		},
		delete = {
			hl = "GitSignsDelete",
			text = "-",
			linehl = "GitSignsDeleteLn",
		},
		topdelete = {
			hl = "GitSignsDelete",
			text = "﫧",
			linehl = "GitSignsDeleteLn",
		},
		changedelete = {
			hl = "GitSignsChange",
			text = "*",
			linehl = "GitSignsChangeLn",
		},
	},
	numhl = true,
	linehl = false,
	keymaps = {
		-- Default keymap options
		noremap = true,
		buffer = true,
	},
	watch_gitdir = { interval = 50 },
	current_line_blame = true,
	sign_priority = 6,
	update_debounce = 20,
	status_formatter = nil, -- Use default
})

--------------------------------------------------------------------------------
--                               nvim-colorizer                               --
--------------------------------------------------------------------------------
vim.cmd([[set termguicolors]])
require("colorizer").setup()
-- require'colorizer'.setup({
--     RGB = true, -- #RGB hex codes
--     RRGGBB = true, -- #RRGGBB hex codes
--     RRGGBBAA = true, -- #RRGGBBAA hex codes
--     rgb_fn = true, -- CSS rgb() and rgba() functions
--     hsl_fn = true, -- CSS hsl() and hsla() functions
--     css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
--     css_fn = true -- Enable all CSS *functions*: rgb_fn, hsl_fn
-- })

--------------------------------------------------------------------------------
--                                buffer-line                                 --
--------------------------------------------------------------------------------
require("bufferline").setup({
	options = {
		view = "multiwindow",
		numbers = function(opts)
			return string.format("%s%s", opts.id, opts.raise(opts.ordinal))
		end,
		middle_mouse_command = "bdelete %d",
		right_mouse_command = "vertical sbuffer %d",
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is deduplicated
		tab_size = 18,
		diagnostics = "nvim_lsp",
		---@diagnostic disable-next-line: unused-local
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			if context.buffer:current() then
				return ""
			end
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " "
					or (e == "warning" and " " or "ℹ️")
				s = s .. n .. sym
			end
			return s
		end,
		-- NOTE: this will be called a lot so don't do any heavy processing here
		custom_filter = function(buf_number)
			-- filter out filetypes you don't want to see
			if vim.bo[buf_number].filetype ~= "dashboard" then
				return true
			end
			-- filter out by buffer name
			if vim.fn.bufname(buf_number) ~= "<nvimtree>" then
				return true
			end
			-- filter out based on arbitrary rules
			-- just return true if want to disable
		end,
		show_buffer_close_icons = true,
		show_close_icon = false,
		show_tab_indicators = true,
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		-- can also be a table containing 2 custom separators
		-- [focused and unfocused]. eg: { '|', '|' }
		separator_style = "slant",
		enforce_regular_tabs = false,
		always_show_bufferline = true,
		sort_by = "relative_directory",

		custom_areas = {
			right = function()
				local result = {}
				local error = vim.lsp.diagnostic.get_count(0, [[Error]])
				local warning = vim.lsp.diagnostic.get_count(0, [[Warning]])
				local info = vim.lsp.diagnostic.get_count(0, [[Information]])
				local hint = vim.lsp.diagnostic.get_count(0, [[Hint]])

				if error ~= 0 then
					table.insert(
						result,
						{ text = "  " .. error, guifg = "#EC5241" }
					)
				end

				if warning ~= 0 then
					table.insert(
						result,
						{ text = "  " .. warning, guifg = "#EFB839" }
					)
				end

				if hint ~= 0 then
					table.insert(
						result,
						{ text = "  " .. hint, guifg = "#A3BA5E" }
					)
				end

				if info ~= 0 then
					table.insert(
						result,
						{ text = "  " .. info, guifg = "#7EA9A7" }
					)
				end
				return result
			end,
		},
	},
})

------------------
--  vimspector  --
------------------
-- vim.cmd([[let g:vimspector_base_dir='/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vimspector']])
-- map('n', '<leader>dd', '<cmd>call vimspector#Launch()<CR>', {noremap = true})
-- map('n', '<leader>de', '<cmd>VimspectorReset<CR>', {noremap = true})
-- map('n', '<leader>cc', '<cmd>call vimspector#Continue()<CR>', {noremap = true})
-- map('n', '<leader>ds', '<cmd>call vimspector#Stop()<CR>', {noremap = true})
-- map('n', '<leader>dr', '<cmd>call vimspector#Restart()<CR>', {noremap = true})
-- map('n', '<leader>dp', '<cmd>call vimspector#Pause()<CR>', {noremap = true})
-- vimp.rbind('n', '<leader>db', '<Plug>VimspectorToggleBreakpoint')
-- vimp.rbind('n', '<leader>db', '<Plug>VimspectorToggleBreakpoint')
-- map('n', '<space>db', '<cmd>call vimspector#ToggleBreakpoint()<CR>',{noremap = true})
-- map('n', '<space>cb', '<cmd>call vimspector#ToggleConditionalBreakpoint()<CR>',{noremap = true})
-- map('n', '<space>fb', '<cmd>call vimspector#AddFunctionBreakpoint()<CR>',{noremap = true})
-- map('n', '<leader>drc', '<cmd>call vimspector#RunToCursor()<CR>', {noremap = true})
-- map('n', '<leader>l', '<cmd>call vimspector#StepOver()<CR>', {noremap = true})
-- map('n', '<leader>j', '<cmd>call vimspector#StepInto()<CR>', {noremap = true})
-- map('n', '<leader>k', '<cmd>call vimspector#StepOout()<CR>', {noremap = true})

----------------
-- Shade.vim  --
----------------
-- require'shade'.setup({
-- overlay_opacity = 50,
-- opacity_step = 1,
-- keys = {
-- toggle           = '<Leader>s',
-- }
-- })

--------------------
--  gesture.nvim  --
--------------------
-- vim.cmd [[nnoremap <silent> <LeftDrag> <Cmd>lua require("gesture").draw()<CR>]]
-- vim.cmd [[nnoremap <silent> <LeftRelease> <Cmd>lua require("gesture").finish()<CR>]]
-- local gesture = require('gesture')
-- gesture.register({name = "scroll to bottom", inputs = {gesture.up(), gesture.down()}, action = "normal! G"})
-- gesture.register({name = "next tab", inputs = {gesture.right()}, action = "tabnext"})
-- gesture.register({
--     name = "previous tab",
--     inputs = {gesture.left()},
--     action = function(ctx) -- also can use function
--         vim.cmd("tabprevious")
--     end
-- })
-- gesture.register({
--     name = "go back",
--     inputs = {gesture.right(), gesture.left()},
--     -- map to `<C-o>` keycode
--     action = [[lua vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-o>", true, false, true), "n", true)]]
-- })

--------------
--  vimade  --
--------------
vim.cmd([[
let g:vimade = {}
let g:vimade.fadelevel = 0.7
let g:vimade.enablesigns = 1
let g:vimade.enabletreesitter = 1

]])

---------------
--  minimap  --
---------------
vim.cmd([[
let g:minimap_auto_start = 0
"let g:minimap_block_filetypes = ['fugitive', 'nerdtree', 'tagbar', 'undotree', 'telescope', 'dashboard']
"let g:minimap_block_buftypes = ['nofile', 'nowrite', 'quickfix', 'terminal', 'prompt', 'telescope']
let g:minimap_close_filetypes = ['startify', 'netrw', 'vim-plug', 'packer']
let g:minimap_highlight_range = 1
let g:minimap_git_colors = 1
let g:minimap_highlight_search = 1
let g:minimap_cursor_color_priority = 100
let g:minimap_git_color_priority = 110
nnoremap <silent> `` :nohlsearch<CR>:call minimap#vim#ClearColorSearch()<CR>
]])
