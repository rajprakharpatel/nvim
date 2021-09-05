local fk = function(str, ...)
    return vim.fn.feedkeys(vim.api.nvim_replace_termcodes(str, true, true, true), ...)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
        end
    },
    documentation = {
        -- border = {
        -- '═', '║', '╒', '╓', '╔', '╕', '╖', '╗', '╘', '╙', '╚', '╛', '╜', '╝', '╞',
        -- '╟'
        -- }
        border = {'╔', '═', '╗', '║', '╝', '═', '╚', '║'}
    },
    formatting = {
        format = function(entry, vim_item)
            -- fancy icons and a name of kind
            vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
            -- vim_item.kind = require("lspkind").presets.default[vim_item.kind]

            -- set a name for each source
            vim_item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                vsnip = "[vsnip]",
                luasnip = "[LuaSnip]",
                ultisnips = "[Ultisnips]",
                snippy = "[snippy]",
                nvim_lua = "[Lua]",
                latex_symbols = "[Latex]",
                spell = "[spell]",
                nuspell = "[nuspell]",
                emoji = "[😀]",
                cmp_tabnine = "[Tabnine]",
                ['vim-dadbod-completion'] = "[DadBod]"
            })[entry.source.name]
            return vim_item
            -- 暈
        end
    },

    mapping = {
        ['<C-y>'] = cmp.mapping.confirm({select = true}),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        -- ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        ['<Tab>'] = function(fallback)
            if vim.fn.pumvisible() == 1 then
                fk("<C-n>", 'n')
            elseif check_back_space() then
                fk("<Tab>", 'n')
            elseif vim.fn['vsnip#available']() == 1 then
                fk('<Plug>(vsnip-expand-or-jump)', '')
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if vim.fn.pumvisible() == 1 then
                fk("<C-p>", 'n')
            elseif check_back_space() then
                fk("<S-Tab>", 'n')
            elseif vim.fn['vsnip#jumpable'](-1) == 1 then
                fk('<Plug>(vsnip-jumo-prev)', '')
            else
                fallback()
            end
        end,
        -- ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'}),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true})
    },
    sources = {
        {name = 'nvim_lua'}, {name = 'nvim_lsp'}, {name = 'cmp_tabnine'}, {name = 'snippy'}, {name = 'buffer'},
        {name = 'vsnip'}, {name = "ultisnips"}, {name = 'orgmode'}, {name = 'vim-dadbod-completion'}, {name = 'calc'},
        {name = 'emoji'}, {name = 'latex_symbols'}, {name = 'path'}, {name = 'nuspell'}
    }
}
