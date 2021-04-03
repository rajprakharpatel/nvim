" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/rajprakhar/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/rajprakhar/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/rajprakhar/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/rajprakhar/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/rajprakhar/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  FastFold = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/FastFold"
  },
  Join = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/Join"
  },
  SimpylFold = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/SimpylFold"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["codi.vim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/codi.vim"
  },
  ["compe-tabnine"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/compe-tabnine"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  delimitMate = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/delimitMate"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["git-blame.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/git-blame.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["goyo.vim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/goyo.vim"
  },
  ["incsearch-easymotion.vim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/incsearch-easymotion.vim"
  },
  ["incsearch-fuzzy.vim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/incsearch-fuzzy.vim"
  },
  ["incsearch.vim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/incsearch.vim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lf.vim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/lf.vim"
  },
  ["limelight.vim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/limelight.vim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["monokai.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/monokai.nvim"
  },
  ["nvim-cheat.sh"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/nvim-cheat.sh"
  },
  ["nvim-comment"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/nvim-comment"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-jdtls"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/nvim-jdtls"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-lsputils"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/nvim-lsputils"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  nvim_utils = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/nvim_utils"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  popfix = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/popfix"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  ["switch.vim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/switch.vim"
  },
  tagbar = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/tagbar"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["telescope-lsp-handlers.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/telescope-lsp-handlers.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim"
  },
  ["telescope-ultisnips.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/telescope-ultisnips.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  undotree = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-abolish"
  },
  ["vim-bookmarks"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-bookmarks"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-easymotion"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-exchange"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-exchange"
  },
  ["vim-fetch"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-fetch"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-illuminate"
  },
  ["vim-indent-object"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-indent-object"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-move"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-move"
  },
  ["vim-pythonsense"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-pythonsense"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-rhubarb"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  ["vim-sayonara"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-sayonara"
  },
  ["vim-signature"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-signature"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-stay"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-stay"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-swap"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-swap"
  },
  ["vim-swoop"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-swoop"
  },
  ["vim-textobj-entire"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-textobj-entire"
  },
  ["vim-textobj-indent"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-textobj-indent"
  },
  ["vim-textobj-line"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-textobj-line"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-textobj-user"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  vimpeccable = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vimpeccable"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
