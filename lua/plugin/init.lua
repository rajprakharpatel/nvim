local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	vim.cmd "packadd packer.nvim"
end

local plugins = vim.fn.stdpath "config" .. "/lua/plugin/init.lua"
vim.cmd("autocmd BufWritePost " .. plugins .. " PackerCompile") -- Auto compile when there are changes in plugins.lua

require("packer").init {
	display = { auto_clean = false },
	transitive_opt = true,
}
return require("packer").startup {
	function(use)
		-- Packer can manage itself as an optional plugin
		use "wbthomason/packer.nvim"
		-- use {
		-- 	"lewis6991/impatient.nvim",
		-- 	config = function()
		-- 		require("impatient").enable_profile()
		-- 	end,
		-- }
		use "nathom/filetype.nvim"

		-- Quality of life improvements
		use { "mbbill/undotree", disable = false, cmd = "UndotreeToggle" }

		-- pure vim/lua scripts with no dependencies
		use {
			"zhimsel/vim-stay",
			config = function()
				vim.cmd ":set viewoptions=cursor,folds,slash,unix"
			end,
		}
		use "wsdjeg/vim-fetch"
		use { "mhinz/vim-sayonara", cmd = "Sayonara" }
		-- working with variants of word :- search, replace and changing cas
		use {
			"tpope/vim-abolish",
			disable = false,
			cmd = { "Abolish", "Subvert" },
		}
		use {
			"tpope/vim-dispatch",
			disable = false,
			requires = "radenling/vim-dispatch-neovim",
			cmd = {
				"Dispatch",
				"Dispatch!",
				"Start!",
				"Make",
				"Focus",
				"Start",
			},
		}

		-- preview lines by :<num>
		use {
			"nacro90/numb.nvim",
			disable = true,
			config = function()
				require("numb").setup()
			end,
		}

		-- Automatically make dirs when opening new paths
		use {
			"jghauser/mkdir.nvim",
			disable = false,
			config = function()
				require "mkdir"
			end,
		}

		-- colorschemes
		use {
			"marko-cerovac/material.nvim",
			disable = false,
			-- cmd = 'colo material',
			config = function()
				require "plugin.material"
				vim.cmd "colo material"
			end,
		}
		use { "projekt0n/github-nvim-theme", cmd = "colo github" }
		use { "bluz71/vim-nightfly-guicolors", cmd = "colo nightfly" }
		use {
			"kristijanhusak/vim-hybrid-material",
			disable = true,
			cmd = { "colo hybrid_material", "colo hybrid_reverse" },
		}
		use { "savq/melange", cmd = "colo melange" }
		use { "sainnhe/gruvbox-material", cmd = "colo gruvbox-material" }
		use { "sainnhe/sonokai", cmd = "colo sonokai" }
		use { "tanvirtin/monokai.nvim" }
		use {
			"ChristianChiarulli/nvcode-color-schemes.vim",
			disable = false,
			cmd = { "colo gruvbox", "colo nvcode", "colo aurora" },
		}
		use {
			"tiagovla/tokyodark.nvim",
			-- cmd = "colo tokyodark",
		}
		use {
			"xiyaowong/nvim-transparent",
			disable = false,
			cmd = "TransparentToggle",
			config = function()
				require("transparent").setup { enable = false }
			end,
		}
		use {
			"sainnhe/everforest",
			disable = false,
			cmd = "colo everforest",
			config = function()
				vim.g.everforest_background = "hard"
			end,
		}
		use {
			"folke/twilight.nvim",
			disable = false,
			cmd = "colo twilight",
			config = function()
				require("twilight").setup {}
			end,
		}

		-- visual sugar
		use {
			"norcalli/nvim-colorizer.lua",
			event = "BufWinEnter",
			config = function()
				require("colorizer").setup()
			end,
		}
		use {
			"Pocco81/TrueZen.nvim",
			disable = true,
			cmd = { "TZMinimalist", "TZFocus", "TZAtaraxis" },
		}
		use {
			"edluffy/specs.nvim",
			disable = true,
			config = function()
				require "plugin.specs"
			end,
		}
		use {
			"wfxr/minimap.vim",
			disable = true,
			run = "cargo install --locked code-minimap",
			cmd = "Minimap",
		}
		use {
			"jbyuki/venn.nvim", -- Draw Ascii flow chart in vim
			disable = true,
			cmd = "Venn",
			config = function()
				require "plugin.venn"
			end,
		}
		use {
			"rcarriga/nvim-notify",
			disable = true,
			config = function()
				require("notify").setup {
					timeout = 3000,
					background_colour = "#000000",
				}
			end,
		}
		-- use 'RRethy/vim-illuminate' --Highlight word under cursor without languageserver
		-- use 'notomo/gesture.nvim'
		-- use 'cossonleo/neo-smooth-scroll.nvim'

		-- Helpful Generic Tools
		use "kshenoy/vim-signature"
		use "mg979/vim-visual-multi"
		use {
			"machakann/vim-swap",
			config = function()
				vim.cmd "omap i, <Plug>(swap-textobject-i)"
				vim.cmd "omap i, <Plug>(swap-textobject-i)"
				vim.cmd "xmap i, <Plug>(swap-textobject-i)"
				vim.cmd "omap a, <Plug>(swap-textobject-a)"
				vim.cmd "xmap a, <Plug>(swap-textobject-a)"
			end,
		}
		use {
			"junegunn/vim-easy-align",
			config = function()
				vim.cmd "nmap ga <Plug>(EasyAlign)"
				vim.cmd "xmap ga <Plug>(EasyAlign)"
			end,
		}
		use "tommcdo/vim-exchange"
		use {
			"matze/vim-move",
			config = function()
				vim.g.move_key_modifier = "C"
			end,
		}
		use "tpope/vim-surround"
		use "tpope/vim-repeat"
		use {
			"airblade/vim-rooter",
			config = function()
				vim.cmd "let g:rooter_patterns = ['.git', 'CMakeLists.txt', 'Makefile', '*.sln', '.idea', '.root', '.vim', '.vscode']"
			end,
		}
		use {
			"andymass/vim-matchup",
			disable = false,
			config = function()
				vim.cmd "let g:matchup_matchparen_offscreen = {'method': 'popup'}"
			end,
			event = "VimEnter",
		}
		use {
			"AndrewRadev/switch.vim",
			disable = false,
			config = function()
				vim.cmd("source " .. vim.fn.stdpath "config" .. "/viml/switch.vim")
			end,
		}
		use "MattesGroeger/vim-bookmarks"
		use "gennaro-tedesco/nvim-peekup"
		use { "sotte/presenting.vim", cmd = "PresentingStart" }
		-- call SwoopFreezeContext();call SwoopUnFreezeContext() to use with other plugins
		use { "pelodelfuego/vim-swoop", opt = true, cmd = "Swoop" }
		use { "sk1418/Join", opt = true, cmd = "Join" }
		use { "tpope/vim-eunuch", opt = true }
		use { "RishabhRD/nvim-cheat.sh", opt = true, cmd = "Cheat" }
		use { "metakirby5/codi.vim", opt = true, cmd = "Codi" }
		-- Lua

		-- Target objects
		use "wellle/targets.vim"
		use "kana/vim-textobj-user"
		use "kana/vim-textobj-line"
		use "kana/vim-textobj-entire"
		use "kana/vim-textobj-indent"
		use "jeetsukumaran/vim-pythonsense"
		use "michaeljsmith/vim-indent-object"

		-- Snippets
		use {
			"SirVer/ultisnips",
			requires = "honza/vim-snippets",
			config = function()
				require "plugin.ultisnips"
			end,
		}
		-- use {'hrsh7th/vim-vsnip', requires = {{'rafamadriz/friendly-snippets'}}}

		-- terminal
		use {
			"voldikss/vim-floaterm",
			cmd = { "FloatermToggle", "FloatermNew", "FloatermSend" },
		}
		use { "ptzz/lf.vim", opt = true, cmd = "Lf" }
		use { "nikvdp/neomux", cmd = "Neomux" }

		-- search
		use "unblevable/quick-scope"
		use "haya14busa/incsearch.vim"
		use "haya14busa/incsearch-fuzzy.vim"
		use "haya14busa/incsearch-easymotion.vim"
		use {
			"easymotion/vim-easymotion",
			disable = false,
			requires = {
				"haya14busa/incsearch.vim",
				"haya14busa/incsearch-fuzzy.vim",
				"haya14busa/incsearch-easymotion.vim",
			},
			config = function()
				vim.cmd(
					"source " .. vim.fn.stdpath "config" .. "/viml/inc_easy_fuzzy.vim"
				)
			end,
		}

		-- Webdev
		-- use 'gennaro-tedesco/nvim-jqx'
		use { "turbio/bracey.vim", ft = { "html", "css", "javascript" } }
		use {
			"vuki656/package-info.nvim",
			requires = "MunifTanjim/nui.nvim",
			config = function()
				require("package-info").setup()
			end,
		}

		-- Telescope
		use {
			"nvim-telescope/telescope.nvim",
			disable = false,
			cmd = "Telescope",
			requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
			config = function()
				require "plugin.telescope"
			end,
		}
		use {
			"dhruvmanila/telescope-bookmarks.nvim",
			disable = false,
			after = "telescope.nvim",
			-- requires = {'nvim-telescope/telescope.nvim'},
			config = function()
				require("telescope").load_extension "bookmarks"
			end,
		}
		use {
			"cljoly/telescope-repo.nvim",
			disable = false,
			after = "telescope.nvim",
			-- requires = {'nvim-telescope/telescope.nvim'},
			config = function()
				require("telescope").load_extension "repo"
			end,
		}
		use {
			"tom-anders/telescope-vim-bookmarks.nvim",
			disable = false,
			after = "telescope.nvim",
			-- requires = {'nvim-telescope/telescope.nvim'},
			config = function()
				require("telescope").load_extension "vim_bookmarks"
			end,
		}
		use {
			"nvim-telescope/telescope-media-files.nvim",
			disable = false,
			after = "telescope.nvim",
			-- requires = {'nvim-telescope/telescope.nvim'},
			config = function()
				require("telescope").load_extension "media_files"
			end,
		}
		use {
			"nvim-telescope/telescope-symbols.nvim",
			disable = false,
			after = "telescope.nvim",
		}
		use {
			"fhill2/telescope-ultisnips.nvim",
			disable = false,
			after = "telescope.nvim",
			config = function()
				require("telescope").load_extension "ultisnips"
			end,
		}
		use {
			"gbrlsnchs/telescope-lsp-handlers.nvim",
			disable = false,
			after = "telescope.nvim",
			config = function()
				require("telescope").load_extension "lsp_handlers"
			end,
		}

		-- Git
		-- use 'TimUntersberger/neogit'
		use {
			"lewis6991/gitsigns.nvim",
			disable = false,
			requires = { "nvim-lua/plenary.nvim" },
			event = "BufRead",
			config = function()
				require "plugin.gitsigns"
			end,
		}
		use { "tpope/vim-fugitive", opt = true, cmd = "G" }
		use { "tpope/vim-rhubarb", after = "vim-fugitive" }
		use {
			"sindrets/diffview.nvim",
			disable = false,
			cmd = "DiffviewOpen",
			confog = function()
				require "plugin.diffview"
			end,
		}
		use { "alec-gibson/nvim-tetris", disable = true, cmd = "Tetris" }
		use {
			"michaelb/sniprun",
			disable = true,
			cmd = "SnipRun",
			run = "bash ./install.sh",
		}

		-- Debugging
		use {
			"mfussenegger/nvim-dap",
			disable = false,
			cmd = "DAP",
			config = function()
				require "debugger"
			end,
		}
		use { "Pocco81/DAPInstall.nvim", opt = true, after = "nvim-dap" }
		use {
			"rcarriga/nvim-dap-ui",
			disable = false,
			-- cmd = "DAP",
			after = "nvim-dap",
			config = function()
				require("dapui").setup()
			end,
		}
		use {
			"mfussenegger/nvim-dap-python",
			disable = false,
			after = "nvim-dap",
			config = function()
				require("dap-python").setup "python"
			end,
		}
		use {
			"nvim-telescope/telescope-dap.nvim",
			disable = false,
			after = { "nvim-dap", "telescope.nvim" },
			config = function()
				vim.cmd [[DAP]]
				require("telescope").load_extension "dap"
			end,
		}
		use {
			"theHamsta/nvim-dap-virtual-text",
			disable = false,
			after = "nvim-dap",
			config = function()
				require("nvim-dap-virtual-text").setup()
			end,
		}

		-- Lsp & autocompletion
		use { "mfussenegger/nvim-jdtls", ft = "java" }
		use {
			"hrsh7th/nvim-cmp",
			disable = false,
			event = "VimEnter",
			requires = {
				{ "hrsh7th/cmp-nvim-lua", ft = "lua" },
				{ "hrsh7th/cmp-buffer", event = "InsertEnter" },
				{
					"hrsh7th/cmp-nvim-lsp",
					event = "InsertEnter",
					requires = "nvim-lspconfig",
				},
				{ "hrsh7th/cmp-path", event = "InsertEnter" },
				{ "hrsh7th/cmp-calc", event = "InsertEnter" },
				{ "kdheepak/cmp-latex-symbols", event = "InsertEnter" },
				{ "hrsh7th/cmp-emoji", event = "InsertEnter" },
				{ "hrsh7th/cmp-cmdline", event = "InsertEnter", disable = true },
				{
					"tzachar/cmp-tabnine",
					event = "InsertEnter",
					disable = true,
					run = "./install.sh",
				},
				{ "quangnguyen30192/cmp-nvim-ultisnips", event = "InsertEnter" },
				{
					"kristijanhusak/vim-dadbod-completion",
					ft = { "sql", "mysql" },
				},
				{
					"f3fora/cmp-nuspell",
					event = "InsertEnter",
					rocks = { "lua-nuspell" },
				}, -- Install nuspell c++ library(sudo pacman -S nuspell)
			},
			after = "lspkind-nvim",
			config = function()
				require "completion"
			end,
		}
		use "b0o/SchemaStore.nvim"
		use {
			"RishabhRD/nvim-lsputils",
			config = function()
				require "plugin.lsputils"
			end,
		}
		use "RishabhRD/popfix"
		use {
			"neovim/nvim-lspconfig",
			after = { "cmp-nvim-lsp" },
			event = "InsertEnter",
			config = function()
				require "lsp"
			end,
		}
		use "ray-x/lsp_signature.nvim"
		-- use {'tzachar/compe-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-compe'}
		use {
			"windwp/nvim-autopairs",
			disable = false,
			config = function()
				require "plugin.autopairs"
			end,
			after = "nvim-cmp",
		}
		use { "onsails/lspkind-nvim", event = "InsertEnter" }
		-- TODO: change back to glepnir version when it's fixed
		use {
			"tami5/lspsaga.nvim",
			disable = false,
			config = function()
				require("lspsaga").init_lsp_saga()
			end,
		}
		use { "kabouzeid/nvim-lspinstall", cmd = "LspInstall" }
		use { "folke/lsp-trouble.nvim", disable = true, cmd = "Trouble" }

		-- Status Line
		use {
			"glepnir/galaxyline.nvim",
			disable = false,
			config = function()
				require "plugin.galaxyline"
			end,
		}
		use {
			"windwp/windline.nvim",
			disable = true,
			config = function()
				require "wlsample.evil_line"
			end,
		}
		-- Bufferline
		use {
			"akinsho/nvim-bufferline.lua",
			event = "BufWinEnter",
			config = function()
				require "plugin.bufferline"
			end,
		}

		-- Icons
		use "kyazdani42/nvim-web-devicons"
		use {
			"glepnir/dashboard-nvim",
			config = function()
				require "plugin.dashboard"
			end,
		}

		-- Treesitter
		use {
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				require "plugin.treesitter"
			end,
		}
		use "p00f/nvim-ts-rainbow"
		use "lukas-reineke/indent-blankline.nvim"
		use { "haringsrob/nvim_context_vt", after = "nvim-treesitter" }
		use "romgrk/nvim-treesitter-context"
		use {
			"simrat39/symbols-outline.nvim",
			disable = false,
			cmd = "SymbolsOutline",
			config = function()
				require("symbols-outline").setup {
					highlight_hovered_items = true,
					show_guides = true,
				}
			end,
		}
		use { "JoosepAlviste/nvim-ts-context-commentstring" }
		use { "nvim-treesitter/playground", disable = true }
		use { "windwp/nvim-ts-autotag", disable = true }

		-- Explorer
		use {
			"kyazdani42/nvim-tree.lua",
			disable = false,
			requires = "kyazdani42/nvim-web-devicons",
			cmd = "NvimTreeToggle",
			config = function()
				require "plugin.nvimtree"
			end,
		}

		-- Orgmmode and notetaking
		use {
			"kristijanhusak/orgmode.nvim",
			disable = false,
			requires = {
				"akinsho/org-bullets.nvim",
				config = function()
					require("org-bullets").setup()
				end,
			},
			config = function()
				require("orgmode").setup {
					org_agenda_files = { "~/org/**/*" },
					org_default_notes_file = "~/org/notes.org",
				}
			end,
		}

		-- Experimental
		use { "dag/vim-fish", ft = "fish" }
		use { "tpope/vim-dadbod", cmd = "DB" }
		use {
			"kristijanhusak/vim-dadbod-ui",
			disable = false,
			cmd = "DBUI",
			config = function()
				vim.cmd [[packadd vim-dadbod]]
				vim.g.db_ui_auto_execute_table_helpers = 1
			end,
		}
		use {
			"folke/which-key.nvim",
			disable = false,
			config = function()
				require("which-key").setup {
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
				}
			end,
		}
		use {
			"AckslD/nvim-neoclip.lua",
			disable = false,
			requires = { "tami5/sqlite.lua", module = "sqlite" },
			after = "telescope.nvim",
			config = function()
				require("neoclip").setup {
					enable_persistent_history = true,
				}
				require("telescope").load_extension "neoclip"
			end,
		}
		use { "seandewar/nvimesweeper", cmd = "Nvimesweeper" }
		use { "nanotee/sqls.nvim" }
		use {
			"lukas-reineke/headlines.nvim",
			disable = false,
			ft = { "orgmode", "rmd", "markdown", "vimwiki" },
			config = function()
				require("headlines").setup()
			end,
		}

		-- use {'rhysd/wandbox-vim', cmd = {'Wandbox', 'Quickrun', 'WandboxOptionList'}}
		-- Easier easyalign (omaps - gl<motion/object>key)
		use {
			"tommcdo/vim-lion",
			disable = false,
			config = function()
				vim.g.lion_squeeze_spaces = 1
			end,
		}
		use { "tpope/vim-unimpaired" }
		use { "dhruvasagar/vim-table-mode", cmd = "TableModeToggle" }
		use "andweeb/presence.nvim"
		use {
			"gelguy/wilder.nvim",
			disable = false,
			event = "CmdlineEnter",
			run = ":UpdateRemotePlugins",
			requires = {
				"romgrk/fzy-lua-native",
				{ "nixprime/cpsm", run = "./install.sh" },
			},
			config = function()
				vim.cmd("source " .. vim.fn.stdpath "config" .. "/viml/wilder.vim")
			end,
		}
		use {
			"luukvbaal/stabilize.nvim",
			disable = true,
			config = function()
				require("stabilize").setup()
			end,
		}
		use { "jose-elias-alvarez/null-ls.nvim" }
		use { "github/copilot.vim" }
		use { "nikvdp/ejs-syntax" }
		use { "tpope/vim-commentary", event = "BufWinEnter" }
		use { "theprimeagen/harpoon" }
		use { "stevearc/vim-arduino" }
		use { "ray-x/guihua.lua" }
		-- relative line numbers on operator pending mode
		-- use "vim-scripts/RelOps"
		-- use({ "folke/trouble.nvim" })

		-- Plugin development
		use {
			"rajprakharpatel/wandbox.nvim",
			disable = false,
			config = function()
				require("wandbox").setup { client_list = { "curl" } }
				vim.api.nvim_set_keymap(
					"n",
					"<space>wa",
					[[<cmd>lua require("wandbox").run({client_list = {'wget'}, open_qf = true})<CR>]],
					{ noremap = true }
				)
			end,
		}
		use "folke/lua-dev.nvim"
		use "rafcamlet/nvim-luapad"
		if packer_bootstrap then
			require("packer").sync()
		end
	end,
}
