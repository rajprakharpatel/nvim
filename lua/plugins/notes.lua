return {
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
			"epwalsh/pomo.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "work",
					path = "/Users/prakhar.patel/Documents/Obsidian Vault",
					overrides = {
						notes_subdir = "notes",
					},
				},
			},
			daily_notes = {
				-- Optional, if you keep daily notes in a separate directory.
				folder = "notes/dailies",
				-- Optional, if you want to change the date format for the ID of daily notes.
				date_format = "%Y-%m-%d",
				-- Optional, if you want to change the date format of the default alias of daily notes.
				alias_format = "%B %-d, %Y",
				-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
				template = nil,
			},
			completion = {
				nvim_cmp = true,
				min_chars = 2,

				-- Where to put new notes created from completion. Valid options are
				--  * "current_dir" - put new notes in same directory as the current buffer.
				--  * "notes_subdir" - put new notes in the default notes subdirectory.
				new_notes_location = "current_dir",

				-- Either 'wiki' or 'markdown'.
				preferred_link_style = "wiki",

				-- Control how wiki links are completed with these (mutually exclusive) options:
				--
				-- 1. Whether to add the note ID during completion.
				-- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
				-- Mutually exclusive with 'prepend_note_path' and 'use_path_only'.
				prepend_note_id = false,
				-- 2. Whether to add the note path during completion.
				-- E.g. "[[Foo" completes to "[[notes/foo|Foo]]" assuming "notes/foo.md" is the path of the note.
				-- Mutually exclusive with 'prepend_note_id' and 'use_path_only'.
				prepend_note_path = true,
				-- 3. Whether to only use paths during completion.
				-- E.g. "[[Foo" completes to "[[notes/foo]]" assuming "notes/foo.md" is the path of the note.
				-- Mutually exclusive with 'prepend_note_id' and 'prepend_note_path'.
				use_path_only = false,
			},
			ui = {
				enable = true,
			},
			-- Optional, customize how names/IDs for new notes are created.
			note_id_func = function(title)
				local suffix = ""
				if title ~= nil then
					return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				else
					for _ = 1, 4 do
						return suffix .. string.char(math.random(65, 90))
					end
				end
			end,
			open_app_foreground = true,
		},
		cmd = { "Obsidian" },
	},
}
