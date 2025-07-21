-- lua/plugins/which-key.lua

return {
    "folke/which-key.nvim",
    enabled = true,
    event = "VeryLazy",
    config = function()
        require("which-key").setup({
            win = {
                border = "single",
                padding = { 1, 2 },
            },
            layout = {
                spacing = 6,
            },
        })
    end,
}
