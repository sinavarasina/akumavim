return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    opts = {
        preset = "powerline",
        only_current_line = true,
        hi = { background = "none" },
    },
    config = function(_, opts)
        require("tiny-inline-diagnostic").setup(opts)
        vim.diagnostic.config({ virtual_text = false })
    end,
}
