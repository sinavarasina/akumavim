-- lua/plugins/colorschemes.lua

return {
    {
        "doki-theme/doki-theme-vim",
        enabled = true,
        config = function()
            vim.cmd.colorscheme "konata"
        end,

    },
    {
        "4513ECHO/vim-colors-hatsunemiku",
        enabled = false,
    },
}
