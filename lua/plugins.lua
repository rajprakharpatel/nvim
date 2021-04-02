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

  -- Useful Plugins
  use 'mbbill/undotree'
  use 'majutsushi/tagbar'
  -- pure vim scripts with no dependencies
  use 'tpope/vim-abolish'
  use 'zhimsel/vim-stay'
  use 'wsdjeg/vim-fetch'
  use 'Konfekt/FastFold'
  use 'tmhedberg/SimpylFold'
  use 'mhinz/vim-sayonara'
  -- Plugin 'tpope/vim-dispatch'


  -- visual Plugins
  use 'junegunn/goyo.vim'
  use 'junegunn/limelight.vim'
  use 'tanvirtin/monokai.nvim'

  -- Helpful Generic Tools
  use 'kshenoy/vim-signature'
  use 'mg979/vim-visual-multi'
  use 'machakann/vim-swap'
  use 'junegunn/vim-easy-align'        -- An alternative is tabular
  use 'tommcdo/vim-exchange'
  use 'pelodelfuego/vim-swoop'         -- call SwoopFreezeContext();call SwoopUnFreezeContext() to use with other plugins
  use 'sk1418/Join'                    -- [range]Join[!] [separator] [count] [flags]
  use 'matze/vim-move'                 -- move selection as whole around
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'airblade/vim-rooter'            -- automatically sets project directory using rules in vimrc
  use 'Raimondi/delimitMate'
  use 'terrortylor/nvim-comment'
  use 'andymass/vim-matchup'           -- matches cooresponding bracket
  use 'tpope/vim-eunuch'               -- shell commands from inside vim
  use 'RishabhRD/nvim-cheat.sh'
  use 'AndrewRadev/switch.vim'
  use 'metakirby5/codi.vim'



  -- Target objects
  use 'wellle/targets.vim'
  use 'kana/vim-textobj-user'
  use 'kana/vim-textobj-line'
  use 'kana/vim-textobj-entire'
  use 'kana/vim-textobj-indent'
  use 'jeetsukumaran/vim-pythonsense'
  use 'michaeljsmith/vim-indent-object'

  -- Snippets
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'
  use 'tweekmonster/startuptime.vim'
  use 'voldikss/vim-floaterm'
  use 'ptzz/lf.vim'
  use 'haya14busa/incsearch.vim'
  use 'haya14busa/incsearch-fuzzy.vim'
  use 'haya14busa/incsearch-easymotion.vim'
  use 'easymotion/vim-easymotion'
  use 'svermeulen/vimpeccable'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use 'nvim-telescope/telescope-media-files.nvim'
  use 'nvim-telescope/telescope-symbols.nvim'
  use 'fhill2/telescope-ultisnips.nvim'
  use 'gbrlsnchs/telescope-lsp-handlers.nvim'

  -- Git

  -- Lsp & autocompletion
  use 'mfussenegger/nvim-jdtls'
  use 'hrsh7th/nvim-compe'
  use 'RishabhRD/nvim-lsputils'
  use 'RishabhRD/popfix'
  use 'neovim/nvim-lspconfig'
  use {'tzachar/compe-tabnine'}
  use 'onsails/lspkind-nvim'
  use 'glepnir/lspsaga.nvim'
  use 'kabouzeid/nvim-lspinstall'

  -- Status Line and Bufferline
  use 'glepnir/galaxyline.nvim'
  use 'romgrk/barbar.nvim'

  -- Icons
  use 'kyazdani42/nvim-web-devicons'
  use 'glepnir/dashboard-nvim'

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'p00f/nvim-ts-rainbow'
  use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
  use 'nvim-treesitter/playground'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'windwp/nvim-ts-autotag'
  use 'romgrk/nvim-treesitter-context'

  -- Explorer
  use 'kyazdani42/nvim-tree.lua'
  -- use 'RRethy/vim-illuminate' --Highlight word under cursor without languageserver







  end)
