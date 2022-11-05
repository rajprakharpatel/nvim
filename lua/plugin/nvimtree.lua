vim.g.nvim_tree_auto_ignore_ft = {
	"dashboard",
	"startify",
	"quickfix",
}
-- To auto close nvimtree when it's last buffer
-- vim.cmd [[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]]
vim.api.nvim_create_autocmd("BufEnter", {
	nested = true,
	callback = function()
		if
			#vim.api.nvim_list_wins() == 1
			and vim.api.nvim_buf_get_name(0):match "NvimTree_" ~= nil
		then
			vim.cmd "quit"
		end
	end,
})
local tree_cb = require("nvim-tree.config").nvim_tree_callback
local nvim_tree_bindings = {
	{
		key = { "<CR>", "o", "l", "<2-LeftMouse>" },
		cb = tree_cb "edit",
		"n",
	},
	{
		key = { "<1-RightMouse>", "<C-]>" },
		cb = tree_cb "cd",
	},
	{ key = "<C-v>", cb = tree_cb "vsplit" },
	{ key = "<C-x>", cb = tree_cb "split" },
	{ key = "<C-t>", cb = tree_cb "tabnew" },
	{ key = "<", cb = tree_cb "prev_sibling" },
	{ key = ">", cb = tree_cb "next_sibling" },
	{ key = { "P", "h" }, cb = tree_cb "parent_node" },
	{ key = "h", cb = tree_cb "close_node" },
	{ key = "<S-CR>", cb = tree_cb "close_node" },
	{ key = "<Tab>", cb = tree_cb "preview" },
	{ key = "K", cb = tree_cb "first_sibling" },
	{ key = "J", cb = tree_cb "last_sibling" },
	{ key = "I", cb = tree_cb "toggle_ignored" },
	{ key = "H", cb = tree_cb "toggle_dotfiles" },
	{ key = "R", cb = tree_cb "refresh" },
	{ key = "a", cb = tree_cb "create" },
	{ key = "d", cb = tree_cb "remove" },
	{ key = "r", cb = tree_cb "rename" },
	{ key = "<C-r>", cb = tree_cb "full_rename" },
	{ key = "x", cb = tree_cb "cut" },
	{ key = "c", cb = tree_cb "copy" },
	{ key = "p", cb = tree_cb "paste" },
	{ key = "y", cb = tree_cb "copy_name" },
	{ key = "Y", cb = tree_cb "copy_path" },
	{ key = "gy", cb = tree_cb "copy_absolute_path" },
	{ key = "[c", cb = tree_cb "prev_git_item" },
	{ key = "]c", cb = tree_cb "next_git_item" },
	{ key = { "<BS>", "-" }, cb = tree_cb "dir_up" },
	{ key = "q", cb = tree_cb "close" },
	{ key = "?", cb = tree_cb "toggle_help" },
}
require("nvim-tree").setup {
	hijack_cursor = true,
	update_cwd = true,
	update_focused_file = { enable = true, update_cwd = false },
	system_open = { cmd = "xdg-open" },
	-- actions = {
	-- 	open_file = {
	-- 		window_picker = "asdjkl",
	-- 	},
	-- },
	renderer = { indent_markers = { enable = true }, group_empty = true },
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	filters = {
		custom = {
			".git",
			".github",
			".cache",
			"log.json",
			".root",
		},
	},
	view = {
		mappings = { custom_only = true, list = nvim_tree_bindings },
	},
	actions = {
		open_file = {
			resize_window = true
		}
	}
}
