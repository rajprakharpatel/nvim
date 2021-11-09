require("specs").setup {
	show_jumps = true,
	min_jump = 5,
	popup = {
		delay_ms = 0, -- delay before popup displays
		inc_ms = 4, -- time increments used for fade/resize effects
		blend = 20, -- starting blend, between 0-100 (fully transparent), see :h winblend
		width = 50,
		winhl = "PMenu",
		fader = require("specs").linear_fader,
		resizer = require("specs").shrink_resizer,
	},
	ignore_filetypes = { "dashboard" },
	ignore_buftypes = { nofile = true },
}
