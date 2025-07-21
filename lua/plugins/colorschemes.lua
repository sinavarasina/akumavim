-- lua/plugins/colorschemes.lua

return {
    {
        "doki-theme/doki-theme-vim",
        config = function()
            vim.cmd.colorscheme "konata"
        end,

    },
    {
        "4513ECHO/vim-colors-hatsunemiku",
    },
}
