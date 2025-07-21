-- lua/plugins/formatter.lua

return {
    'stevearc/conform.nvim',
    enabled = true,
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
        formatters_by_ft = {
            lua = { 'stylua' },
            c = { 'clang_format' },
            cpp = { 'clang_format' },
            rust = { 'rustfmt' },
            python = { 'isort', 'black' },
            javascript = { 'prettier' },
            typescript = { 'prettier' },
            html = { 'prettier' },
            css = { 'prettier' },
            markdown = { 'prettier' },
            bash = { 'shfmt' },
        },
    },
}
