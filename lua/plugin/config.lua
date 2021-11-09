local map = vim.api.nvim_set_keymap
----------------
--  floaterm  --
----------------
vim.g.floaterm_shell = "fish"
-- vim.g.floaterm_wintype = 'normal'
vim.cmd "let g:floaterm_rootmarkers = ['.project', '.vscode', '.idea', '.git', '.hg', '.svn', '.root', '.gitignore', '.CP']"
vim.g.floaterm_open_command = "vsplit"
vim.g.floaterm_keymap_new = "<Leader>ft"
vim.g.floaterm_keymap_prev = "<leader>fp"
vim.g.floaterm_keymap_next = "<leader>fn"
vim.g.floaterm_keymap_toggle = "<M-t>"
vim.g.floaterm_keymap_kill = "<leader>fk"

--------------------
--  nvim_comment  --
--------------------
-- require('nvim_comment').setup({comment_empty = false})
-- require('commented').setup()
-- map('n', '<c-_>', [[:Comment<cr><cr>]], {noremap = true})

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
vim.cmd "highlight CodiVirtualText guifg=cyan"
vim.cmd [[let g:codi#virtual_text_prefix = "❯ "]]

--------------------------------------------------------------------------------
--                                  LspSaga                                   --
--------------------------------------------------------------------------------
local saga = require "lspsaga"

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

saga.init_lsp_saga {
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
}

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
--                               nvim-colorizer                               --
--------------------------------------------------------------------------------
vim.cmd [[set termguicolors]]
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
vim.cmd [[
let g:vimade = {}
let g:vimade.fadelevel = 0.7
let g:vimade.enablesigns = 1
let g:vimade.enabletreesitter = 1

]]

---------------
--  minimap  --
---------------
vim.cmd [[
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
]]
