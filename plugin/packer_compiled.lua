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
local package_path_str = "/home/rajp/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/rajp/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/rajp/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/rajp/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/rajp/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/DAPInstall.nvim"
  },
  Join = {
    commands = { "Join" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/Join"
  },
  ["TrueZen.nvim"] = {
    commands = { "TZMinimalist", "TZFocus", "TZAtaraxis" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/TrueZen.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/cmp-calc"
  },
  ["cmp-emoji"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/cmp-emoji"
  },
  ["cmp-latex-symbols"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/cmp-latex-symbols"
  },
  ["cmp-nuspell"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/cmp-nuspell"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/home/rajp/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua"
  },
  ["cmp-nvim-ultisnips"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/cmp-nvim-ultisnips"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  ["codi.vim"] = {
    commands = { "Codi" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/codi.vim"
  },
  ["copilot.vim"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/copilot.vim"
  },
  cpsm = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/cpsm"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["diffview.nvim"] = {
    commands = { "DiffviewOpen" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/diffview.nvim"
  },
  ["emmet-vim"] = {
    config = { "\27LJ\2\n=\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\n<spc>\26user_emmet_leader_key\6g\bvim\0" },
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  everforest = {
    commands = { "colo everforest" },
    config = { "\27LJ\2\n<\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\thard\26everforest_background\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/everforest"
  },
  ["fzy-lua-native"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/fzy-lua-native"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18nv-galaxyline\frequire\0" },
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["github-nvim-theme"] = {
    commands = { "colo github" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/github-nvim-theme"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gruvbox-material"] = {
    commands = { "colo gruvbox-material" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/gruvbox-material"
  },
  ["headlines.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14headlines\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/headlines.nvim"
  },
  ["impatient.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\19enable_profile\14impatient\frequire\0" },
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/impatient.nvim"
  },
  ["incsearch-easymotion.vim"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/incsearch-easymotion.vim"
  },
  ["incsearch-fuzzy.vim"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/incsearch-fuzzy.vim"
  },
  ["incsearch.vim"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/incsearch.vim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lf.vim"] = {
    commands = { "Lf" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/lf.vim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/lua-dev.nvim"
  },
  ["material.nvim"] = {
    config = { "\27LJ\2\nî\6\0\0\6\0\30\0/6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\a\0005\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\2B\0\2\0016\0\0\0009\0\1\0'\1\17\0=\1\16\0006\0\0\0009\0\18\0009\0\19\0'\2\20\0'\3\21\0'\4\22\0005\5\23\0B\0\5\0016\0\0\0009\0\18\0009\0\19\0'\2\20\0'\3\24\0'\4\25\0005\5\26\0B\0\5\0016\0\0\0009\0\18\0009\0\19\0'\2\20\0'\3\27\0'\4\28\0005\5\29\0B\0\5\1K\0\1\0\1\0\1\fnoremap\0028:lua require('material.functions').toggle_eob()<CR>\14<leader>~\1\0\2\vsilent\2\fnoremap\2F<Cmd>lua require('material.functions').change_style('darker')<CR>\15<leader>md\1\0\2\vsilent\2\fnoremap\2G<Cmd>lua require('material.functions').change_style('lighter')<CR>\15<leader>ml\6n\20nvim_set_keymap\bapi\f#d17CB4\28material_variable_color\fdisable\1\0\3\16term_colors\1\14eob_lines\2\15background\1\18text_contrast\1\0\2\flighter\1\vdarker\1\21contrast_windows\1\5\0\0\rterminal\vpacker\aqf\rNvimTree\fitalics\1\0\5\15fisnctions\1\fstrings\1\rcomments\2\rKeywords\2\14variables\2\1\0\2\fborders\2\rcontrast\2\nsetup\rmaterial\frequire\15deep ocean\19material_style\6g\bvim\0" },
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/material.nvim"
  },
  melange = {
    commands = { "colo melange" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/melange"
  },
  ["minimap.vim"] = {
    commands = { "Minimap" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/minimap.vim"
  },
  ["mkdir.nvim"] = {
    config = { "\27LJ\2\n%\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\nmkdir\frequire\0" },
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/mkdir.nvim"
  },
  ["monokai.nvim"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/monokai.nvim"
  },
  neomux = {
    commands = { "Neomux" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/neomux"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/null-ls.nvim"
  },
  ["numb.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tnumb\frequire\0" },
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/numb.nvim"
  },
  ["nvcode-color-schemes.vim"] = {
    commands = { "colo gruvbox", "colo nvcode", "colo aurora" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/nvcode-color-schemes.vim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n©\a\0\0\14\0-\1Y6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\1\18\4\2\0009\2\4\2'\5\5\0009\6\6\0005\b\b\0005\t\a\0=\t\t\bB\6\2\0A\2\2\0016\2\0\0'\4\n\0B\2\2\0026\3\0\0'\5\v\0B\3\2\0029\4\f\0025\6\r\0005\a\15\0005\b\14\0=\b\16\a5\b\17\0=\b\18\a=\a\19\6B\4\2\0016\4\0\0'\6\20\0B\4\2\0029\4\f\0045\6\22\0005\a\21\0=\a\23\6B\4\2\0016\4\0\0'\6\24\0B\4\2\0029\5\25\0024\a\3\0\18\b\3\0'\n\26\0'\v\26\0'\f\16\0B\b\4\2\18\n\b\0009\b\27\b9\v\28\0045\r\29\0B\v\2\0A\b\1\2>\b\1\a\18\b\3\0'\n\30\0'\v\30\0'\f\16\0B\b\4\2\18\n\b\0009\b\27\b9\v\31\0045\r \0B\v\2\0A\b\1\0?\b\0\0B\5\2\0019\5\f\0025\a!\0004\b\0\0=\b\"\aB\5\2\0019\5\f\0025\a,\0005\b#\0005\t$\0=\t%\b6\t&\0009\t'\t'\v(\0'\f)\0'\r*\0B\t\4\2=\t+\b=\b\"\aB\5\2\1K\0\1\0\1\0\0\fpattern\5\b%s+\25 [%'%\"%)%>%]%)%}%,] \tgsub\vstring\nchars\1\6\0\0\6{\6[\6(\6\"\6'\1\0\5\bmap\n<M-e>\15hightlight\vSearch\16check_comma\2\fend_key\6$\tkeys\31qwertyuiopzxcvbnmasdfghjkl\14fast_wrap\1\0\0\1\2\0\0\rfunction\19is_not_ts_node\6$\1\3\0\0\vstring\fcomment\15is_ts_node\14with_pair\6%\14add_rules\28nvim-autopairs.ts-conds\14autopairs\1\0\0\1\0\1\venable\2\28nvim-treesitter.configs\14ts_config\15javascript\1\2\0\0\20template_string\blua\1\0\1\tjava\1\1\2\0\0\vstring\1\0\3\fmap_c_w\2\rcheck_ts\2\21disable_in_macro\2\nsetup\24nvim-autopairs.rule\19nvim-autopairs\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\frequire\5ÄÄ¿ô\4\0" },
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-cheat.sh"] = {
    commands = { "Cheat" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/nvim-cheat.sh"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rnvim-cmp\frequire\0" },
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    after = { "telescope-dap.nvim", "nvim-dap-ui", "nvim-dap-virtual-text", "nvim-dap-python", "DAPInstall.nvim" },
    commands = { "DAP" },
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20debugger-config\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/nvim-dap"
  },
  ["nvim-dap-python"] = {
    config = { "\27LJ\2\nä\1\0\0\5\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0009\2\4\0029\2\5\2'\4\6\0B\2\2\2'\3\a\0&\2\3\2B\0\2\1K\0\1\0&/dapinstall/python_dbg/bin/python\tdata\fstdpath\afn\bvim\nsetup\15dap-python\frequire\0" },
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/nvim-dap-python"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ndapui\frequire\0" },
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/nvim-dap-virtual-text"
  },
  ["nvim-jdtls"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/nvim-jdtls"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    commands = { "LspInstall" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/nvim-lspinstall"
  },
  ["nvim-lsputils"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/nvim-lsputils"
  },
  ["nvim-luapad"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/nvim-luapad"
  },
  ["nvim-neoclip.lua"] = {
    config = { "\27LJ\2\nÉ\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\tkeys\1\0\0\6i\1\0\0\1\0\3\npaste\n<m-p>\16pate_behind\n<m-k>\vselect\t<CR>\nsetup\fneoclip\frequire\0" },
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/nvim-neoclip.lua"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n`\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\22background_colour\f#000000\ftimeout\3∏\23\nsetup\vnotify\frequire\0" },
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/nvim-notify"
  },
  ["nvim-peekup"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/nvim-peekup"
  },
  ["nvim-tetris"] = {
    commands = { "Tetris" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/nvim-tetris"
  },
  ["nvim-transparent"] = {
    commands = { "TransparentToggle" },
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\venable\1\nsetup\16transparent\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/nvim-transparent"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    config = { "\27LJ\2\n¢\15\0\0\a\0Y\0„\0016\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\6\0006\0\a\0'\2\b\0B\0\2\0029\0\t\0004\1 \0005\2\v\0005\3\n\0=\3\f\2\18\3\0\0'\5\r\0B\3\2\2=\3\14\2>\2\1\0015\2\16\0005\3\15\0=\3\f\2\18\3\0\0'\5\17\0B\3\2\2=\3\14\2>\2\2\0015\2\18\0\18\3\0\0'\5\19\0B\3\2\2=\3\14\2>\2\3\0015\2\20\0\18\3\0\0'\5\21\0B\3\2\2=\3\14\2>\2\4\0015\2\22\0\18\3\0\0'\5\23\0B\3\2\2=\3\14\2>\2\5\0015\2\24\0\18\3\0\0'\5\25\0B\3\2\2=\3\14\2>\2\6\0015\2\26\0\18\3\0\0'\5\27\0B\3\2\2=\3\14\2>\2\a\0015\2\29\0005\3\28\0=\3\f\2\18\3\0\0'\5\30\0B\3\2\2=\3\14\2>\2\b\0015\2\31\0\18\3\0\0'\5 \0B\3\2\2=\3\14\2>\2\t\0015\2!\0\18\3\0\0'\5 \0B\3\2\2=\3\14\2>\2\n\0015\2\"\0\18\3\0\0'\5#\0B\3\2\2=\3\14\2>\2\v\0015\2$\0\18\3\0\0'\5%\0B\3\2\2=\3\14\2>\2\f\0015\2&\0\18\3\0\0'\5'\0B\3\2\2=\3\14\2>\2\r\0015\2(\0\18\3\0\0'\5)\0B\3\2\2=\3\14\2>\2\14\0015\2*\0\18\3\0\0'\5+\0B\3\2\2=\3\14\2>\2\15\0015\2,\0\18\3\0\0'\5-\0B\3\2\2=\3\14\2>\2\16\0015\2.\0\18\3\0\0'\5/\0B\3\2\2=\3\14\2>\2\17\0015\0020\0\18\3\0\0'\0051\0B\3\2\2=\3\14\2>\2\18\0015\0022\0\18\3\0\0'\0053\0B\3\2\2=\3\14\2>\2\19\0015\0024\0\18\3\0\0'\0055\0B\3\2\2=\3\14\2>\2\20\0015\0026\0\18\3\0\0'\0057\0B\3\2\2=\3\14\2>\2\21\0015\0028\0\18\3\0\0'\0059\0B\3\2\2=\3\14\2>\2\22\0015\2:\0\18\3\0\0'\5;\0B\3\2\2=\3\14\2>\2\23\0015\2<\0\18\3\0\0'\5=\0B\3\2\2=\3\14\2>\2\24\0015\2>\0\18\3\0\0'\5?\0B\3\2\2=\3\14\2>\2\25\0015\2@\0\18\3\0\0'\5A\0B\3\2\2=\3\14\2>\2\26\0015\2B\0\18\3\0\0'\5C\0B\3\2\2=\3\14\2>\2\27\0015\2D\0\18\3\0\0'\5E\0B\3\2\2=\3\14\2>\2\28\0015\2G\0005\3F\0=\3\f\2\18\3\0\0'\5H\0B\3\2\2=\3\14\2>\2\29\0015\2I\0\18\3\0\0'\5J\0B\3\2\2=\3\14\2>\2\30\0015\2K\0\18\3\0\0'\5L\0B\3\2\2=\3\14\2>\2\31\0016\2\a\0'\4M\0B\2\2\0029\2N\0025\4O\0005\5P\0005\6Q\0=\6R\5=\5S\0045\5T\0=\1U\5=\5V\0045\5W\0=\5X\4B\2\2\1K\0\1\0\tview\1\0\1\16auto_resize\2\rmappings\tlist\1\0\1\16custom_only\2\16diagnostics\nicons\1\0\4\fwarning\bÔÅ±\tinfo\bÔÅö\nerror\bÔÅó\thint\bÔÅ™\1\0\1\venable\2\1\0\4\15update_cwd\2\16auto_resize\2\15auto_close\2\18hijack_cursor\2\nsetup\14nvim-tree\16toggle_help\1\0\1\bkey\ag?\nclose\1\0\1\bkey\6q\vdir_up\1\0\0\1\3\0\0\t<BS>\6-\18next_git_item\1\0\1\bkey\a]c\18prev_git_item\1\0\1\bkey\a[c\23copy_absolute_path\1\0\1\bkey\agy\14copy_path\1\0\1\bkey\6Y\14copy_name\1\0\1\bkey\6y\npaste\1\0\1\bkey\6p\tcopy\1\0\1\bkey\6c\bcut\1\0\1\bkey\6x\16full_rename\1\0\1\bkey\n<C-r>\vrename\1\0\1\bkey\6r\vremove\1\0\1\bkey\6d\vcreate\1\0\1\bkey\6a\frefresh\1\0\1\bkey\6R\20toggle_dotfiles\1\0\1\bkey\6H\19toggle_ignored\1\0\1\bkey\6I\17last_sibling\1\0\1\bkey\6J\18first_sibling\1\0\1\bkey\6K\fpreview\1\0\1\bkey\n<Tab>\1\0\1\bkey\v<S-CR>\15close_node\1\0\1\bkey\6h\16parent_node\1\0\0\1\3\0\0\6P\6h\17next_sibling\1\0\1\bkey\6>\17prev_sibling\1\0\1\bkey\6<\vtabnew\1\0\1\bkey\n<C-t>\nsplit\1\0\1\bkey\n<C-x>\vvsplit\1\0\1\bkey\n<C-v>\acd\1\0\0\1\3\0\0\19<1-RightMouse>\n<C-]>\acb\tedit\bkey\1\2\0\0\6n\1\5\0\0\t<CR>\6o\6l\18<2-LeftMouse>\23nvim_tree_callback\21nvim-tree.config\frequire\29nvim_tree_indent_markers\1\4\0\0\14dashboard\rstartify\rquickfix\29nvim_tree_auto_ignore_ft\1\6\0\0\t.git\f.github\v.cache\rlog.json\n.root\21nvim_tree_ignore\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  nvim_context_vt = {
    loaded = true,
    needs_bufread = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/nvim_context_vt"
  },
  nvimesweeper = {
    commands = { "Nvimesweeper" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/nvimesweeper"
  },
  ["org-bullets.nvim"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/org-bullets.nvim"
  },
  ["orgmode.nvim"] = {
    config = { "\27LJ\2\nã\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21org_agenda_files\1\0\1\27org_default_notes_file\20~/org/notes.org\1\2\0\0\15~/org/**/*\nsetup\forgmode\frequire\0" },
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/orgmode.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  popfix = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/popfix"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["presence.nvim"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/presence.nvim"
  },
  ["presenting.vim"] = {
    commands = { "PresentingStart" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/presenting.vim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  sniprun = {
    commands = { "SnipRun" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/sniprun"
  },
  sonokai = {
    commands = { "colo sonokai" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/sonokai"
  },
  ["specs.nvim"] = {
    config = { "\27LJ\2\n†\2\0\0\a\0\r\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0006\4\0\0'\6\1\0B\4\2\0029\4\5\4=\4\6\0036\4\0\0'\6\1\0B\4\2\0029\4\a\4=\4\b\3=\3\t\0024\3\0\0=\3\n\0025\3\v\0=\3\f\2B\0\2\1K\0\1\0\20ignore_buftypes\1\0\1\vnofile\2\21ignore_filetypes\npopup\fresizer\19shrink_resizer\nfader\17linear_fader\1\0\5\rdelay_ms\3\0\vinc_ms\3\4\nwidth\0032\nblend\3\20\nwinhl\nPMenu\1\0\2\15show_jumps\2\rmin_jump\3\5\nsetup\nspecs\frequire\0" },
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/specs.nvim"
  },
  ["sqls.nvim"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/sqls.nvim"
  },
  ["switch.vim"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/switch.vim"
  },
  ["symbols-outline.nvim"] = {
    commands = { "SymbolsOutline" },
    config = { "\27LJ\2\nj\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\28highlight_hovered_items\2\16show_guides\2\nsetup\20symbols-outline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/symbols-outline.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["telescope-dap.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bdap\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["nvim-dap"] = true,
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/telescope-dap.nvim"
  },
  ["telescope-lsp-handlers.nvim"] = {
    config = { "\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\17lsp_handlers\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/telescope-lsp-handlers.nvim"
  },
  ["telescope-media-files.nvim"] = {
    config = { "\27LJ\2\nP\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\16media_files\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/telescope-media-files.nvim"
  },
  ["telescope-symbols.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/telescope-symbols.nvim"
  },
  ["telescope-ultisnips.nvim"] = {
    config = { "\27LJ\2\nN\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\14ultisnips\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/telescope-ultisnips.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-dap.nvim", "telescope-lsp-handlers.nvim", "telescope-media-files.nvim", "telescope-symbols.nvim", "telescope-ultisnips.nvim" },
    commands = { "Telescope" },
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21telescope-config\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["tokyodark.nvim"] = {
    commands = { "colo tokyodark" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/tokyodark.nvim"
  },
  ["twilight.nvim"] = {
    commands = { "colo twilight" },
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rtwilight\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/twilight.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/undotree"
  },
  ["venn.nvim"] = {
    commands = { "Venn" },
    config = { "\27LJ\2\n≤\4\0\0\b\0\28\0K6\0\0\0009\0\1\0006\2\0\0009\2\2\0029\2\3\2B\0\2\2\a\0\4\0X\0016Ä6\1\0\0009\1\2\1+\2\2\0=\2\3\0016\1\0\0009\1\5\1'\3\6\0B\1\2\0016\1\0\0009\1\a\0019\1\b\1)\3\0\0'\4\t\0'\5\n\0'\6\v\0005\a\f\0B\1\6\0016\1\0\0009\1\a\0019\1\b\1)\3\0\0'\4\t\0'\5\r\0'\6\14\0005\a\15\0B\1\6\0016\1\0\0009\1\a\0019\1\b\1)\3\0\0'\4\t\0'\5\16\0'\6\17\0005\a\18\0B\1\6\0016\1\0\0009\1\a\0019\1\b\1)\3\0\0'\4\t\0'\5\19\0'\6\20\0005\a\21\0B\1\6\0016\1\0\0009\1\a\0019\1\b\1)\3\0\0'\4\22\0'\5\23\0'\6\24\0005\a\25\0B\1\6\1X\1\fÄ6\1\0\0009\1\5\1'\3\26\0B\1\2\0016\1\0\0009\1\5\1'\3\27\0B\1\2\0016\1\0\0009\1\2\1+\2\0\0=\2\3\1K\0\1\0\22mapclear <buffer>\17setlocal ve=\1\0\1\fnoremap\2\14:VBox<cr>\6f\avt\1\0\1\fnoremap\2\20<C-v>h:VBox<cr>\6H\1\0\1\fnoremap\2\20<C-v>l:VBox<cr>\6L\1\0\1\fnoremap\2\20<C-v>k:VBox<cr>\6K\1\0\1\fnoremap\2\20<C-v>j:VBox<cr>\6J\6n\24nvim_buf_set_keymap\bapi\20setlocal ve=all\bcmd\bnil\17venn_enabled\6b\finspect\bvimé\1\1\0\6\0\n\0\f6\0\0\0003\1\2\0=\1\1\0006\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\27:lua toggle_venn()<cr>\14<leader>v\6n\20nvim_set_keymap\bapi\bvim\0\16toggle_venn\a_G\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/venn.nvim"
  },
  ["vim-abolish"] = {
    commands = { "Abolish", "Subvert" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/vim-abolish"
  },
  ["vim-bookmarks"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/vim-bookmarks"
  },
  ["vim-dadbod"] = {
    commands = { "DB" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/vim-dadbod"
  },
  ["vim-dadbod-completion"] = {
    after_files = { "/home/rajp/.local/share/nvim/site/pack/packer/opt/vim-dadbod-completion/after/plugin/vim_dadbod_completion.lua", "/home/rajp/.local/share/nvim/site/pack/packer/opt/vim-dadbod-completion/after/plugin/vim_dadbod_completion.vim" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/vim-dadbod-completion"
  },
  ["vim-dadbod-ui"] = {
    commands = { "DBUI" },
    config = { "\27LJ\2\ni\0\0\3\0\5\0\t6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0)\1\1\0=\1\4\0K\0\1\0%db_ui_auto_execute_table_helpers\6g\23packadd vim-dadbod\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/vim-dadbod-ui"
  },
  ["vim-dispatch"] = {
    commands = { "Dispatch", "Dispatch!", "Start!", "Make", "Focus", "Start" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/vim-dispatch"
  },
  ["vim-dispatch-neovim"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/vim-dispatch-neovim"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/vim-easymotion"
  },
  ["vim-eunuch"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/vim-eunuch"
  },
  ["vim-exchange"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/vim-exchange"
  },
  ["vim-fetch"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/vim-fetch"
  },
  ["vim-fish"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/vim-fish"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-fugitive"] = {
    after = { "vim-rhubarb" },
    commands = { "G" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/vim-fugitive"
  },
  ["vim-hybrid-material"] = {
    commands = { "colo hybrid_material", "colo hybrid_reverse" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/vim-hybrid-material"
  },
  ["vim-indent-object"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/vim-indent-object"
  },
  ["vim-lion"] = {
    config = { "\27LJ\2\n5\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\24lion_squeeze_spaces\6g\bvim\0" },
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/vim-lion"
  },
  ["vim-matchup"] = {
    after_files = { "/home/rajp/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/vim-matchup"
  },
  ["vim-move"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/vim-move"
  },
  ["vim-nightfly-guicolors"] = {
    commands = { "colo nightfly" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/vim-nightfly-guicolors"
  },
  ["vim-pythonsense"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/vim-pythonsense"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rhubarb"] = {
    load_after = {
      ["vim-fugitive"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/vim-rhubarb"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  ["vim-sayonara"] = {
    commands = { "Sayonara" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/vim-sayonara"
  },
  ["vim-signature"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/vim-signature"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-stay"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/vim-stay"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-swap"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/vim-swap"
  },
  ["vim-swoop"] = {
    commands = { "Swoop" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/vim-swoop"
  },
  ["vim-table-mode"] = {
    commands = { "TableModeToggle" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/vim-table-mode"
  },
  ["vim-textobj-entire"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/vim-textobj-entire"
  },
  ["vim-textobj-indent"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/vim-textobj-indent"
  },
  ["vim-textobj-line"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/vim-textobj-line"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/vim-textobj-user"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  vimade = {
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/vimade"
  },
  ["wandbox.nvim"] = {
    config = { "\27LJ\2\n˜\1\0\0\6\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2R<cmd>lua require(\"wandbox\").run({client_list = {'wget'}, open_qf = true})<CR>\14<space>wa\6n\20nvim_set_keymap\bapi\bvim\16client_list\1\0\0\1\2\0\0\tcurl\nsetup\fwandbox\frequire\0" },
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/wandbox.nvim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  },
  ["wilder.nvim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/start/wilder.nvim"
  },
  ["windline.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23wlsample.evil_line\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/rajp/.local/share/nvim/site/pack/packer/opt/windline.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: mkdir.nvim
time([[Config for mkdir.nvim]], true)
try_loadstring("\27LJ\2\n%\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\nmkdir\frequire\0", "config", "mkdir.nvim")
time([[Config for mkdir.nvim]], false)
-- Config for: impatient.nvim
time([[Config for impatient.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\19enable_profile\14impatient\frequire\0", "config", "impatient.nvim")
time([[Config for impatient.nvim]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18nv-galaxyline\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: numb.nvim
time([[Config for numb.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tnumb\frequire\0", "config", "numb.nvim")
time([[Config for numb.nvim]], false)
-- Config for: wandbox.nvim
time([[Config for wandbox.nvim]], true)
try_loadstring("\27LJ\2\n˜\1\0\0\6\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2R<cmd>lua require(\"wandbox\").run({client_list = {'wget'}, open_qf = true})<CR>\14<space>wa\6n\20nvim_set_keymap\bapi\bvim\16client_list\1\0\0\1\2\0\0\tcurl\nsetup\fwandbox\frequire\0", "config", "wandbox.nvim")
time([[Config for wandbox.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: specs.nvim
time([[Config for specs.nvim]], true)
try_loadstring("\27LJ\2\n†\2\0\0\a\0\r\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0006\4\0\0'\6\1\0B\4\2\0029\4\5\4=\4\6\0036\4\0\0'\6\1\0B\4\2\0029\4\a\4=\4\b\3=\3\t\0024\3\0\0=\3\n\0025\3\v\0=\3\f\2B\0\2\1K\0\1\0\20ignore_buftypes\1\0\1\vnofile\2\21ignore_filetypes\npopup\fresizer\19shrink_resizer\nfader\17linear_fader\1\0\5\rdelay_ms\3\0\vinc_ms\3\4\nwidth\0032\nblend\3\20\nwinhl\nPMenu\1\0\2\15show_jumps\2\rmin_jump\3\5\nsetup\nspecs\frequire\0", "config", "specs.nvim")
time([[Config for specs.nvim]], false)
-- Config for: wilder.nvim
time([[Config for wilder.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "wilder.nvim")
time([[Config for wilder.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n©\a\0\0\14\0-\1Y6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\1\18\4\2\0009\2\4\2'\5\5\0009\6\6\0005\b\b\0005\t\a\0=\t\t\bB\6\2\0A\2\2\0016\2\0\0'\4\n\0B\2\2\0026\3\0\0'\5\v\0B\3\2\0029\4\f\0025\6\r\0005\a\15\0005\b\14\0=\b\16\a5\b\17\0=\b\18\a=\a\19\6B\4\2\0016\4\0\0'\6\20\0B\4\2\0029\4\f\0045\6\22\0005\a\21\0=\a\23\6B\4\2\0016\4\0\0'\6\24\0B\4\2\0029\5\25\0024\a\3\0\18\b\3\0'\n\26\0'\v\26\0'\f\16\0B\b\4\2\18\n\b\0009\b\27\b9\v\28\0045\r\29\0B\v\2\0A\b\1\2>\b\1\a\18\b\3\0'\n\30\0'\v\30\0'\f\16\0B\b\4\2\18\n\b\0009\b\27\b9\v\31\0045\r \0B\v\2\0A\b\1\0?\b\0\0B\5\2\0019\5\f\0025\a!\0004\b\0\0=\b\"\aB\5\2\0019\5\f\0025\a,\0005\b#\0005\t$\0=\t%\b6\t&\0009\t'\t'\v(\0'\f)\0'\r*\0B\t\4\2=\t+\b=\b\"\aB\5\2\1K\0\1\0\1\0\0\fpattern\5\b%s+\25 [%'%\"%)%>%]%)%}%,] \tgsub\vstring\nchars\1\6\0\0\6{\6[\6(\6\"\6'\1\0\5\bmap\n<M-e>\15hightlight\vSearch\16check_comma\2\fend_key\6$\tkeys\31qwertyuiopzxcvbnmasdfghjkl\14fast_wrap\1\0\0\1\2\0\0\rfunction\19is_not_ts_node\6$\1\3\0\0\vstring\fcomment\15is_ts_node\14with_pair\6%\14add_rules\28nvim-autopairs.ts-conds\14autopairs\1\0\0\1\0\1\venable\2\28nvim-treesitter.configs\14ts_config\15javascript\1\2\0\0\20template_string\blua\1\0\1\tjava\1\1\2\0\0\vstring\1\0\3\fmap_c_w\2\rcheck_ts\2\21disable_in_macro\2\nsetup\24nvim-autopairs.rule\19nvim-autopairs\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\frequire\5ÄÄ¿ô\4\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: emmet-vim
time([[Config for emmet-vim]], true)
try_loadstring("\27LJ\2\n=\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\n<spc>\26user_emmet_leader_key\6g\bvim\0", "config", "emmet-vim")
time([[Config for emmet-vim]], false)
-- Config for: orgmode.nvim
time([[Config for orgmode.nvim]], true)
try_loadstring("\27LJ\2\nã\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21org_agenda_files\1\0\1\27org_default_notes_file\20~/org/notes.org\1\2\0\0\15~/org/**/*\nsetup\forgmode\frequire\0", "config", "orgmode.nvim")
time([[Config for orgmode.nvim]], false)
-- Config for: nvim-neoclip.lua
time([[Config for nvim-neoclip.lua]], true)
try_loadstring("\27LJ\2\nÉ\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\tkeys\1\0\0\6i\1\0\0\1\0\3\npaste\n<m-p>\16pate_behind\n<m-k>\vselect\t<CR>\nsetup\fneoclip\frequire\0", "config", "nvim-neoclip.lua")
time([[Config for nvim-neoclip.lua]], false)
-- Config for: material.nvim
time([[Config for material.nvim]], true)
try_loadstring("\27LJ\2\nî\6\0\0\6\0\30\0/6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\a\0005\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\2B\0\2\0016\0\0\0009\0\1\0'\1\17\0=\1\16\0006\0\0\0009\0\18\0009\0\19\0'\2\20\0'\3\21\0'\4\22\0005\5\23\0B\0\5\0016\0\0\0009\0\18\0009\0\19\0'\2\20\0'\3\24\0'\4\25\0005\5\26\0B\0\5\0016\0\0\0009\0\18\0009\0\19\0'\2\20\0'\3\27\0'\4\28\0005\5\29\0B\0\5\1K\0\1\0\1\0\1\fnoremap\0028:lua require('material.functions').toggle_eob()<CR>\14<leader>~\1\0\2\vsilent\2\fnoremap\2F<Cmd>lua require('material.functions').change_style('darker')<CR>\15<leader>md\1\0\2\vsilent\2\fnoremap\2G<Cmd>lua require('material.functions').change_style('lighter')<CR>\15<leader>ml\6n\20nvim_set_keymap\bapi\f#d17CB4\28material_variable_color\fdisable\1\0\3\16term_colors\1\14eob_lines\2\15background\1\18text_contrast\1\0\2\flighter\1\vdarker\1\21contrast_windows\1\5\0\0\rterminal\vpacker\aqf\rNvimTree\fitalics\1\0\5\15fisnctions\1\fstrings\1\rcomments\2\rKeywords\2\14variables\2\1\0\2\fborders\2\rcontrast\2\nsetup\rmaterial\frequire\15deep ocean\19material_style\6g\bvim\0", "config", "material.nvim")
time([[Config for material.nvim]], false)
-- Config for: vim-lion
time([[Config for vim-lion]], true)
try_loadstring("\27LJ\2\n5\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\24lion_squeeze_spaces\6g\bvim\0", "config", "vim-lion")
time([[Config for vim-lion]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n`\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\22background_colour\f#000000\ftimeout\3∏\23\nsetup\vnotify\frequire\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\rnvim-cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Focus lua require("packer.load")({'vim-dispatch'}, { cmd = "Focus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Start lua require("packer.load")({'vim-dispatch'}, { cmd = "Start", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Abolish lua require("packer.load")({'vim-abolish'}, { cmd = "Abolish", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Subvert lua require("packer.load")({'vim-abolish'}, { cmd = "Subvert", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DAP lua require("packer.load")({'nvim-dap'}, { cmd = "DAP", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DB lua require("packer.load")({'vim-dadbod'}, { cmd = "DB", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file PresentingStart lua require("packer.load")({'presenting.vim'}, { cmd = "PresentingStart", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SnipRun lua require("packer.load")({'sniprun'}, { cmd = "SnipRun", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined colo github ++once lua require"packer.load"({'github-nvim-theme'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LspInstall lua require("packer.load")({'nvim-lspinstall'}, { cmd = "LspInstall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined colo gruvbox-material ++once lua require"packer.load"({'gruvbox-material'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined colo hybrid_material ++once lua require"packer.load"({'vim-hybrid-material'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined colo hybrid_reverse ++once lua require"packer.load"({'vim-hybrid-material'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutline lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutline", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Join lua require("packer.load")({'Join'}, { cmd = "Join", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TableModeToggle lua require("packer.load")({'vim-table-mode'}, { cmd = "TableModeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DiffviewOpen lua require("packer.load")({'diffview.nvim'}, { cmd = "DiffviewOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined colo melange ++once lua require"packer.load"({'melange'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TZMinimalist lua require("packer.load")({'TrueZen.nvim'}, { cmd = "TZMinimalist", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TZFocus lua require("packer.load")({'TrueZen.nvim'}, { cmd = "TZFocus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Minimap lua require("packer.load")({'minimap.vim'}, { cmd = "Minimap", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Tetris lua require("packer.load")({'nvim-tetris'}, { cmd = "Tetris", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined colo gruvbox ++once lua require"packer.load"({'nvcode-color-schemes.vim'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined colo nightfly ++once lua require"packer.load"({'vim-nightfly-guicolors'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TransparentToggle lua require("packer.load")({'nvim-transparent'}, { cmd = "TransparentToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Make lua require("packer.load")({'vim-dispatch'}, { cmd = "Make", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neomux lua require("packer.load")({'neomux'}, { cmd = "Neomux", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined Dispatch! ++once lua require"packer.load"({'vim-dispatch'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Dispatch lua require("packer.load")({'vim-dispatch'}, { cmd = "Dispatch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TZAtaraxis lua require("packer.load")({'TrueZen.nvim'}, { cmd = "TZAtaraxis", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file G lua require("packer.load")({'vim-fugitive'}, { cmd = "G", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Sayonara lua require("packer.load")({'vim-sayonara'}, { cmd = "Sayonara", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined colo everforest ++once lua require"packer.load"({'everforest'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Cheat lua require("packer.load")({'nvim-cheat.sh'}, { cmd = "Cheat", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined colo tokyodark ++once lua require"packer.load"({'tokyodark.nvim'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined colo nvcode ++once lua require"packer.load"({'nvcode-color-schemes.vim'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined colo aurora ++once lua require"packer.load"({'nvcode-color-schemes.vim'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined colo twilight ++once lua require"packer.load"({'twilight.nvim'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined colo sonokai ++once lua require"packer.load"({'sonokai'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DBUI lua require("packer.load")({'vim-dadbod-ui'}, { cmd = "DBUI", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Nvimesweeper lua require("packer.load")({'nvimesweeper'}, { cmd = "Nvimesweeper", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Codi lua require("packer.load")({'codi.vim'}, { cmd = "Codi", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Lf lua require("packer.load")({'lf.vim'}, { cmd = "Lf", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Swoop lua require("packer.load")({'vim-swoop'}, { cmd = "Swoop", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[au CmdUndefined Start! ++once lua require"packer.load"({'vim-dispatch'}, {}, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Venn lua require("packer.load")({'venn.nvim'}, { cmd = "Venn", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'headlines.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'cmp-nvim-lua'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType orgmode ++once lua require("packer.load")({'headlines.nvim'}, { ft = "orgmode" }, _G.packer_plugins)]]
vim.cmd [[au FileType fish ++once lua require("packer.load")({'vim-fish'}, { ft = "fish" }, _G.packer_plugins)]]
vim.cmd [[au FileType vimwiki ++once lua require("packer.load")({'headlines.nvim'}, { ft = "vimwiki" }, _G.packer_plugins)]]
vim.cmd [[au FileType rmd ++once lua require("packer.load")({'headlines.nvim'}, { ft = "rmd" }, _G.packer_plugins)]]
vim.cmd [[au FileType sql ++once lua require("packer.load")({'vim-dadbod-completion'}, { ft = "sql" }, _G.packer_plugins)]]
vim.cmd [[au FileType mysql ++once lua require("packer.load")({'vim-dadbod-completion'}, { ft = "mysql" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'vim-matchup'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/rajp/.local/share/nvim/site/pack/packer/opt/vim-fish/ftdetect/fish.vim]], true)
vim.cmd [[source /home/rajp/.local/share/nvim/site/pack/packer/opt/vim-fish/ftdetect/fish.vim]]
time([[Sourcing ftdetect script at: /home/rajp/.local/share/nvim/site/pack/packer/opt/vim-fish/ftdetect/fish.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
