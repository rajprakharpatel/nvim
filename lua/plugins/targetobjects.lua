return {
	-- Target objects
	{ "wellle/targets.vim", event = "VeryLazy"},
	{ "kana/vim-textobj-line", event = "VeryLazy",
		dependencies = {
			"kana/vim-textobj-user", event = "VeryLazy"
		},
	},
	{ "kana/vim-textobj-entire", event = "VeryLazy",
		dependencies = {
			"kana/vim-textobj-user", event = "VeryLazy"
		},
	},
	{ "kana/vim-textobj-indent", event = "VeryLazy",
		dependencies = { 
			"kana/vim-textobj-user", event = "VeryLazy"
		},
	},
	{ "jeetsukumaran/vim-pythonsense", event = "VeryLazy"},
	{ "michaeljsmith/vim-indent-object", event = "VeryLazy"},
}

