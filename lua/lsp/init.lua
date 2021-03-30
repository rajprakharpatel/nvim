-- TODO figure out why this don't work
local map = vim.api.nvim_set_keymap
vim.fn.sign_define("LspDiagnosticsSignError",
                   {texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError"})
vim.fn.sign_define("LspDiagnosticsSignWarning",
                   {texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning"})
vim.fn.sign_define("LspDiagnosticsSignHint",
                   {texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint"})
vim.fn.sign_define("LspDiagnosticsSignInformation",
                   {texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"})

  -- GOTO mappings
  map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>', {noremap = true})
  map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
  map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
  map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>', {noremap = true})
  map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>', {noremap = true})
  map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap = true})
  map('n','<leader>gt','<cmd>lua vim.lsp.buf.type_definition()<CR>', {noremap = true})
  map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>', {noremap = true})
  map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', {noremap = true})
  -- ACTION mappings
  map('n','<leader>rn',  '<cmd>lua vim.lsp.buf.rename()<CR>', {noremap = true})
  -- Few language severs support these three
  map('n','<c-a-l>',  '<cmd>lua vim.lsp.buf.formatting()<CR>', {noremap = true})
  map('n','<leader>ai',  '<cmd>lua vim.lsp.buf.incoming_calls()<CR>', {noremap = true})
  map('n','<leader>ao',  '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>', {noremap = true})
  -- Diagnostics mapping
  map('n','<space>d', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', {noremap = true})
  map('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>', {noremap = true})
  map('n',']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', {noremap = true})
  map('n','[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', {noremap = true})

  map('n', [[<leader>ai]], [[<Cmd>lua require('jdtls').organize_imports()<CR>]], {noremap = true})
  map('n', [[<leader>av]], [[<Cmd>lua require('jdtls').extract_variable()<CR>]], {noremap = true})
  map('v', [[<leader>av]], [[<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>]], {noremap = true})
  map('v', [[<leader>am]], [[<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>]], {noremap = true})
  map('n', [[<leader>aR]], [[<Cmd>lua require('jdtls').code_action(false, 'refactor')<CR>]], {noremap = true})
vim.cmd('nnoremap <silent> ca :Lspsaga code_action<CR>')
vim.cmd('nnoremap <silent> K :Lspsaga hover_doc<CR>')
-- vim.cmd('nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>')
vim.cmd('nnoremap <silent> <space>n :Lspsaga diagnostic_jump_prev<CR>')
vim.cmd('nnoremap <silent> <space>p :Lspsaga diagnostic_jump_next<CR>')
-- scroll down hover doc or scroll in definition preview
vim.cmd('nnoremap <silent> <C-f> <cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<CR>')
-- scroll up hover doc
vim.cmd('nnoremap <silent> <C-b> <cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<CR>')
vim.cmd('command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()')

--[[ " autoformat
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100) ]]
-- Java
-- autocmd FileType java nnoremap ca <Cmd>lua require('jdtls').code_action()<CR>

local function documentHighlight(client, bufnr)
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)

    end

end
local lsp_config = {}

function lsp_config.common_on_attach(client, bufnr)
    documentHighlight(client, bufnr)
end

function lsp_config.tsserver_on_attach(client, bufnr)
    lsp_config.common_on_attach(client, bufnr)
    client.resolved_capabilities.document_formatting = false
end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
-- local servers = {"pyright", "tsserver"}
-- for _, lsp in ipairs(servers) do nvim_lsp[lsp].setup {on_attach = on_attach} end
return lsp_config
