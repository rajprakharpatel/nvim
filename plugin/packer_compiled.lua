-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/rajprakhar/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/rajprakhar/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/rajprakhar/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/rajprakhar/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/rajprakhar/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  FastFold = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/FastFold"
  },
  ["JABS.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/JABS.nvim"
  },
  Join = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/Join"
  },
  SimpylFold = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/SimpylFold"
  },
  ["TrueZen.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/TrueZen.nvim"
  },
  ["codi.vim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/codi.vim"
  },
  ["commented.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/commented.nvim"
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
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/diffview.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gesture.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/gesture.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
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
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim"
  },
  ["lsp-trouble.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/lsp-trouble.nvim"
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
  ["nvcode-color-schemes.vim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/nvcode-color-schemes.vim"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-cheat.sh"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/nvim-cheat.sh"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
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
  ["nvim-peekup"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/nvim-peekup"
  },
  ["nvim-tetris"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/nvim-tetris"
  },
  ["nvim-transparent"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/nvim-transparent"
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
  nvim_context_vt = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/nvim_context_vt"
  },
  nvim_utils = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/nvim_utils"
  },
  ["orgmode.nvim"] = {
    config = { "\27LJ\2\nê\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21org_agenda_files\1\0\1\27org_default_notes_file\28~/Dropbox/org/notes.org\1\2\0\0\f~/org/*\nsetup\forgmode\frequire\0" },
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/orgmode.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/playground"
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
  ["sexy_scroller.vim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/sexy_scroller.vim"
  },
  sniprun = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/sniprun"
  },
  ["switch.vim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/switch.vim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim"
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
  ["tokyodark.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/tokyodark.nvim"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rtwilight\frequire\0" },
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/twilight.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  undotree = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["venn.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/venn.nvim"
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
  ["vim-indent-object"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-indent-object"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-maximizer"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-maximizer"
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
  },
  vimspector = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vimspector"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: orgmode.nvim
time([[Config for orgmode.nvim]], true)
try_loadstring("\27LJ\2\nê\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21org_agenda_files\1\0\1\27org_default_notes_file\28~/Dropbox/org/notes.org\1\2\0\0\f~/org/*\nsetup\forgmode\frequire\0", "config", "orgmode.nvim")
time([[Config for orgmode.nvim]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rtwilight\frequire\0", "config", "twilight.nvim")
time([[Config for twilight.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
