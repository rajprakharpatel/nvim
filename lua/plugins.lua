local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	vim.cmd("packadd packer.nvim")
end

local plugins = vim.fn.stdpath("config") .. "/lua/plugins.lua"
vim.cmd("autocmd BufWritePost " .. plugins .. " PackerCompile") -- Auto compile when there are changes in plugins.lua

-- require('packer').init({display = {non_interactive = true}})
require("packer").init({ display = { auto_clean = false }, transitive_opt = true })
return require("packer").startup({
	function(use)
		-- Packer can manage itself as an optional plugin
		use("wbthomason/packer.nvim")
		use({
			opt = false,
			"lewis6991/impatient.nvim",
			config = function()
				require("impatient").enable_profile()
			end,
		})

		-- Quality of life improvements
		use({ "mbbill/undotree", opt = true, cmd = "UndotreeToggle" }) -- Undo history like a git tree

		-- pure vim/lua scripts with no dependencies
		use({ "zhimsel/vim-stay" }) -- make editing state persisitent
		use("wsdjeg/vim-fetch") -- fetch line and column if given with filename
		use({ "mhinz/vim-sayonara", cmd = "Sayonara" }) -- close buffer only
		-- working with variants of word :- search, replace and changing cas
		use({ "tpope/vim-abolish", opt = true, cmd = { "Abolish", "Subvert" } })
		use({
			"tpope/vim-dispatch",
			requires = "radenling/vim-dispatch-neovim",
			cmd = { "Dispatch", "Dispatch!", "Start!", "Make", "Focus", "Start" },
		})
		use({
			"nacro90/numb.nvim",
			config = function()
				require("numb").setup()
			end,
		})
		use({
			"jghauser/mkdir.nvim",
			config = function()
				require("mkdir")
			end,
		})

		-- colorschemes
		use({
			"marko-cerovac/material.nvim",
			-- cmd = 'colo material',
			config = function()
				vim.g.material_style = "deep ocean"
				vim.cmd("colo material")
				require("material").setup({
					contrast = true,
					borders = true,
					italics = {
						comments = true,
						strings = false,
						Keywords = true,
						fisnctions = false,
						variables = true,
					},
					contrast_windows = { "terminal", "packer", "qf", "NvimTree" },
					text_contrast = { lighter = false, darker = false },
					disable = {
						background = false,
						term_colors = false,
						eob_lines = true,
					},
				})
				vim.g.material_variable_color = "#d17CB4"

				vim.api.nvim_set_keymap(
					"n",
					"<leader>ml",
					[[<Cmd>lua require('material.functions').change_style('lighter')<CR>]],
					{ noremap = true, silent = true }
				)
				vim.api.nvim_set_keymap(
					"n",
					"<leader>md",
					[[<Cmd>lua require('material.functions').change_style('darker')<CR>]],
					{ noremap = true, silent = true }
				)

				vim.api.nvim_set_keymap(
					"n",
					"<leader>~",
					":lua require('material.functions').toggle_eob()<CR>",
					{ noremap = true }
				)
			end,
		})
		use({ "projekt0n/github-nvim-theme", cmd = "colo github" })
		use({ "bluz71/vim-nightfly-guicolors", cmd = "colo nightfly" })
		use({
			"kristijanhusak/vim-hybrid-material",
			cmd = { "colo hybrid_material", "colo hybrid_reverse" },
		})
		use({ "savq/melange", cmd = "colo melange" })
		use({ "sainnhe/gruvbox-material", cmd = "colo gruvbox-material" })
		use({ "sainnhe/sonokai", cmd = "colo sonokai" })
		use({ "tanvirtin/monokai.nvim" })
		use({
			"ChristianChiarulli/nvcode-color-schemes.vim",
			cmd = { "colo gruvbox", "colo nvcode", "colo aurora" },
		})
		use({ "tiagovla/tokyodark.nvim", cmd = "colo tokyodark" })
		use({
			"xiyaowong/nvim-transparent",
			cmd = "TransparentToggle",
			config = function()
				require("transparent").setup({ enable = false })
			end,
		}) -- make any colorschemme transparent
		use({
			"sainnhe/everforest",
			cmd = "colo everforest",
			config = function()
				vim.g.everforest_background = "hard"
			end,
		})
		use({
			"folke/twilight.nvim",
			cmd = "colo twilight",
			config = function()
				require("twilight").setup({})
			end,
		})

		-- visual sugar
		use("norcalli/nvim-colorizer.lua")
		use("TaDaa/vimade")
		use({
			"Pocco81/TrueZen.nvim",
			opt = true,
			cmd = { "TZMinimalist", "TZFocus", "TZAtaraxis" },
		})
		use({
			"edluffy/specs.nvim",
			config = function()
				require("specs").setup({
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
					ignore_filetypes = {},
					ignore_buftypes = { nofile = true },
				})
			end,
		})
		use({ "joeytwiddle/sexy_scroller.vim", disable = true })
		use({ "folke/lsp-colors.nvim", disable = true })
		use({
			"wfxr/minimap.vim",
			run = "cargo install --locked code-minimap",
			cmd = "Minimap",
		})
		use({
			"jbyuki/venn.nvim", -- Draw Ascii flow chart in vim
			cmd = "Venn",
			config = function()
				-- enable or disable keymappings for venn
				function _G.toggle_venn()
					local venn_enabled = vim.inspect(vim.b.venn_enabled)
					if venn_enabled == "nil" then
						vim.b.venn_enabled = true
						vim.cmd([[setlocal ve=all]])
						-- draw a line on HJKL keystokes
						vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<cr>", { noremap = true })
						vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<cr>", { noremap = true })
						vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<cr>", { noremap = true })
						vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<cr>", { noremap = true })
						-- draw a box by pressing "f" with visual selection
						vim.api.nvim_buf_set_keymap(0, "vt", "f", ":VBox<cr>", { noremap = true })
					else
						vim.cmd([[setlocal ve=]])
						vim.cmd([[mapclear <buffer>]])
						vim.b.venn_enabled = nil
					end
				end
				-- toggle keymappings for venn using <leader>v
				vim.api.nvim_set_keymap("n", "<leader>v", ":lua toggle_venn()<cr>", { noremap = true })
			end,
		})
		use({
			"rcarriga/nvim-notify",
			config = function()
				require("notify").setup({
					timeout = 3000,
					background_colour = "#000000",
				})
			end,
		})
		-- use 'RRethy/vim-illuminate' --Highlight word under cursor without languageserver
		-- use 'notomo/gesture.nvim'
		-- use 'cossonleo/neo-smooth-scroll.nvim'

		-- Helpful Generic Tools
		use("kshenoy/vim-signature") --  to place, toggle and display marks.
		use("mg979/vim-visual-multi") -- emulate multiple cursors
		use("machakann/vim-swap") -- swap function args(g<, g>, gs)
		use("junegunn/vim-easy-align") -- An alternative is tabular
		use("tommcdo/vim-exchange") -- Easy text change operator(cx, cxx, X, cxc)
		use("matze/vim-move") -- move selection as whole around
		use("tpope/vim-surround")
		use("tpope/vim-repeat")
		use("airblade/vim-rooter") -- automatically sets project directory using rules in vimrc
		use({ "andymass/vim-matchup", disable = false, event = "VimEnter" })
		use("AndrewRadev/switch.vim") -- Switch counter values easily
		use("MattesGroeger/vim-bookmarks")
		use("gennaro-tedesco/nvim-peekup") -- "" to open <ESC> to close
		use({ "sotte/presenting.vim", cmd = "PresentingStart" })
		-- call SwoopFreezeContext();call SwoopUnFreezeContext() to use with other plugins
		use({ "pelodelfuego/vim-swoop", opt = true, cmd = "Swoop" })
		use({ "sk1418/Join", opt = true, cmd = "Join" }) -- [range]Join[!] [separator] [count] [flags]
		use({ "tpope/vim-eunuch", opt = true }) -- shell commands from inside vim
		use({ "RishabhRD/nvim-cheat.sh", opt = true, cmd = "Cheat" })
		use({ "metakirby5/codi.vim", opt = true, cmd = "Codi" }) -- REPL virtual text
		-- Lua

		-- Target objects
		use("wellle/targets.vim")
		use("kana/vim-textobj-user")
		use("kana/vim-textobj-line")
		use("kana/vim-textobj-entire")
		use("kana/vim-textobj-indent")
		use("jeetsukumaran/vim-pythonsense")
		use("michaeljsmith/vim-indent-object")

		-- Snippets
		use({ "SirVer/ultisnips", requires = "honza/vim-snippets" })
		-- use {'hrsh7th/vim-vsnip', requires = {{'rafamadriz/friendly-snippets'}}}

		-- terminal
		use("voldikss/vim-floaterm")
		use({ "ptzz/lf.vim", opt = true, cmd = "Lf" }) -- file manager
		use({ "nikvdp/neomux", cmd = "Neomux" })

		-- search
		use("unblevable/quick-scope")
		use("haya14busa/incsearch.vim") -- replace with vim-hop
		use("haya14busa/incsearch-fuzzy.vim")
		use("haya14busa/incsearch-easymotion.vim")
		use("easymotion/vim-easymotion")

		-- Webdev
		-- TODO add when i start webdev
		-- use 'gennaro-tedesco/nvim-jqx'
		-- use 'turbio/bracey.vim'

		-- Telescope
		use({
			"nvim-telescope/telescope.nvim",
			cmd = "Telescope",
			requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
			config = function()
				require("telescope-config")
			end,
		})
		use({
			"nvim-telescope/telescope-media-files.nvim",
			after = "telescope.nvim",
			-- requires = {'nvim-telescope/telescope.nvim'},
			config = function()
				require("telescope").load_extension("media_files")
			end,
		})
		use({ "nvim-telescope/telescope-symbols.nvim", after = "telescope.nvim" })
		use({
			"fhill2/telescope-ultisnips.nvim",
			after = "telescope.nvim",
			config = function()
				require("telescope").load_extension("ultisnips")
			end,
		})
		use({
			"gbrlsnchs/telescope-lsp-handlers.nvim",
			after = "telescope.nvim",
			config = function()
				require("telescope").load_extension("lsp_handlers")
			end,
		})

		-- Git
		-- use 'TimUntersberger/neogit'
		use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
		use({ "tpope/vim-fugitive", opt = true, cmd = "G" })
		use({ "tpope/vim-rhubarb", after = "vim-fugitive" })
		use({
			"sindrets/diffview.nvim",
			opt = true,
			cmd = "DiffviewOpen",
			confog = function()
				local cb = require("diffview.config").diffview_callback

				require("diffview").setup({
					diff_binaries = false, -- Show diffs for binaries
					file_panel = {
						width = 35,
						use_icons = true, -- Requires nvim-web-devicons
					},
					key_bindings = {
						disable_defaults = false, -- Disable the default key bindings
						-- The `view` bindings are active in the diff buffers, only when the current
						-- tabpage is a Diffview.
						view = {
							["<tab>"] = cb("select_next_entry"), -- Open the diff for the next file
							["<s-tab>"] = cb("select_prev_entry"), -- Open the diff for the previous file
							["<leader>e"] = cb("focus_files"), -- Bring focus to the files panel
							["<leader>b"] = cb("toggle_files"), -- Toggle the files panel.
						},
						file_panel = {
							["j"] = cb("next_entry"), -- Bring the cursor to the next file entry
							["<down>"] = cb("next_entry"),
							["k"] = cb("prev_entry"), -- Bring the cursor to the previous file entry.
							["<up>"] = cb("prev_entry"),
							["<cr>"] = cb("select_entry"), -- Open the diff for the selected entry.
							["o"] = cb("select_entry"),
							["<2-LeftMouse>"] = cb("select_entry"),
							["-"] = cb("toggle_stage_entry"), -- Stage / unstage the selected entry.
							["S"] = cb("stage_all"), -- Stage all entries.
							["U"] = cb("unstage_all"), -- Unstage all entries.
							["X"] = cb("restore_entry"), -- Restore entry to the state on the left side.
							["R"] = cb("refresh_files"), -- Update stats and entries in the file list.
							["<tab>"] = cb("select_next_entry"),
							["<s-tab>"] = cb("select_prev_entry"),
							["<leader>e"] = cb("focus_files"),
							["<leader>b"] = cb("toggle_files"),
						},
					},
				})
			end,
		})
		use({ "alec-gibson/nvim-tetris", opt = true, cmd = "Tetris" })
		use({
			"michaelb/sniprun",
			opt = true,
			cmd = "SnipRun",
			run = "bash ./install.sh",
		})

		-- Debugging
		use({
			"mfussenegger/nvim-dap",
			opt = true,
			cmd = "DAP",
			config = function()
				require("debugger-config")
			end,
		})
		use({ "Pocco81/DAPInstall.nvim", opt = true, after = "nvim-dap" })
		use({
			"rcarriga/nvim-dap-ui",
			requires = { "mfussenegger/nvim-dap" },
			opt = true,
			after = "nvim-dap",
			config = function()
				require("dapui").setup()
			end,
		})
		use({
			"mfussenegger/nvim-dap-python",
			opt = true,
			after = "nvim-dap",
			config = function()
				require("dap-python").setup(vim.fn.stdpath("data") .. "/dapinstall/python_dbg/bin/python")
			end,
		})
		use({
			"nvim-telescope/telescope-dap.nvim",
			opt = true,
			after = { "nvim-dap", "telescope.nvim" },
			config = function()
				require("telescope").load_extension("dap")
			end,
		})
		use({ "theHamsta/nvim-dap-virtual-text", opt = true, after = "nvim-dap" })

		-- Lsp & autocompletion
		use({ "mfussenegger/nvim-jdtls" })
		-- use 'hrsh7th/nvim-compe' -- Completion plugin incompatible with endwise
		use({
			"hrsh7th/nvim-cmp",
			requires = {
				{ "hrsh7th/cmp-nvim-lua", ft = "lua" },
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-calc",
				"kdheepak/cmp-latex-symbols",
				"hrsh7th/cmp-emoji",
				{ "tzachar/cmp-tabnine", disable = true, run = "./install.sh" },
				"quangnguyen30192/cmp-nvim-ultisnips",
				{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql" } },
				{ "f3fora/cmp-nuspell", rocks = { "lua-nuspell" } }, -- Install nuspell c++ library(sudo pacman -S nuspell)
			},
			config = function()
				require("nvim-cmp")
			end,
		})

		use("RishabhRD/nvim-lsputils")
		use("RishabhRD/popfix")
		use("neovim/nvim-lspconfig")
		use("ray-x/lsp_signature.nvim")
		-- use {'tzachar/compe-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-compe'}
		use({
			"windwp/nvim-autopairs",
			config = function()
				local cmp_autopairs = require("nvim-autopairs.completion.cmp")
				local cmp = require("cmp")
				cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
				local npairs = require("nvim-autopairs")
				local Rule = require("nvim-autopairs.rule")
				npairs.setup({
					disable_in_macro = true,
					map_c_w = true,
					check_ts = true,
					ts_config = {
						lua = { "string" }, -- it will not add pair on that treesitter node
						javascript = { "template_string" },
						java = false, -- don't check treesitter on java
					},
				})

				require("nvim-treesitter.configs").setup({
					autopairs = { enable = true },
				})

				local ts_conds = require("nvim-autopairs.ts-conds")

				-- press % => %% is only inside comment or string
				npairs.add_rules({
					Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({ "string", "comment" })),
					Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({ "function" })),
				})
				-- put this to  setup function and press <a-e> to use fast_wrap
				npairs.setup({ fast_wrap = {} })

				-- change default fast_wrap
				npairs.setup({
					fast_wrap = {
						map = "<M-e>",
						chars = { "{", "[", "(", '"', "'" },
						pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
						end_key = "$",
						keys = "qwertyuiopzxcvbnmasdfghjkl",
						check_comma = true,
						hightlight = "Search",
					},
				})
			end,
		})
		use("onsails/lspkind-nvim") -- vs-code like lsp suggestion kind symbols
		-- TODO: change back to glepnir version when it's fixed
		use({
			"tami5/lspsaga.nvim",
			config = function()
				require("lspsaga").init_lsp_saga()
			end,
		})
		use({ "kabouzeid/nvim-lspinstall", cmd = "LspInstall" })
		use({ "folke/lsp-trouble.nvim", disable = true, cmd = "Trouble" })

		-- Status Line and Bufferline
		use({
			"glepnir/galaxyline.nvim",
			opt = false,
			config = function()
				require("nv-galaxyline")
			end,
		})
		use({
			"windwp/windline.nvim",
			opt = true,
			config = function()
				require("wlsample.evil_line")
			end,
		})
		use("akinsho/nvim-bufferline.lua")

		-- Icons
		use("kyazdani42/nvim-web-devicons")
		use("glepnir/dashboard-nvim")

		-- Treesitter
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		use("p00f/nvim-ts-rainbow")
		use("lukas-reineke/indent-blankline.nvim")
		use({ "haringsrob/nvim_context_vt", after = "nvim-treesitter" })
		use("romgrk/nvim-treesitter-context")
		use({
			"simrat39/symbols-outline.nvim",
			cmd = "SymbolsOutline",
			config = function()
				require("symbols-outline").setup({
					highlight_hovered_items = true,
					show_guides = true,
				})
			end,
		}) -- :SymbolOutline
		use({ "JoosepAlviste/nvim-ts-context-commentstring" })
		use({ "nvim-treesitter/playground", disable = true })
		use({ "windwp/nvim-ts-autotag", disable = true }) -- Use treesitter to autoclose and autorename html tag

		-- Explorer
		use({
			"kyazdani42/nvim-tree.lua",
			requires = "kyazdani42/nvim-web-devicons",
			cmd = "NvimTreeToggle",
			config = function()
				vim.g.nvim_tree_ignore = {
					".git",
					".github",
					".cache",
					"log.json",
					".root",
				}
				vim.g.nvim_tree_auto_ignore_ft = {
					"dashboard",
					"startify",
					"quickfix",
				}
				vim.g.nvim_tree_indent_markers = 1 -- "0 by default, this option shows indent markers when folders are open
				local tree_cb = require("nvim-tree.config").nvim_tree_callback
				local nvim_tree_bindings = {
					{
						key = { "<CR>", "o", "l", "<2-LeftMouse>" },
						cb = tree_cb("edit"),
						"n",
					},
					{ key = { "<1-RightMouse>", "<C-]>" }, cb = tree_cb("cd") },
					{ key = "<C-v>", cb = tree_cb("vsplit") },
					{ key = "<C-x>", cb = tree_cb("split") },
					{ key = "<C-t>", cb = tree_cb("tabnew") },
					{ key = "<", cb = tree_cb("prev_sibling") },
					{ key = ">", cb = tree_cb("next_sibling") },
					{ key = { "P", "h" }, cb = tree_cb("parent_node") },
					{ key = "h", cb = tree_cb("close_node") },
					{ key = "<S-CR>", cb = tree_cb("close_node") },
					{ key = "<Tab>", cb = tree_cb("preview") },
					{ key = "K", cb = tree_cb("first_sibling") },
					{ key = "J", cb = tree_cb("last_sibling") },
					{ key = "I", cb = tree_cb("toggle_ignored") },
					{ key = "H", cb = tree_cb("toggle_dotfiles") },
					{ key = "R", cb = tree_cb("refresh") },
					{ key = "a", cb = tree_cb("create") },
					{ key = "d", cb = tree_cb("remove") },
					{ key = "r", cb = tree_cb("rename") },
					{ key = "<C-r>", cb = tree_cb("full_rename") },
					{ key = "x", cb = tree_cb("cut") },
					{ key = "c", cb = tree_cb("copy") },
					{ key = "p", cb = tree_cb("paste") },
					{ key = "y", cb = tree_cb("copy_name") },
					{ key = "Y", cb = tree_cb("copy_path") },
					{ key = "gy", cb = tree_cb("copy_absolute_path") },
					{ key = "[c", cb = tree_cb("prev_git_item") },
					{ key = "]c", cb = tree_cb("next_git_item") },
					{ key = { "<BS>", "-" }, cb = tree_cb("dir_up") },
					{ key = "q", cb = tree_cb("close") },
					{ key = "g?", cb = tree_cb("toggle_help") },
				}
				require("nvim-tree").setup({
					auto_close = true,
					hijack_cursor = true,
					update_cwd = true,
					diagnostics = {
						enable = true,
						icons = {
							hint = "",
							info = "",
							warning = "",
							error = "",
						},
					},
					auto_resize = true,
					mappings = { custom_only = true, list = nvim_tree_bindings },
					view = {
						auto_resize = true,
					},
				})
			end,
		})

		-- Orgmmode and notetaking
		use({
			"kristijanhusak/orgmode.nvim",
			requires = {
				"akinsho/org-bullets.nvim",
				config = function()
					require("org-bullets").setup()
				end,
			},
			config = function()
				require("orgmode").setup({
					org_agenda_files = { "~/org/**/*" },
					org_default_notes_file = "~/org/notes.org",
				})
			end,
		})

		-- Experimental
		use({ "dag/vim-fish", ft = "fish" })
		use({ "tpope/vim-dadbod", cmd = "DB" })
		use({
			"kristijanhusak/vim-dadbod-ui",
			cmd = "DBUI",
			config = function()
				vim.cmd([[packadd vim-dadbod]])
				vim.g.db_ui_auto_execute_table_helpers = 1
			end,
		})
		use({
			"folke/which-key.nvim",
			config = function()
				require("which-key").setup({
					plugins = {
						spelling = {
							enabled = true,
							suggestions = 20,
						},
					},
					key_labels = {
						["<space>"] = "SPC",
						["<cr>"] = "RET",
						["<tab>"] = "TAB",
					},
				})
			end,
		})
		use({
			"AckslD/nvim-neoclip.lua",
			config = function()
				require("neoclip").setup({
					keys = {
						i = {
							select = "<CR>",
							paste = "<m-p>",
							pate_behind = "<m-k>",
						},
					},
				})
			end,
		})
		use({ "seandewar/nvimesweeper", cmd = "Nvimesweeper" })
		use({ "nanotee/sqls.nvim" })
		use({
			"lukas-reineke/headlines.nvim",
			ft = { "orgmode", "rmd", "markdown", "vimwiki" },
			config = function()
				require("headlines").setup()
			end,
		})

		-- use {'rhysd/wandbox-vim', cmd = {'Wandbox', 'Quickrun', 'WandboxOptionList'}}
		-- Easier easyalign (omaps - gl<motion/object>key)
		use({
			"tommcdo/vim-lion",
			config = function()
				vim.g.lion_squeeze_spaces = 1
			end,
		})
		use({ "tpope/vim-unimpaired" }) -- various useful [<key>,]<key> mappings
		use({ "dhruvasagar/vim-table-mode", cmd = "TableModeToggle" })
		use("andweeb/presence.nvim")
		use({
			"gelguy/wilder.nvim",
			run = ":UpdateRemotePlugins",
			requires = {
				"romgrk/fzy-lua-native",
				{ "nixprime/cpsm", run = "./install.sh" },
			},
			config = function() end,
		})
		use({
			"luukvbaal/stabilize.nvim",
			disable = true,
			config = function()
				require("stabilize").setup()
			end,
		})
		use({
			"mattn/emmet-vim",
			config = function()
				vim.g.user_emmet_leader_key = "<spc>"
			end,
		})
		use({ "jose-elias-alvarez/null-ls.nvim" })
		use({ "github/copilot.vim" })
		use({ "nikvdp/ejs-syntax" })
		use({ "tpope/vim-commentary" })
		-- 		use({ "folke/trouble.nvim" })

		-- Plugin development
		use({
			"~/workspace/wandbox.nvim",
			disable = false,
			romcks = "luasocket",
			config = function()
				require("wandbox").setup({ client_list = { "curl" } })
				vim.api.nvim_set_keymap(
					"n",
					"<space>wa",
					[[<cmd>lua require("wandbox").run({client_list = {'wget'}, open_qf = true})<CR>]],
					{ noremap = true }
				)
			end,
		})
		use("folke/lua-dev.nvim")
		use("rafcamlet/nvim-luapad")
		use({ "rhysd/wandbox-vim", disable = true })
		if packer_bootstrap then
			require("packer").sync()
		end
	end,
})
