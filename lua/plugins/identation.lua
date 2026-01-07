-- lua/plugins/identation.lua

return {
    --  {
    --      'echasnovski/mini.indentscope',
    --      enabled = false,
    --      version = false,
    --      config = function()
    --          require('mini.indentscope').setup({
    --          })
    --      end
    --  },
    {
        'nvimdev/indentmini.nvim',
        enabled = true,
        config = function()
            require("indentmini").setup({
                char = '╎',
                only_current = true,
                exclude = {
                    'alpha',
                    'dashboard',
                    'neo-tree',
                    'lazy',
                    'help',
                    'TelescopePrompt',
                    'mason',
                },
            })

            vim.cmd.highlight('IndentLine guifg=#363A4F')
            vim.cmd.highlight('IndentLineCurrent guifg=#545872')
        end,
    },
    {
        "utilyre/sentiment.nvim",
        version = "*",
        event = "VeryLazy",
        opts = {
        },
        init = function()
            vim.g.loaded_matchparen = 1
        end,
    },
}
