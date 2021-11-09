local map = vim.api.nvim_set_keymap
local actions = require "telescope.actions"

require("telescope").setup {
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--color=never",
		},
		prompt_prefix = " ",
		selection_caret = " ",
		entry_prefix = "",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = {},
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		-- path_display = {"shorten", "absolute"},
		-- winblend = 30,
		border = {},
		borderchars = {
			"─",
			"│",
			"─",
			"│",
			"╭",
			"╮",
			"╯",
			"╰",
		},
		color_devicons = true,
		use_less = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
				-- To disable a keymap, put [map] = false
				-- So, to not map "<C-n>", just put
				-- ["<c-x>"] = false,
				["<esc>"] = actions.close,

				-- Otherwise, just set the mapping to the function that you want it to be.
				-- ["<C-i>"] = actions.select_horizontal,

				-- Add up multiple actions
				["<CR>"] = actions.select_default + actions.center,

				-- You can perform as many actions in a row as you like
				-- ["<CR>"] = actions.select_default + actions.center + my_cool_custom_action,
			},
			n = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
				-- ["<C-i>"] = my_cool_custom_action,
			},
		},
	},
}

-----------------
--  Telescope  --
-----------------

map(
	"n",
	"<space>br",
	"<cmd>lua require('telescope.builtin').file_browser(require('telescope.themes').get_dropdown())<cr>",
	{ noremap = true }
)
map(
	"n",
	"<c-p>",
	"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy())<cr>",
	{ noremap = true }
)
map(
	"n",
	"<space>gr",
	"<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown())<cr>",
	{ noremap = true }
)
map(
	"n",
	"<space>bb",
	"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown())<cr>",
	{ noremap = true }
)
map(
	"n",
	"<space>h",
	"<cmd>lua require('telescope.builtin').help_tags(require('telescope.themes').get_dropdown())<cr>",
	{ noremap = true }
)
map(
	"n",
	"<space>gf",
	"<cmd>lua require('telescope.builtin').git(require('telescope.themes').get_dropdown())<cr>",
	{ noremap = true }
)
map(
	"n",
	"<space>gb",
	"<cmd>lua require('telescope.builtin').git_branches(require('telescope.themes').get_dropdown())<cr>",
	{ noremap = true }
)
map(
	"n",
	"<space>gbc",
	"<cmd>lua require('telescope.builtin').git_bcommits(require('telescope.themes').get_dropdown())<cr>",
	{ noremap = true }
)
map(
	"n",
	"<space>ts",
	"<cmd>lua require('telescope.builtin').treesitter(require('telescope.themes').get_dropdown())<cr>",
	{ noremap = true }
)
map(
	"n",
	"<space>p",
	"<cmd>lua require('telescope.builtin').builtin(require('telescope.themes').get_dropdown())<cr>",
	{ noremap = true }
)
map(
	"n",
	"<space>rl",
	"<cmd>lua require('telescope.builtin').reloader()<cr>",
	{ noremap = true }
)
map(
	"n",
	"<space>s",
	"<cmd>lua require'telescope.builtin'.symbols{}<cr>",
	{ noremap = true }
)
map(
	"n",
	"<space>m",
	"<cmd>lua require('telescope').extensions.media_files.media_files(require('telescope.themes').get_dropdown())<cr>",
	{ noremap = true }
)
map(
	"n",
	"<space>u",
	"<cmd>lua require'telescope'.extensions.ultisnips.ultisnips(require('telescope.themes').get_dropdown())<cr>",
	{ noremap = true }
)
-- map("n", "<space>o", "<cmd>lua require('telescope.builtin').oldfiles()<cr>", { noremap = true })
