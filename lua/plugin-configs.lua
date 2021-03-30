local map = vim.api.nvim_set_keymap
require('vimp')
-----------------
--  undo-tree  --
-----------------
map('n', '<F7>', ':UndotreeToggle<cr>', {noremap = true})
vim.o.undofile = true
vim.o.undodir="~/.vim/undo-dir"

--------------
--  tagbar  --
--------------
map('', '<F9>', ':TagbarToggle<cr>', {noremap = true})
-----------------
--  Ultisnips  --
-----------------
-- Trigger configuration. You need to change this to something other than <tab>
-- if you use one of completion plugins
vim.g.UltiSnipsExpandTrigger="<c-l>"
vim.g.UltiSnipsJumpForwardTrigger="<c-j>"
vim.g.UltiSnipsJumpBackwardTrigger="<c-k>"
vim.g.UltiSnipsEditSplit="vertical"

----------------
--  vim-move  --
----------------
vim.g.move_key_modifier = 'C'

------------------
--  easy-align  --
------------------
vimp.rbind('x', 'ga', '<Plug>(EasyAlign)')
vimp.rbind('n', 'ga', '<Plug>(EasyAlign)')

----------------
--  vim-stay  --
----------------
vim.cmd(':set viewoptions=cursor,folds,slash,unix')

---------------
--  sonokai  --
---------------
vim.g.sonokai_transparent_background = 1
-- Default, Atlantis, andromeda, Shusia, Maia"
vim.g.sonokai_style = 'maia'
vim.g.sonokai_better_performance = 1

----------------
--  FastFold  --
----------------
map('x', 'iz', ':<c-u>FastFoldUpdate<cr><esc>:<c-u>normal! ]zv[z<cr>', {noremap = true})
map('x', 'az', ':<c-u>FastFoldUpdate<cr><esc>:<c-u>normal! ]zV[z<cr>', {noremap = true})
vim.cmd("autocmd BufWinEnter * let b:nrrw_aucmd_create = \"let w:lastfdm = getwinvar(winnr('#'), 'lastfdm')\"")

----------------
--  vim-swap  --
----------------
vim.cmd("omap i, <Plug>(swap-textobject-i)")
vim.cmd("omap i, <Plug>(swap-textobject-i)")
vim.cmd("xmap i, <Plug>(swap-textobject-i)")
vim.cmd("omap a, <Plug>(swap-textobject-a)")
vim.cmd("xmap a, <Plug>(swap-textobject-a)")

------------------
--  vim-rooter  --
------------------
vim.cmd("let g:rooter_patterns = ['.git', 'CMakeLists.txt', 'Makefile', '*.sln', '.idea', '.root', '.vim']")

------------------------
--  Goya & limelight  --
------------------------
vim.cmd("autocmd! User GoyoEnter Limelight")
vim.cmd("autocmd! User GoyoLeave Limelight!")

---------------
--  matchup  --
---------------
vim.cmd("let g:matchup_matchparen_offscreen = {'method': 'popup'}")

------------------
--  simpylfold  --
------------------
vim.g.SimpylFold_docstring_preview = 1
vim.g.SimpylFold_fold_docstring = 1

----------------
--  floaterm  --
----------------
vim.g.floaterm_shell = 'fish'
-- vim.g.floaterm_wintype = 'normal'
vim.cmd("let g:floaterm_rootmarkers = ['.project', '.vscode', '.idea', '.git', '.hg', '.svn', '.root', '.gitignore', '.CP']")
vim.g.floaterm_open_command  = 'vsplit'
vim.g.floaterm_keymap_new    = '<Leader>ft'
vim.g.floaterm_keymap_prev   = '<leader>fp'
vim.g.floaterm_keymap_next   = '<leader>fn'
vim.g.floaterm_keymap_toggle = '<M-t>'
vim.g.floaterm_keymap_kill   = '<leader>fk'
--Set floaterm window's background to black
-- hi Floaterm guibg=black
-- Set floating window border line color to cyan, and background to orange
-- hi FloatermBorder guibg=orange guifg=cyan
-- hi FloatermNC guibg=gray

vim.cmd("command! LF FloatermNew lf")

----------
--  lf  --
----------
vimp.rbind('n', '<leader>lf', '<Plug>LfSplit')

---------------------
--  nvim-lsputils  --
---------------------
vim.g.lsp_utils_location_opts = {
    height = 24,
    mode = 'split',
    list = {
	border = true,
	numbering = true
    },
    preview = {
	title = 'Location Preview',
	border = true,
    },
}


vim.g.lsp_utils_symbols_opts = {
    height = 24,
    mode = 'editor',
    list = {
	border = true,
	numbering = false,
    },
    preview = {
	title = 'Symbols Preview',
	border = true,
    },
    prompt = {}
}
vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler

-----------------
--  Telescope  --
-----------------
local actions = require('telescope.actions')
-- Global remapping
------------------------------
-- '--color=never',
require('telescope').load_extension('lsp_handlers')
require('telescope').load_extension('media_files')
require('telescope').load_extension('ultisnips')

