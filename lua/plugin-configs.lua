local map = vim.api.nvim_set_keymap
require('vimp')
-----------------
--  undo-tree  --
-----------------
map('n', '<F7>', ':UndotreeToggle<cr>', {noremap = true})
vim.bo.undofile = true
vim.o.undodir = "/home/rajprakhar/.local/share/nvim/shada/undo-dir"

--------------
--  tagbar  --
--------------
map('', '<F9>', ':TagbarToggle<cr>', {noremap = true})
-----------------
--  Ultisnips  --
-----------------
-- Trigger configuration. You need to change this to something other than <tab>
-- if you use one of completion plugins
vim.g.UltiSnipsExpandTrigger = "<c-l>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-j>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-k>"
vim.g.UltiSnipsEditSplit = "vertical"

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
vim.cmd(
    "let g:floaterm_rootmarkers = ['.project', '.vscode', '.idea', '.git', '.hg', '.svn', '.root', '.gitignore', '.CP']")
vim.g.floaterm_open_command = 'vsplit'
vim.g.floaterm_keymap_new = '<Leader>ft'
vim.g.floaterm_keymap_prev = '<leader>fp'
vim.g.floaterm_keymap_next = '<leader>fn'
vim.g.floaterm_keymap_toggle = '<M-t>'
vim.g.floaterm_keymap_kill = '<leader>fk'
-- Set floaterm window's background to black
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
    list = {border = true, numbering = true},
    preview = {title = 'Location Preview', border = true}
}

