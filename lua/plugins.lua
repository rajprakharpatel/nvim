local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

-- require('packer').init({display = {non_interactive = true}})
require('packer').init({display = {auto_clean = false}, transitive_opt = true})
return require('packer').startup(function(use)
    -- Packer can manage itself as an optional plugin
    use 'wbthomason/packer.nvim'
    use {'lewis6991/impatient.nvim', rocks = 'mpack',
    config = function ()
        require("impatient")
    end}

    -- Quality of life improvements
    use {'mbbill/undotree', opt = true, cmd = 'UndotreeToggle'} -- Undo history like a git tree

    -- pure vim/lua scripts with no dependencies
    use 'zhimsel/vim-stay' -- make editing state persisitent
    use 'wsdjeg/vim-fetch' -- fetch line and column if given with filename
    use {'mhinz/vim-sayonara', cmd = "Sayonara"} -- close buffer only
    use {'tpope/vim-abolish', opt = true, cmd = {'Abolish', 'Subvert'}} -- working with variants of word :- search, replace and changing case
    use {
        'tpope/vim-dispatch',
        requires = 'radenling/vim-dispatch-neovim',
        cmd = {'Dispatch', 'Dispatch!', 'Start!', 'Make', 'Focus', 'Start'}
    }
    use {
        'nacro90/numb.nvim',
        config = function()
            require('numb').setup()
        end
    }

    -- visual Plugins
    use 'marko-cerovac/material.nvim'
    use 'bluz71/vim-nightfly-guicolors'
    use 'kristijanhusak/vim-hybrid-material'
    use 'norcalli/nvim-colorizer.lua'
    use 'TaDaa/vimade'
    use {"Pocco81/TrueZen.nvim", opt = true, cmd = {'TZMinimalist', 'TZFocus', 'TZAtaraxis'}}
    use {
        "folke/twilight.nvim",
        opt = true,
        cmd = 'twilight',
        config = function()
            require("twilight").setup {}
        end
    }
    use {
        'edluffy/specs.nvim',
        config = function()
            require('specs').setup {
                show_jumps = true,
                min_jump = 5,
                popup = {
                    delay_ms = 0, -- delay before popup displays
                    inc_ms = 4, -- time increments used for fade/resize effects
                    blend = 20, -- starting blend, between 0-100 (fully transparent), see :h winblend
                    width = 50,
                    winhl = "PMenu",
                    fader = require('specs').linear_fader,
                    resizer = require('specs').shrink_resizer
                },
                ignore_filetypes = {},
                ignore_buftypes = {nofile = true}
            }

        end
    }
    use {'joeytwiddle/sexy_scroller.vim', disable = true}
    use {'folke/lsp-colors.nvim', disable = true}
    use {'wfxr/minimap.vim', opt = true, run = 'cargo install --locked code-minimap', cmd = 'Minimap'}
    -- use 'tanvirtin/monokai.nvim'
    -- use 'ChristianChiarulli/nvcode-color-schemes.vim'
    -- use 'tiagovla/tokyodark.nvim'
    -- use 'xiyaowong/nvim-transparent' -- make any colorschemme transparent
    -- use 'jbyuki/venn.nvim' -- Draw Ascii flow chart in vim
    -- use 'RRethy/vim-illuminate' --Highlight word under cursor without languageserver
    -- use 'notomo/gesture.nvim'
    -- use 'cossonleo/neo-smooth-scroll.nvim'

    -- Helpful Generic Tools
    use 'kshenoy/vim-signature' --  to place, toggle and display marks.
    use 'mg979/vim-visual-multi' -- emulate multiple cursors
    use 'machakann/vim-swap' -- swap function args(g<, g>, gs)
    use 'junegunn/vim-easy-align' -- An alternative is tabular
    use 'tommcdo/vim-exchange' -- Easy text change operator(cx, cxx, X, cxc)
    use 'matze/vim-move' -- move selection as whole around
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'airblade/vim-rooter' -- automatically sets project directory using rules in vimrc
    -- use 'Raimondi/delimitMate' -- TODO
    use {'andymass/vim-matchup', event = 'VimEnter'}
    use 'AndrewRadev/switch.vim' -- Switch counter values easily
    use 'MattesGroeger/vim-bookmarks'
    use 'gennaro-tedesco/nvim-peekup' -- "" to open <ESC> to close
    use {'sotte/presenting.vim', cmd = 'PresentingStart'}
    use {'pelodelfuego/vim-swoop', opt = true, cmd = 'Swoop'} -- call SwoopFreezeContext();call SwoopUnFreezeContext() to use with other plugins
    use {'sk1418/Join', opt = true, cmd = 'Join'} -- [range]Join[!] [separator] [count] [flags]
    use {'tpope/vim-eunuch', opt = true} -- shell commands from inside vim
    use {'RishabhRD/nvim-cheat.sh', opt = true, cmd = 'Cheat'}
    use {'metakirby5/codi.vim', opt = true, cmd = 'Codi'} -- REPL virtual text
    -- Lua

    -- Target objects
    use 'wellle/targets.vim'
    use 'kana/vim-textobj-user'
    use 'kana/vim-textobj-line'
    use 'kana/vim-textobj-entire'
    use 'kana/vim-textobj-indent'
    use 'jeetsukumaran/vim-pythonsense'
    use 'michaeljsmith/vim-indent-object'

    -- Snippets
    use {'SirVer/ultisnips', requires = 'honza/vim-snippets'}
    use {'hrsh7th/vim-vsnip', requires = {{'rafamadriz/friendly-snippets'}}}

    -- terminal
    use 'voldikss/vim-floaterm'
    use {'ptzz/lf.vim', opt = true, cmd = 'Lf'} -- file manager
    use {'nikvdp/neomux', cmd = 'Neomux'}

    -- search
    use 'unblevable/quick-scope'
    use 'haya14busa/incsearch.vim' -- replace with vim-hop
    use 'haya14busa/incsearch-fuzzy.vim'
    use 'haya14busa/incsearch-easymotion.vim'
    use 'easymotion/vim-easymotion'

    -- Webdev
    -- TODO add when i start webdev
    -- use 'gennaro-tedesco/nvim-jqx'
    -- use 'turbio/bracey.vim'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        cmd = 'Telescope',
        requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'},
        config = function()
            require 'telescope-config'
        end
    }
    use {
        'nvim-telescope/telescope-media-files.nvim',
        after = 'telescope.nvim',
        -- requires = {'nvim-telescope/telescope.nvim'},
        config = function()
            require('telescope').load_extension('media_files')
        end
    }
    use {'nvim-telescope/telescope-symbols.nvim', after = 'telescope.nvim'}
    use {
        'fhill2/telescope-ultisnips.nvim',
        after = 'telescope.nvim',
        config = function()
            require('telescope').load_extension('ultisnips')
        end
    }
    use {
        'gbrlsnchs/telescope-lsp-handlers.nvim',
        after = 'telescope.nvim',
        config = function()
            require('telescope').load_extension('lsp_handlers')
        end
    }

    -- Git
    -- use 'TimUntersberger/neogit'
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    use {'tpope/vim-fugitive', opt = true, cmd = 'G'}
    use {'tpope/vim-rhubarb', after = 'vim-fugitive'}
    use {
        'sindrets/diffview.nvim',
        opt = true,
        cmd = 'DiffviewOpen',
        confog = function()
            local cb = require'diffview.config'.diffview_callback

            require'diffview'.setup {
                diff_binaries = false, -- Show diffs for binaries
                file_panel = {
                    width = 35,
                    use_icons = true -- Requires nvim-web-devicons
                },
                key_bindings = {
                    disable_defaults = false, -- Disable the default key bindings
                    -- The `view` bindings are active in the diff buffers, only when the current
                    -- tabpage is a Diffview.
                    view = {
                        ["<tab>"] = cb("select_next_entry"), -- Open the diff for the next file
                        ["<s-tab>"] = cb("select_prev_entry"), -- Open the diff for the previous file
                        ["<leader>e"] = cb("focus_files"), -- Bring focus to the files panel
                        ["<leader>b"] = cb("toggle_files") -- Toggle the files panel.
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
                        ["<leader>b"] = cb("toggle_files")
                    }
                }
            }
        end
    }
    use {'alec-gibson/nvim-tetris', opt = true, cmd = 'Tetris'}
    use {'michaelb/sniprun', opt = true, cmd = 'SnipRun', run = 'bash ./install.sh'}

    -- Debugging
    use {
        'mfussenegger/nvim-dap',
        opt = true,
        cmd = 'DAP',
        config = function()
            require('debugger-config')
        end
    }
    use {"Pocco81/DAPInstall.nvim", opt = true, after = 'nvim-dap'}
    use {
        "rcarriga/nvim-dap-ui",
        requires = {"mfussenegger/nvim-dap"},
        opt = true,
        after = 'nvim-dap',
        config = function()
            require("dapui").setup()
        end
    }
    use {
        'mfussenegger/nvim-dap-python',
        opt = true,
        after = 'nvim-dap',
        config = function()
            require('dap-python').setup(vim.fn.stdpath('data') .. '/dapinstall/python_dbg/bin/python')
        end
    }
    use {
        'nvim-telescope/telescope-dap.nvim',
        opt = true,
        after = {'nvim-dap', 'telescope.nvim'},
        config = function()
            require('telescope').load_extension('dap')
        end
    }
    use {'theHamsta/nvim-dap-virtual-text', opt = true, after = 'nvim-dap'}

    -- Lsp & autocompletion
    use {'mfussenegger/nvim-jdtls'}
    -- use 'hrsh7th/nvim-compe' -- Completion plugin incompatible with endwise
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            {"hrsh7th/cmp-nvim-lua", ft = 'lua'}, "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-path",
            "hrsh7th/vim-vsnip", "hrsh7th/cmp-vsnip", "hrsh7th/cmp-calc", "kdheepak/cmp-latex-symbols",
            "hrsh7th/cmp-emoji", {"tzachar/cmp-tabnine", run = './install.sh'},
            {"kristijanhusak/vim-dadbod-completion"}, {"f3fora/cmp-nuspell", rocks = {'lua-nuspell'}} -- Install nuspell c++ library(sudo pacman -S nuspell)
        },
        config = function()
            require 'nvim-cmp'
        end
    }

    use 'RishabhRD/nvim-lsputils'
    use 'RishabhRD/popfix'
    use 'neovim/nvim-lspconfig'
    -- use {'tzachar/compe-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-compe'}
    use {
        'windwp/nvim-autopairs',
        config = function()
            require'nvim-autopairs'.setup {}
            require("nvim-autopairs.completion.cmp").setup({
                map_cr = true, --  map <CR> on insert mode
                map_complete = true, -- it will auto insert `(` after select function or method item
                auto_select = true -- auto select first item
            })
            local npairs = require("nvim-autopairs")
            local Rule = require('nvim-autopairs.rule')
            npairs.setup({
                check_ts = true,
                ts_config = {
                    lua = {'string'}, -- it will not add pair on that treesitter node
                    javascript = {'template_string'},
                    java = false -- don't check treesitter on java
                }
            })

            require('nvim-treesitter.configs').setup {autopairs = {enable = true}}

            local ts_conds = require('nvim-autopairs.ts-conds')

            -- press % => %% is only inside comment or string
            npairs.add_rules({
                Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({'string', 'comment'})),
                Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({'function'}))
            })
            -- put this to  setup function and press <a-e> to use fast_wrap
            npairs.setup({fast_wrap = {}})

            -- change default fast_wrap
            npairs.setup({
                fast_wrap = {
                    map = '<M-e>',
                    chars = {'{', '[', '(', '"', "'"},
                    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
                    end_key = '$',
                    keys = 'qwertyuiopzxcvbnmasdfghjkl',
                    check_comma = true,
                    hightlight = 'Search'
                }
            })

        end
    }
    use 'onsails/lspkind-nvim' -- vs-code like lsp suggestion kind symbols
    use 'glepnir/lspsaga.nvim'
    use {'kabouzeid/nvim-lspinstall', cmd = 'LspInstall'}
    use {'folke/lsp-trouble.nvim', cmd = 'Trouble'}
    -- use {'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}} -- pre-configuration on top of lspconfig

    -- Status Line and Bufferline
    use {
        'glepnir/galaxyline.nvim',
        opt = true,
        config = function()
            require('nv-galaxyline')
        end
    }
    use {
        'windwp/windline.nvim',
        config = function()
            require('wlsample.evil_line')
        end
    }
    use 'akinsho/nvim-bufferline.lua'

    -- Icons
    use 'kyazdani42/nvim-web-devicons'
    use 'glepnir/dashboard-nvim'

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'p00f/nvim-ts-rainbow'
    use 'lukas-reineke/indent-blankline.nvim'
    use {'haringsrob/nvim_context_vt', after = 'nvim-treesitter'}
    use 'romgrk/nvim-treesitter-context'
    use {
        'simrat39/symbols-outline.nvim',
        cmd = 'SymbolsOutline',
        config = function()
            require('symbols-outline').setup({highlight_hovered_items = true, show_guides = true})
        end
    } -- :SymbolOutline
    use {'JoosepAlviste/nvim-ts-context-commentstring', disable = true}
    use {'nvim-treesitter/playground', disable = true}
    use {'windwp/nvim-ts-autotag', disable = true} -- Use treesitter to autoclose and autorename html tag

    -- Explorer
    use 'kyazdani42/nvim-tree.lua'

    -- Orgmmode and notetaking
    use {
        'kristijanhusak/orgmode.nvim',
        requires = {'akinsho/org-bullets.nvim',
        config = function ()
            require('org-bullets').setup()
        end},
        config = function()
            require('orgmode').setup {org_agenda_files = {'~/org/**/*'}, org_default_notes_file = '~/org/notes.org'}
        end
    }

    -- Experimenting
    use {'dag/vim-fish', ft = 'fish'}
    use {'tpope/vim-dadbod', cmd = 'DB'}
    use {
        'kristijanhusak/vim-dadbod-ui',
        cmd = 'DBUI',
        config = function()
            packer_load('vim-dadbod')
        end
    }
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
            }
        end
    }

end)
