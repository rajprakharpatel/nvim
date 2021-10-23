local fk = function(str, ...)
    return vim.fn.feedkeys(vim.api
                               .nvim_replace_termcodes(str, true, true, true),
                           ...)
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
        border = {'┌', '─', '┐', '│', '┘', '─', '└', '│'}
    },
    formatting = {
        format = function(entry, vim_item)
            -- set a name for each source
            local source_mapping = {
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
            }
            -- fancy icons and a name of kind
            vim_item.kind =
                require("lspkind").presets.default[vim_item.kind] .. " " ..
                    vim_item.kind
            -- vim_item.kind = require("lspkind").presets.default[vim_item.kind]
            local menu = source_mapping[entry.source.name]
            if entry.source.name == 'cmp_tabnine' then
                if entry.completion_item.data ~= nil and
                    entry.completion_item.data.detail ~= nil then
                    menu = entry.completion_item.data.detail .. ' ' .. menu
                end
                vim_item.kind = '' .. ' suggestion'

            end
            if entry.source.name == 'nuspell' then
                if entry.completion_item.data ~= nil and
                    entry.completion_item.data.detail ~= nil then
                    menu = entry.completion_item.data.detail .. ' ' .. menu
                end
                vim_item.kind = '暈' .. 'Spelling'
            end

            vim_item.menu = menu
            return vim_item
        end
    },

    mapping = {
        ['<C-y>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true
        }),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        }),

        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif check_back_space() then
                fk("<Tab>", 'n')
            elseif vim.fn['vsnip#available']() == 1 then
                fk('<Plug>(vsnip-expand-or-jump)', '')
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif check_back_space() then
                fk("<S-Tab>", 'n')
            elseif vim.fn['vsnip#jumpable'](-1) == 1 then
                fk('<Plug>(vsnip-jumo-prev)', '')
            else
                fallback()
            end
        end

    },
    sources = {
        {name = 'nvim_lua'}, {name = 'nvim_lsp'}, {name = 'cmp_tabnine'},
        {name = 'snippy'}, {name = 'buffer'}, {name = 'vsnip'},
        {name = "ultisnips"}, {name = 'path'},
        {name = 'vim-dadbod-completion'}, {name = 'calc'}, {name = 'emoji'},
        {name = 'latex_symbols'}, {name = 'orgmode'}, {name = 'nuspell'}
    },
	experimental = {
		native_menu = false,
		ghost_text = true
	}
}
