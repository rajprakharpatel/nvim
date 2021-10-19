autocmd QuickFixCmdPost [^l]* copen | doautocmd User StabilizeRestore
autocmd QuickFixCmdPost l* lopen | doautocmd User StabilizeRestore

lua << EOF
function _G.TroubleQuickFixPost(mode)
	require("trouble.providers").get(vim.api.nvim_get_current_win(), vim.api.nvim_get_current_buf(), function(items)
		if #items > 0 then require("trouble").open({mode = mode}) end
	end, { mode = mode })
	vim.cmd("doautocmd User StabilizeRestore")
end
EOF
autocmd QuickFixCmdPost [^l]* lua TroubleQuickFixPost("quickfix")
autocmd QuickFixCmdPost l* lua TroubleQuickFixPost("loclist")

