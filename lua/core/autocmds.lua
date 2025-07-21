-- lua/core/autocmds.lua

local api = vim.api

local yank_group = api.nvim_create_augroup('YankHighlight', { clear = true })
api.nvim_create_autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
})

local window_group = api.nvim_create_augroup('WindowManagement', { clear = true })
api.nvim_create_autocmd('VimResized', {
    group = window_group,
    pattern = '*',
    command = 'wincmd =',
})

local nvimtree_group = api.nvim_create_augroup('NvimTree', { clear = true })
api.nvim_create_autocmd('BufEnter', {
    group = nvimtree_group,
    pattern = '*',
    callback = function()
        local buf_name = api.nvim_buf_get_name(0)
        local buf_type = vim.bo.buftype
        if buf_name:match('NvimTree_') and #api.nvim_list_wins() == 1 and buf_type == 'nofile' then
            vim.cmd('quit')
        end
    end,
})
