return {
  { "Exafunction/codeium.vim",
    event = "InsertEnter",
    config = function ()
    -- Change '<C-g>' here to any keycode you like.
    vim.g.codeium_disable_bindings = 1
    vim.keymap.set('i', '<a-i>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
    vim.keymap.set('i', '<a-]>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
    vim.keymap.set('i', '<a-[>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
    vim.keymap.set('i', '<a-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
  end
  },
}