vim.g.lsp_utils_symbols_opts = {
    height = 24,
    mode = 'editor',
    list = {border = true, numbering = false},
    preview = {title = 'Symbols Preview', border = true},
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
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
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
map('n', '<space>p',
    '<cmd>lua require(\'telescope.builtin\').builtin(require(\'telescope.themes\').get_dropdown({windblend = 10}))<cr>',
    {noremap = true})
map('n', '<space>p', '<cmd>lua require(\'telescope.builtin\').builtin()<cr>', {noremap = true})
map('n', '<space>r', '<cmd>lua require(\'telescope.builtin\').reloader()<cr>', {noremap = true})
map('n', '<space>s', '<cmd>lua require\'telescope.builtin\'.symbols{}<cr>', {noremap = true})
map('n', '<space>m',
    '<cmd>lua require(\'telescope\').extensions.media_files.media_files(require(\'telescope.themes\').get_dropdown({windblend = 10}))<cr>',
    {noremap = true})
map('n', '<space>u',
    '<cmd>lua require\'telescope\'.extensions.ultisnips.ultisnips(require(\'telescope.themes\').get_dropdown({windblend = 10}))<cr>',
    {noremap = true})

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
    '\\__|  \\__|\\________| \\______/     \\_/    \\______|\\__|     \\__|'
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

--------------------
--  nvim_comment  --
--------------------
require('nvim_comment').setup({comment_empty = false})

------------------
--  treesitter  --
------------------
require'nvim-treesitter.configs'.setup {
    ensure_installed = {"c", "cpp", "java", "python", "json", "yaml"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    -- TODO seems to be broken
    ignore_install = {"haskell"},
    highlight = {
        enable = true -- false will disable the whole extension
    },
    -- indent = {enable = true, disable = {"python", "html", "javascript"}},
    indent = {enable = {"javascriptreact"}},
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false -- Whether the query persists across vim sessions
    },
    autotag = {enable = true},
    rainbow = {enable = true},
    context_commentstring = {enable = true, config = {javascriptreact = {style_element = '{/*%s*/}'}}}
    -- refactor = {highlight_definitions = {enable = true}}
}

-----------------------
--  nvim-indentline  --
-----------------------
vim.g.indent_blankline_buftype_exclude = {'terminal'}
vim.g.indent_blankline_filetype_exclude = {'help', 'startify', 'dashboard', 'packer', 'neogitstatus'}
vim.g.indent_blankline_char = '▏'
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_context_patterns = {
    'class', 'return', 'function', 'method', '^if', '^while', 'jsx_element', '^for', '^object', '^table', 'block',
    'arguments', 'if_statement', 'else_clause', 'jsx_element', 'jsx_self_closing_element', 'try_statement',
    'catch_clause', 'import_statement', 'operation_type'
}

-----------------
--  nvim-tree  --
-----------------
vim.g.nvim_tree_ignore = {'.git', 'node_modules', '.cache', 'log.json'}
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_auto_ignore_ft = {'dashboard', 'startify'}
vim.g.nvim_tree_tab_open = 1
vim.g.nvim_tree_indent_markers = 1 -- "0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_follow = 1 -- "0 by default, this option allows the cursor to be updated when entering a buffer
vim.g.nvim_tree_auto_close = 1 -- 0 by default, closes the tree when it's the last window
-- a list of groups can be found at `:help nvim_tree_highlight
-- vim.cmd([[hi NvimTreeFolderIcon guifg=blue]])
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
    -- mappings
    ["<CR>"] = tree_cb("edit"),
    ["l"] = tree_cb("edit"),
    ["o"] = tree_cb("edit"),
    ["<2-LeftMouse>"] = tree_cb("edit"),
    ["<2-RightMouse>"] = tree_cb("cd"),
    ["<C-]>"] = tree_cb("cd"),
    ["v"] = tree_cb("vsplit"),
    ["s"] = tree_cb("split"),
    ["<C-t>"] = tree_cb("tabnew"),
    ["h"] = tree_cb("close_node"),
    ["<BS>"] = tree_cb("dir_up"),
    ["<S-CR>"] = tree_cb("close_node"),
    ["<Tab>"] = tree_cb("preview"),
    ["."] = tree_cb("toggle_ignored"),
    ["zh"] = tree_cb("toggle_ignored"),
    ["H"] = tree_cb("toggle_dotfiles"),
    ["R"] = tree_cb("refresh"),
    ["a"] = tree_cb("create"),
    ["x"] = tree_cb("remove"),
    ["r"] = tree_cb("rename"),
    ["<C-r>"] = tree_cb("full_rename"),
    ["d"] = tree_cb("cut"),
    ["y"] = tree_cb("copy"),
    ["p"] = tree_cb("paste"),
    ["[c"] = tree_cb("prev_git_item"),
    ["]c"] = tree_cb("next_git_item"),
    ["-"] = tree_cb("dir_up"),
    ["q"] = tree_cb("close")
}
vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {unstaged = "", staged = "✓", unmerged = "", renamed = "➜", untracked = ""},
    folder = {default = "", open = "", empty = "", empty_open = "", symlink = ""}
}

--------------------------------------------------------------------------------
--                                    Codi                                    --
--------------------------------------------------------------------------------
-- change the color
vim.cmd('highlight CodiVirtualText guifg=cyan')
vim.cmd([[let g:codi#virtual_text_prefix = "❯ "]])

--------------------------------------------------------------------------------
--                                  LspSaga                                   --
--------------------------------------------------------------------------------
local saga = require 'lspsaga'

-- add your config value here
-- default value
-- use_saga_diagnostic_sign = true
-- error_sign = '',
-- warn_sign = '',
-- hint_sign = '',
-- infor_sign = '',
-- dianostic_header_icon = '   ',
-- code_action_icon = ' ',
-- code_action_prompt = {
--   enable = true,
--   sign = true,
--   sign_priority = 20,
--   virtual_text = true,
-- },
-- finder_definition_icon = '  ',
-- finder_reference_icon = '  ',
-- max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
-- finder_action_keys = {
--   open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
-- },
-- code_action_keys = {
--   quit = 'q',exec = '<CR>'
-- },
-- rename_action_keys = {
--   quit = '<C-c>',exec = '<CR>'  -- quit can be a table
-- },
-- definition_preview_icon = '  '
-- 1: thin border | 2: rounded border | 3: thick border | 4: ascii border
-- border_style = 1
-- rename_prompt_prefix = '➤',
-- if you don't use nvim-lspconfig you must pass your server name and
-- the related filetypes into this table
-- like server_filetype_map = {metals = {'sbt', 'scala'}}
-- server_filetype_map = {}

saga.init_lsp_saga {
    error_sign = '',
    warn_sign = '',
    finder_action_keys = {
        open = 'o',
        vsplit = 'v',
        split = 's',
        quit = 'q',
        scroll_down = '<C-f>',
        scroll_up = '<C-b>' -- quit can be a table
    }
}
-- lsp provider to find the cursor word definition and reference
map('n', 'gh', [[<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>]], {noremap = true, silent = true})
-- code action
map('n', '<space>a', [[<cmd>lua require('lspsaga.codeaction').code_action()<CR>]], {noremap = true, silent = true})
map('v', '<space>a', [[<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>]], {noremap = true, silent = true})
-- show hover doc
map('n', 'K', [[<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]], {noremap = true, silent = true})
-- show signature help
map('n', '<space>k', [[<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>]], {noremap = true, silent = true})
-- scroll down hover doc or scroll in definition preview
map('n', '<C-f>', [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]], {noremap = true, silent = true})
-- scroll up hover doc
map('n', '<C-b>', [[<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]], {noremap = true, silent = true})
-- rename
map('n', '<space>r', [[<cmd>lua require('lspsaga.rename').rename()<CR>]], {noremap = true, silent = true})
-- preview definition
map('n', '<space>pd', [[<cmd>lua require'lspsaga.provider'.preview_definition()<CR>]], {noremap = true, silent = true})
-- show
map('n', '<space>l', [[<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>]],
    {noremap = true, silent = true})
-- only show diagnostic if cursor is over the area
map('n', '<space>c', [[<cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>]],
    {noremap = true, silent = true})
-- jump diagnostic
map('n', '[d', [[<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>]], {noremap = true, silent = true})
map('n', ']d', [[<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>]], {noremap = true, silent = true})

--------------------------------------------------------------------------------
--                                lspkind-nvim                                --
--------------------------------------------------------------------------------
-- commented options are defaults
require('lspkind').init({
    -- with_text = true,
    -- symbol_map = {
    --   Text = '',
    --   Method = 'ƒ',
    --   Function = '',
    --   Constructor = '',
    --   Variable = '',
    --   Class = '',
    --   Interface = 'ﰮ',
    --   Module = '',
    --   Property = '',
    --   Unit = '',
    --   Value = '',
    --   Enum = '了',
    --   Keyword = '',
    --   Snippet = '﬌',
    --   Color = '',
    --   File = '',
    --   Folder = '',
    --   EnumMember = '',
    --   Constant = '',
    --   Struct = ''
    -- },
})

--------------------------------------------------------------------------------
--                                 vim-vsnip                                  --
--------------------------------------------------------------------------------
-- Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
-- See https://github.com/hrsh7th/vim-vsnip/pull/50
map('n', '<M-s>', [[<Plug>(vsnip-select-text)]], {noremap = true})
map('x', '<M-s>', [[<Plug>(vsnip-select-text)]], {noremap = true})
map('n', '<M-S>', [[<Plug>(vsnip-cut-text)]], {noremap = true})
map('x', '<M-S>', [[<Plug>(vsnip-cut-text)]], {noremap = true})

--------------------------------------------------------------------------------
--                                  gitsigns                                  --
--------------------------------------------------------------------------------
require('gitsigns').setup {
    signs = {
        -- TODO add hl to colorscheme
        add = {hl = 'GitSignsAdd', text = '', linehl = 'GitSignsAddLn'},
        change = {hl = 'GitSignsChange', text = '~', linehl = 'GitSignsChangeLn'},
        delete = {hl = 'GitSignsDelete', text = '﫧', linehl = 'GitSignsDeleteLn'},
        topdelete = {hl = 'GitSignsDelete', text = '-', linehl = 'GitSignsDeleteLn'},
        changedelete = {hl = 'GitSignsChange', text = '*', linehl = 'GitSignsChangeLn'}
    },
    numhl = false,
    linehl = false,
    keymaps = {
        -- Default keymap options
        noremap = true,
        buffer = true
    },
    watch_index = {interval = 1000},
    current_line_blame = false,
    sign_priority = 6,
    update_debounce = 200,
    status_formatter = nil, -- Use default
    use_decoration_api = false
}

--------------------------------------------------------------------------------
--                               nvim-colorizer                               --
--------------------------------------------------------------------------------
require'colorizer'.setup({
    RGB = true, -- #RGB hex codes
    RRGGBB = true, -- #RRGGBB hex codes
    RRGGBBAA = true, -- #RRGGBBAA hex codes
    rgb_fn = true, -- CSS rgb() and rgba() functions
    hsl_fn = true, -- CSS hsl() and hsla() functions
    css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn = true -- Enable all CSS *functions*: rgb_fn, hsl_fn
})

--------------------------------------------------------------------------------
--                                buffer-line                                 --
--------------------------------------------------------------------------------
require'bufferline'.setup {
    options = {
        view = "multiwindow",
        numbers = "both",
        number_style = "superscript", -- buffer_id at index 1, ordinal at index 2
        mappings = true,
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is deduplicated
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict)
            return "(" .. count .. ")"
        end,
        -- NOTE: this will be called a lot so don't do any heavy processing here
        custom_filter = function(buf_number)
            -- filter out filetypes you don't want to see
            if vim.bo[buf_number].filetype ~= "dashboard" then return true end
            -- filter out by buffer name
            if vim.fn.bufname(buf_number) ~= "<nvimtree>" then return true end
            -- filter out based on arbitrary rules
            -- e.g. filter out vim wiki buffer from tabline in your work repo
            if vim.fn.getcwd() == "/win_shada/workspace/Projects" and vim.bo[buf_number].filetype ~= "wiki" then
                return true
            end
        end,
        show_buffer_close_icons = true,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = 'slant',
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        sort_by = 'relative_directory'
    }
}

