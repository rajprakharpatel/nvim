--------------------------------------------------------------------------------
--                                buffer-line                                 --
--------------------------------------------------------------------------------
require("bufferline").setup {
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
					table.insert(result, { text = "  " .. error, guifg = "#EC5241" })
				end

				if warning ~= 0 then
					table.insert(result, {
						text = "  " .. warning,
						guifg = "#EFB839",
					})
				end

				if hint ~= 0 then
					table.insert(result, { text = "  " .. hint, guifg = "#A3BA5E" })
				end

				if info ~= 0 then
					table.insert(result, { text = "  " .. info, guifg = "#7EA9A7" })
				end
				return result
			end,
		},
	},
}