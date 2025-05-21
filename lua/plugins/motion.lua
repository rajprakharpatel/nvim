return {
	{
		"phaazon/hop.nvim",
		event = "VeryLazy",
		config = function()
			local hop = require "hop"
			hop.setup()
		end,
	},
	{
		"tris203/precognition.nvim",
		event = "VeryLazy",
		opts = {
			-- startVisible = true,
			showBlankVirtLine = false,
			-- highlightColor = { link = "Comment" },
			hints = {
			     Caret = { text = "^", prio = 0 },
			     Dollar = { text = "$", prio = 0 },
			     MatchingPair = { text = "%", prio = 0 },
			     Zero = { text = "0", prio = 0 },
			     w = { text = "w", prio = 0 },
			     b = { text = "b", prio = 0 },
			     e = { text = "e", prio = 0 },
			     W = { text = "W", prio = 0 },
			     B = { text = "B", prio = 0 },
			     E = { text = "E", prio = 0 },
			},
			-- gutterHints = {
			--     G = { text = "G", prio = 10 },
			--     gg = { text = "gg", prio = 9 },
			--     PrevParagraph = { text = "{", prio = 8 },
			--     NextParagraph = { text = "}", prio = 8 },
			-- },
			disabled_fts = {
			    "startify", "dashboard"
			},
		},
	},
}