require('telescope').setup {
    defaults = {
        vimgrep_arguments = {'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
        prompt_position = "top",
        prompt_prefix = " ",
        selection_caret = " ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_defaults = {horizontal = {mirror = false}, vertical = {mirror = false}},
        file_sorter = require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
        shorten_path = true,
        winblend = 0,
        width = 0.75,
        preview_cutoff = 120,
        results_height = 1,
        results_width = 0.8,
        border = {},
        borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        color_devicons = true,
        use_less = true,
        set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                -- To disable a keymap, put [map] = false
                -- So, to not map "<C-n>", just put
                -- ["<c-x>"] = false,
                ["<esc>"] = actions.close,

                -- Otherwise, just set the mapping to the function that you want it to be.
                -- ["<C-i>"] = actions.select_horizontal,

                -- Add up multiple actions
                ["<CR>"] = actions.select_default + actions.center

                -- You can perform as many actions in a row as you like
                -- ["<CR>"] = actions.select_default + actions.center + my_cool_custom_action,
            },
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                -- ["<C-i>"] = my_cool_custom_action,
            }
        }
    },
    require'telescope'.setup {
        extensions = {
            media_files = {
                -- filetypes whitelist
                -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
                filetypes = {"png", "webp", "jpg", "jpeg"},
                find_cmd = "rg" -- find command (defaults to `fd`)
            }
        }
    }
}

map('n', '<space>br', '<cmd>lua require(\'telescope.builtin\').file_browser()<cr>', {noremap = true})
map('n', '<c-p>', '<cmd>lua require(\'telescope.builtin\').find_files({ prompt_prefix=🔍 })<cr>', {noremap = true})
map('n', '<space>g', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>', {noremap = true})
map('n', '<space>b', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>', {noremap = true})
map('n', '<space>h', '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>', {noremap = true})
map('n', '<space>gf', '<cmd>lua require(\'telescope.builtin\').git()<cr>', {noremap = true})
map('n', '<space>gb', '<cmd>lua require(\'telescope.builtin\').git_branches()<cr>', {noremap = true})
map('n', '<space>gbc', '<cmd>lua require(\'telescope.builtin\').git_bcommits()<cr>', {noremap = true})
map('n', '<space>ts', '<cmd>lua require(\'telescope.builtin\').treesitter()<cr>', {noremap = true})
map('n', '<space>p', '<cmd>lua require(\'telescope.builtin\').builtin(require(\'telescope.themes\').get_dropdown({windblend = 10}))<cr>', {noremap = true})
map('n', '<space>p', '<cmd>lua require(\'telescope.builtin\').builtin()<cr>', {noremap = true})
map('n', '<space>r', '<cmd>lua require(\'telescope.builtin\').reloader()<cr>', {noremap = true})
map('n', '<space>s', '<cmd>lua require\'telescope.builtin\'.symbols{}<cr>', {noremap = true})
map('n', '<space>m', '<cmd>lua require(\'telescope\').extensions.media_files.media_files(require(\'telescope.themes\').get_dropdown({windblend = 10}))<cr>', {noremap = true})
map('n', '<space>u', '<cmd>lua require\'telescope\'.extensions.ultisnips.ultisnips(require(\'telescope.themes\').get_dropdown({windblend = 10}))<cr>', {noremap = true})

-----------------
--  dashboard  --
-----------------
vim.g.dashboard_custom_header = {
'$$\\   $$\\ $$$$$$$$\\  $$$$$$\\  $$\\    $$\\ $$$$$$\\ $$\\      $$\\ ',
'$$$\\  $$ |$$  _____|$$  __$$\\ $$ |   $$ |\\_$$  _|$$$\\    $$$ |',
'$$$$\\ $$ |$$ |      $$ /  $$ |$$ |   $$ |  $$ |  $$$$\\  $$$$ |',
'$$ $$\\$$ |$$$$$\\    $$ |  $$ |\\$$\\  $$  |  $$ |  $$\\$$\\$$ $$ |',
'$$ \\$$$$ |$$  __|   $$ |  $$ | \\$$\\$$  /   $$ |  $$ \\$$$  $$ |',
'$$ |\\$$$ |$$ |      $$ |  $$ |  \\$$$  /    $$ |  $$ |\\$  /$$ |',
'$$ | \\$$ |$$$$$$$$\\  $$$$$$  |   \\$  /   $$$$$$\\ $$ | \\_/ $$ |',
'\\__|  \\__|\\________| \\______/     \\_/    \\______|\\__|     \\__|',
}
vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_section = {
    a = {description = {' Find File          '}, command = 'Telescope find_files'},
    b = {description = {' Recently Used Files'}, command = 'Telescope oldfiles'},
    c = {description = {' Load Last Session  '}, command = 'SessionLoad'},
    d = {description = {' Find Word          '}, command = 'Telescope live_grep'},
    e = {description = {' Marks              '}, command = 'Telescope marks'}
}

-- file_browser = {description = {' File Browser'}, command = 'Telescope find_files'},

-- vim.g.dashboard_custom_shortcut = {
--     a = 'f',
--     find_word = 'SPC f a',
--     last_session = 'SPC s l',
--     new_file = 'SPC c n',
--     book_marks = 'SPC f b'
-- }
-- find_history = 'SPC f h',
vim.g.dashboard_session_directory = '~/.cache/nvim/session'
map('n', '<leader>ss', ':<c-u>SessionSave<cr>', {noremap = true})
map('n', '<leader>sl', ':<c-u>SessionLoad<cr>', {noremap = true})
vim.cmd("autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2")

