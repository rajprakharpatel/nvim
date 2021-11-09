------------------
--  nvim-compe  --
------------------
local map = vim.api.nvim_set_keymap
vim.cmd("set shortmess+=c")

map(
	"i",
	"<c-Space>",
	"compe#complete()",
	{ noremap = true, silent = true, expr = true }
)
map(
	"i",
	"<c-e>",
	"compe#close('<C-e>')",
	{ noremap = true, silent = true, expr = true }
)
-- map('i', '<cr>', 'compe#confirm({ \'keys\': "\\<Plug>delimitMateCR", \'mode\': \'\' })',
-- {noremap = true, silent = true, expr = true})
map(
	"i",
	"<cr>",
	[[compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))]],
	{ noremap = true, silent = true, expr = true }
)
map(
	"i",
	"<c-f>",
	"compe#scroll({ 'delta': +4 })",
	{ noremap = true, silent = true, expr = true }
)
map(
	"i",
	"<c-d>",
	"compe#scroll({ 'delta': -4 })",
	{ noremap = true, silent = true, expr = true }
)

-- To make <cr> select the first completion item and confirm the completion when no item has been selected:
vim.cmd(
	"inoremap <expr> <cr> pumvisible() ? compe#confirm({'keys': \"\\<C-n>\\<cr>\", 'mode': '' }) :\"\\<C-g>u\\<CR>\""
)

vim.o.completeopt = "menuone,noselect"

require("compe").setup({
	enabled = true,
	autocomplete = true,
	debug = false,
	-- min_length = 1;
	preselect = "enable",
	throttle_time = 80,
	source_timeout = 100,
	incomplete_delay = 400,
	max_abbr_width = 100,
	max_kind_width = 100,
	max_menu_width = 100,
	documentation = {
		border = { "", "", "", " ", "", "", "", " " }, -- the border option is the same as `|help nvim_open_win|`
		winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
		max_width = 120,
		min_width = 60,
		max_height = math.floor(vim.o.lines * 0.3),
		min_height = 1,
	},

	source = {
		path = { kind = "  " },
		buffer = { kind = "  " },
		calc = { kind = "  " },
		vsnip = { kind = "  ", priority = 9 },
		nvim_lsp = { priority = 9, kind = "  " },
		nvim_lua = { kind = "  " },
		spell = { kind = "  " },
		tags = false,
		tabnine = { max_line = 1000, max_num_results = 6, priority = 8 },
		ultisnips = { priority = 9, kind = "  " },
		snippets_nvim = { kind = "  " },
		treesitter = { kind = "  " },
		emoji = { kind = " ﲃ " },
		orgmode = true,
		-- for emoji press : (idk if that in compe tho)
	},
})
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- ﬘
-- 
-- 
-- 
-- m
-- 
-- 
-- 
-- 

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
	local col = vim.fn.col(".") - 1
	if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
		return true
	else
		return false
	end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t("<C-n>")
	elseif vim.fn.call("vsnip#available", { 1 }) == 1 then
		return t("<Plug>(vsnip-expand-or-jump)")
	elseif check_back_space() then
		return t("<Tab>")
	else
		return vim.fn["compe#complete"]()
	end
end
_G.s_tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t("<C-p>")
	elseif vim.fn.call("vsnip#jumpable", { -1 }) == 1 then
		return t("<Plug>(vsnip-jump-prev)")
	else
		return t("<S-Tab>")
	end
end

map("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
map("s", "<Tab>", "v:lua.tab_complete()", { expr = true })
map("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
map("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
