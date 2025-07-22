-- lua/plugins/treesitter.lua

return {
    {
        "nvim-treesitter/nvim-treesitter",
        enabled = true,
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "c",
                "cpp",
                "go",
                "lua",
                "python",
                "rust",
                "typescript",
                "javascript",
                "html",
                "css",
                "bash",
            },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        },
    }
}
