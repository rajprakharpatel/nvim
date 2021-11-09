local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp = require "cmp"
cmp.event:on(
	"confirm_done",
	cmp_autopairs.on_confirm_done { map_char = { tex = "" } }
)
local npairs = require "nvim-autopairs"
local Rule = require "nvim-autopairs.rule"
npairs.setup {
	disable_in_macro = true,
	map_c_w = true,
	check_ts = true,
	ts_config = {
		lua = { "string" }, -- it will not add pair on that treesitter node
		javascript = { "template_string" },
		java = false, -- don't check treesitter on java
	},
}

require("nvim-treesitter.configs").setup {
	autopairs = { enable = true },
}

local ts_conds = require "nvim-autopairs.ts-conds"

-- press % => %% is only inside comment or string
npairs.add_rules {
	Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node { "string", "comment" }),
	Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node { "function" }),
}
-- put this to  setup function and press <a-e> to use fast_wrap
npairs.setup { fast_wrap = {} }

-- change default fast_wrap
npairs.setup {
	fast_wrap = {
		map = "<M-e>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		hightlight = "Search",
	},
}
