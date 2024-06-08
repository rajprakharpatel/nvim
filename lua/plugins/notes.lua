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
			-- Either 'wiki' or 'markdown'.
			preferred_link_style = "wiki",

			-- Where to put new notes created from completion. Valid options are
			--  * "current_dir" - put new notes in same directory as the current buffer.
			--  * "notes_subdir" - put new notes in the default notes subdirectory.
			new_notes_location = "current_dir",
			-- Optional, customize how wiki links are formatted. You can set this to one of:
			--  * "use_alias_only", e.g. '[[Foo Bar]]'
			--  * "prepend_note_id", e.g. '[[foo-bar|Foo Bar]]'
			--  * "prepend_note_path", e.g. '[[foo-bar.md|Foo Bar]]'
			--  * "use_path_only", e.g. '[[foo-bar.md]]'
			-- Or you can set it to a function that takes a table of options and returns a string, like this:
			wiki_link_func = function(opts)
				return require("obsidian.util").wiki_link_id_prefix(opts)
			end,

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
