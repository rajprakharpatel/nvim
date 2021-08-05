-- vim.cmd [[packadd packer.nvim]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

-- require('packer').init({display = {non_interactive = true}})
require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function(use)
    -- Packer can manage itself as an optional plugin
    use 'wbthomason/packer.nvim'

    -- Quality of life improvements
    use 'norcalli/nvim_utils'
    use 'svermeulen/vimpeccable'

    -- Useful Plugins
    use 'mbbill/undotree'
    use 'simrat39/symbols-outline.nvim' -- :SymbolOutline

    -- pure vim scripts with no dependencies
    use 'tpope/vim-abolish'
    use 'zhimsel/vim-stay'
    use 'wsdjeg/vim-fetch'
    use 'Konfekt/FastFold'
    use 'tmhedberg/SimpylFold'
    use 'mhinz/vim-sayonara'
    -- Plugin 'tpope/vim-dispatch'

    -- visual Plugins
    -- use 'junegunn/goyo.vim'
    -- use 'junegunn/limelight.vim'
    use "Pocco81/TrueZen.nvim"
    -- Lua
    use {
        "folke/twilight.nvim",
        config = function()
            require("twilight").setup {}
        end
    }

    use 'tanvirtin/monokai.nvim'
    -- use 'RRethy/vim-illuminate' --Highlight word under cursor without languageserver
    use 'norcalli/nvim-colorizer.lua'
    use 'ChristianChiarulli/nvcode-color-schemes.vim'
    use 'joeytwiddle/sexy_scroller.vim'
    use 'tiagovla/tokyodark.nvim'
    use 'folke/lsp-colors.nvim'
    use {'sunjon/shade.nvim', disable = true} -- dim inactive windows
    use 'xiyaowong/nvim-transparent' -- make any colorschemme transparent
    use 'jbyuki/venn.nvim' -- Draw Ascii flow chart in vim
    use 'notomo/gesture.nvim'

    -- use 'cossonleo/neo-smooth-scroll.nvim'

    -- Helpful Generic Tools
    use 'kshenoy/vim-signature' --  to place, toggle and display marks.
    use 'mg979/vim-visual-multi'
    use 'machakann/vim-swap'
    use 'junegunn/vim-easy-align' -- An alternative is tabular
    use 'tommcdo/vim-exchange'
    use 'pelodelfuego/vim-swoop' -- call SwoopFreezeContext();call SwoopUnFreezeContext() to use with other plugins
    use 'sk1418/Join' -- [range]Join[!] [separator] [count] [flags]
    use 'matze/vim-move' -- move selection as whole around
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'airblade/vim-rooter' -- automatically sets project directory using rules in vimrc
    use 'Raimondi/delimitMate'
    -- use 'terrortylor/nvim-comment'
    use 'winston0410/commented.nvim'
    use 'andymass/vim-matchup' -- matches cooresponding bracket
    use 'tpope/vim-eunuch' -- shell commands from inside vim
    use 'RishabhRD/nvim-cheat.sh'
    use 'AndrewRadev/switch.vim'
    use 'metakirby5/codi.vim'
    use 'MattesGroeger/vim-bookmarks'
    use 'gennaro-tedesco/nvim-peekup' -- "" to open <ESC> to close
    use 'matbme/JABS.nvim' -- easy buffer management
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
    use {'SirVer/ultisnips', requires = {{'honza/vim-snippets'}}}
    use {'hrsh7th/vim-vsnip', requires = {{'rafamadriz/friendly-snippets'}}}

    -- terminal
    use 'voldikss/vim-floaterm'
    use 'ptzz/lf.vim'

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
    use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}
    use 'nvim-telescope/telescope-media-files.nvim'
    use 'nvim-telescope/telescope-symbols.nvim'
    use 'fhill2/telescope-ultisnips.nvim'
    use 'gbrlsnchs/telescope-lsp-handlers.nvim'

    -- Git
    -- use 'TimUntersberger/neogit'
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'sindrets/diffview.nvim'

    use 'alec-gibson/nvim-tetris'
    use {'michaelb/sniprun', run = 'bash ./install.sh'}

    -- Debugging
    use 'puremourning/vimspector'
    use 'szw/vim-maximizer'

    -- Lsp & autocompletion
    use 'mfussenegger/nvim-jdtls'
    use 'hrsh7th/nvim-compe'
    use 'RishabhRD/nvim-lsputils'
    use 'RishabhRD/popfix'
    use 'neovim/nvim-lspconfig'
    use {'tzachar/compe-tabnine', run = './install'}
    use 'onsails/lspkind-nvim'
    use 'glepnir/lspsaga.nvim'
    use 'kabouzeid/nvim-lspinstall'
    use 'folke/lsp-trouble.nvim'
    -- use {'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}} -- pre-configuration on top of lspconfig

    -- Status Line and Bufferline
    use 'glepnir/galaxyline.nvim'
    use 'akinsho/nvim-bufferline.lua'

    -- Icons
    use 'kyazdani42/nvim-web-devicons'
    use 'glepnir/dashboard-nvim'

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use 'p00f/nvim-ts-rainbow'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'haringsrob/nvim_context_vt'
    use 'romgrk/nvim-treesitter-context'
    use {'nvim-treesitter/playground'}
    use {'windwp/nvim-ts-autotag', disable = true} -- Use treesitter to autoclose and autorename html tag

    -- Explorer
    use 'kyazdani42/nvim-tree.lua'

    -- Orgmmode
    use {
        'kristijanhusak/orgmode.nvim',
        config = function()
            require('orgmode').setup {
                org_agenda_files = {'~/org/*'},
                org_default_notes_file = '~/Dropbox/org/notes.org'
            }
        end
    }

end)
