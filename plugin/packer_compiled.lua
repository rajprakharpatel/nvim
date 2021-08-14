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
  ["DAPInstall.nvim"] = {
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/DAPInstall.nvim"
  },
  ["JABS.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/JABS.nvim"
  },
  Join = {
    commands = { "Join" },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/Join"
  },
  ["TrueZen.nvim"] = {
    commands = { "TZMinimalist" },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/TrueZen.nvim"
  },
  ["codi.vim"] = {
    commands = { "Codi" },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/codi.vim"
  },
  ["compe-tabnine"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/compe-tabnine"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["diffview.nvim"] = {
    commands = { "DiffviewOpen" },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/diffview.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
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
    commands = { "Lf" },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/lf.vim"
  },
  ["lsp-trouble.nvim"] = {
    commands = { "Trouble" },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/lsp-trouble.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["material.nvim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/material.nvim"
  },
  ["minimap.vim"] = {
    commands = { "Minimap" },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/minimap.vim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nè\6\0\0\f\0&\1U6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\4\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\5\0B\1\2\0029\2\2\0005\4\6\0005\5\b\0005\6\a\0=\6\t\0055\6\n\0=\6\v\5=\5\f\4B\2\2\0016\2\0\0'\4\r\0B\2\2\0029\2\2\0025\4\15\0005\5\14\0=\5\16\4B\2\2\0016\2\0\0'\4\17\0B\2\2\0029\3\18\0004\5\3\0\18\6\1\0'\b\19\0'\t\19\0'\n\t\0B\6\4\2\18\b\6\0009\6\20\0069\t\21\0025\v\22\0B\t\2\0A\6\1\2>\6\1\5\18\6\1\0'\b\23\0'\t\23\0'\n\t\0B\6\4\2\18\b\6\0009\6\20\0069\t\24\0025\v\25\0B\t\2\0A\6\1\0?\6\0\0B\3\2\0019\3\2\0005\5\26\0004\6\0\0=\6\27\5B\3\2\0019\3\2\0005\5%\0005\6\28\0005\a\29\0=\a\30\0066\a\31\0009\a \a'\t!\0'\n\"\0'\v#\0B\a\4\2=\a$\6=\6\27\5B\3\2\1K\0\1\0\1\0\0\fpattern\5\b%s+\25 [%'%\"%)%>%]%)%}%,] \tgsub\vstring\nchars\1\6\0\0\6{\6[\6(\6\"\6'\1\0\5\fend_key\6$\bmap\n<M-e>\16check_comma\2\15hightlight\vSearch\tkeys\31qwertyuiopzxcvbnmasdfghjkl\14fast_wrap\1\0\0\1\2\0\0\rfunction\19is_not_ts_node\6$\1\3\0\0\vstring\fcomment\15is_ts_node\14with_pair\6%\14add_rules\28nvim-autopairs.ts-conds\14autopairs\1\0\0\1\0\1\venable\2\28nvim-treesitter.configs\14ts_config\15javascript\1\2\0\0\20template_string\blua\1\0\1\tjava\1\1\2\0\0\vstring\1\0\1\rcheck_ts\2\24nvim-autopairs.rule\1\0\3\17map_complete\2\vmap_cr\1\16auto_select\2$nvim-autopairs.completion.compe\nsetup\19nvim-autopairs\frequire\5€€À™\4\0" },
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-cheat.sh"] = {
    commands = { "Cheat" },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/nvim-cheat.sh"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-dap"] = {
    after = { "nvim-dap-ui", "nvim-dap-python", "nvim-dap-virtual-text", "telescope-dap.nvim", "DAPInstall.nvim" },
    commands = { "DAP" },
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20debugger-config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/nvim-dap"
  },
  ["nvim-dap-python"] = {
    config = { "\27LJ\2\nŠ\1\0\0\5\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0009\2\4\0029\2\5\2'\4\6\0B\2\2\2'\3\a\0&\2\3\2B\0\2\1K\0\1\0&/dapinstall/python_dbg/bin/python\tdata\fstdpath\afn\bvim\nsetup\15dap-python\frequire\0" },
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/nvim-dap-python"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ndapui\frequire\0" },
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/nvim-dap-virtual-text"
  },
  ["nvim-jdtls"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/nvim-jdtls"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    commands = { "LspInstall" },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/nvim-lspinstall"
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
    commands = { "Tetris" },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/nvim-tetris"
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
  ["orgmode.nvim"] = {
    config = { "\27LJ\2\nˆ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21org_agenda_files\1\0\1\27org_default_notes_file\20~/org/notes.org\1\2\0\0\f~/org/*\nsetup\forgmode\frequire\0" },
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/orgmode.nvim"
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
  ["presenting.vim"] = {
    commands = { "PresentingStart" },
    loaded = false,
    needs_bufread = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/presenting.vim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  sniprun = {
    commands = { "SnipRun" },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/sniprun"
  },
  ["switch.vim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/switch.vim"
  },
  ["symbols-outline.nvim"] = {
    commands = { "SymbolsOutline" },
    config = { "\27LJ\2\nj\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\16show_guides\2\28highlight_hovered_items\2\nsetup\20symbols-outline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/symbols-outline.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["telescope-dap.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bdap\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["nvim-dap"] = true,
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/telescope-dap.nvim"
  },
  ["telescope-lsp-handlers.nvim"] = {
    config = { "\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\17lsp_handlers\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/telescope-lsp-handlers.nvim"
  },
  ["telescope-media-files.nvim"] = {
    config = { "\27LJ\2\nP\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\16media_files\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/telescope-media-files.nvim"
  },
  ["telescope-symbols.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/telescope-symbols.nvim"
  },
  ["telescope-ultisnips.nvim"] = {
    config = { "\27LJ\2\nN\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\14ultisnips\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/telescope-ultisnips.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-lsp-handlers.nvim", "telescope-media-files.nvim", "telescope-symbols.nvim", "telescope-ultisnips.nvim", "telescope-dap.nvim" },
    commands = { "Telescope" },
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21telescope-config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["twilight.nvim"] = {
    commands = { "twilight" },
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rtwilight\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/twilight.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/undotree"
  },
  ["vim-abolish"] = {
    commands = { "Abolish", "Subvert" },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/vim-abolish"
  },
  ["vim-bookmarks"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-bookmarks"
  },
  ["vim-dispatch"] = {
    commands = { "Dispatch", "Dispatch!", "Start!", "Make", "Focus", "Start" },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/vim-dispatch"
  },
  ["vim-dispatch-neovim"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-dispatch-neovim"
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
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/vim-eunuch"
  },
  ["vim-exchange"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-exchange"
  },
  ["vim-fetch"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-fetch"
  },
  ["vim-fish"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-fish"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-fugitive"] = {
    after = { "vim-rhubarb" },
    commands = { "G" },
    loaded = false,
    needs_bufread = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/vim-fugitive"
  },
  ["vim-indent-object"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-indent-object"
  },
  ["vim-matchup"] = {
    after_files = { "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    loaded = false,
    needs_bufread = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/vim-matchup"
  },
  ["vim-move"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-move"
  },
  ["vim-nightfly-guicolors"] = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vim-nightfly-guicolors"
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
    load_after = {
      ["vim-fugitive"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/vim-rhubarb"
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
    commands = { "Swoop" },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/opt/vim-swoop"
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
  vimade = {
    loaded = true,
    path = "/home/rajprakhar/.local/share/nvim/site/pack/packer/start/vimade"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: orgmode.nvim
time([[Config for orgmode.nvim]], true)
try_loadstring("\27LJ\2\nˆ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21org_agenda_files\1\0\1\27org_default_notes_file\20~/org/notes.org\1\2\0\0\f~/org/*\nsetup\forgmode\frequire\0", "config", "orgmode.nvim")
time([[Config for orgmode.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\nè\6\0\0\f\0&\1U6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\4\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\5\0B\1\2\0029\2\2\0005\4\6\0005\5\b\0005\6\a\0=\6\t\0055\6\n\0=\6\v\5=\5\f\4B\2\2\0016\2\0\0'\4\r\0B\2\2\0029\2\2\0025\4\15\0005\5\14\0=\5\16\4B\2\2\0016\2\0\0'\4\17\0B\2\2\0029\3\18\0004\5\3\0\18\6\1\0'\b\19\0'\t\19\0'\n\t\0B\6\4\2\18\b\6\0009\6\20\0069\t\21\0025\v\22\0B\t\2\0A\6\1\2>\6\1\5\18\6\1\0'\b\23\0'\t\23\0'\n\t\0B\6\4\2\18\b\6\0009\6\20\0069\t\24\0025\v\25\0B\t\2\0A\6\1\0?\6\0\0B\3\2\0019\3\2\0005\5\26\0004\6\0\0=\6\27\5B\3\2\0019\3\2\0005\5%\0005\6\28\0005\a\29\0=\a\30\0066\a\31\0009\a \a'\t!\0'\n\"\0'\v#\0B\a\4\2=\a$\6=\6\27\5B\3\2\1K\0\1\0\1\0\0\fpattern\5\b%s+\25 [%'%\"%)%>%]%)%}%,] \tgsub\vstring\nchars\1\6\0\0\6{\6[\6(\6\"\6'\1\0\5\fend_key\6$\bmap\n<M-e>\16check_comma\2\15hightlight\vSearch\tkeys\31qwertyuiopzxcvbnmasdfghjkl\14fast_wrap\1\0\0\1\2\0\0\rfunction\19is_not_ts_node\6$\1\3\0\0\vstring\fcomment\15is_ts_node\14with_pair\6%\14add_rules\28nvim-autopairs.ts-conds\14autopairs\1\0\0\1\0\1\venable\2\28nvim-treesitter.configs\14ts_config\15javascript\1\2\0\0\20template_string\blua\1\0\1\tjava\1\1\2\0\0\vstring\1\0\1\rcheck_ts\2\24nvim-autopairs.rule\1\0\3\17map_complete\2\vmap_cr\1\16auto_select\2$nvim-autopairs.completion.compe\nsetup\19nvim-autopairs\frequire\5€€À™\4\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Lf lua require("packer.load")({'lf.vim'}, { cmd = "Lf", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Abolish lua require("packer.load")({'vim-abolish'}, { cmd = "Abolish", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Subvert lua require("packer.load")({'vim-abolish'}, { cmd = "Subvert", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Minimap lua require("packer.load")({'minimap.vim'}, { cmd = "Minimap", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Dispatch lua require("packer.load")({'vim-dispatch'}, { cmd = "Dispatch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined Dispatch! ++once lua require"packer.load"({'vim-dispatch'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined Start! ++once lua require"packer.load"({'vim-dispatch'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file PresentingStart lua require("packer.load")({'presenting.vim'}, { cmd = "PresentingStart", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Focus lua require("packer.load")({'vim-dispatch'}, { cmd = "Focus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Tetris lua require("packer.load")({'nvim-tetris'}, { cmd = "Tetris", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Join lua require("packer.load")({'Join'}, { cmd = "Join", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Trouble lua require("packer.load")({'lsp-trouble.nvim'}, { cmd = "Trouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file DAP lua require("packer.load")({'nvim-dap'}, { cmd = "DAP", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Cheat lua require("packer.load")({'nvim-cheat.sh'}, { cmd = "Cheat", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file TZMinimalist lua require("packer.load")({'TrueZen.nvim'}, { cmd = "TZMinimalist", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Codi lua require("packer.load")({'codi.vim'}, { cmd = "Codi", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file twilight lua require("packer.load")({'twilight.nvim'}, { cmd = "twilight", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file SymbolsOutline lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutline", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Swoop lua require("packer.load")({'vim-swoop'}, { cmd = "Swoop", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file LspInstall lua require("packer.load")({'nvim-lspinstall'}, { cmd = "LspInstall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Start lua require("packer.load")({'vim-dispatch'}, { cmd = "Start", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file G lua require("packer.load")({'vim-fugitive'}, { cmd = "G", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Make lua require("packer.load")({'vim-dispatch'}, { cmd = "Make", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file SnipRun lua require("packer.load")({'sniprun'}, { cmd = "SnipRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file DiffviewOpen lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType java ++once lua require("packer.load")({'nvim-jdtls'}, { ft = "java" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'vim-matchup'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
