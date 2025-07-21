-- lua/plugins/statusline.lua

return {
    --    'nvim-lualine/lualine.nvim',
    --    enabled = false,
    --    dependencies = { 'nvim-tree/nvim-web-devicons' },
    --    opts = {
    --      options = {
    --        theme = 'auto',
    --        component_separators = { left = '', right = ''},
    --        section_separators = { left = '', right = ''},
    --      },
    --      sections = {
    --        lualine_a = {'mode'},
    --        lualine_b = {'branch', 'diff', 'diagnostics'},
    --        lualine_c = {'buffers'},
    --        lualine_x = {'filetype'},
    --        lualine_y = {'progress'},
    --        lualine_z = {'location'}
    --      },
    --      extensions = {'neo-tree', 'lazy'},
    --    },
    {
        'echasnovski/mini.statusline',
        enabled = true,
        version = false,
        config = function()
            require('mini.statusline').setup()
        end,
    },
}
