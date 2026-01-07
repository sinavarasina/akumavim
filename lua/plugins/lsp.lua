-- lua/plugins/lsp.lua

return {
    {
        "rcarriga/nvim-dap-ui",
        enabled = true,
        event = "VeryLazy",
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dapui.setup({
                layouts = {
                    {
                        elements = {
                            { id = "scopes",      size = 0.25 },
                            { id = "breakpoints", size = 0.25 },
                            { id = "stacks",      size = 0.25 },
                            { id = "watches",     size = 0.25 },
                        },
                        size = 40,
                        position = "left",
                    },
                    {
                        elements = {
                            { id = "repl",    size = 0.5 },
                            { id = "console", size = 0.5 },
                        },
                        size = 10,
                        position = "bottom",
                    },
                },
            })
            dap.listeners.before.attach.dapui_config = function() dapui.open() end
            dap.listeners.before.launch.dapui_config = function() dapui.open() end
            dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
            dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
        end
    },

    {
        "jay-babu/mason-nvim-dap.nvim",
        enabled = true,
        event = "VeryLazy",
        dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
        opts = {
            handlers = {},
            ensure_installed = { "codelldb" },
        },
    },

    {
        "mfussenegger/nvim-dap",
        enabled = true,
    },

    {
        "williamboman/mason.nvim",
        enabled = true,
        config = function() require("mason").setup() end,
    },

    {
        "neovim/nvim-lspconfig",
        enabled = true,
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lspconfig = require("lspconfig")
            local mason_lspconfig = require("mason-lspconfig")
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local handlers = {
                ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
                ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
            }

            mason_lspconfig.setup({
                ensure_installed = { "lua_ls", "clangd", "rust_analyzer", "ts_ls" },
                handlers = {
                    function(server_name)
                        lspconfig[server_name].setup({
                            capabilities = capabilities,
                            handlers = handlers,
                        })
                    end,

                    ["lua_ls"] = function()
                        lspconfig.lua_ls.setup({
                            capabilities = capabilities,
                            handlers = handlers,
                            settings = {
                                Lua = {
                                    diagnostics = { globals = { "vim" } },
                                    workspace = {
                                        checkThirdParty = false,
                                        library = {
                                            vim.fn.expand("$VIMRUNTIME/lua"),
                                            vim.fn.stdpath("config") .. "/lua",
                                        },
                                    },
                                    telemetry = { enable = false },
                                    hint = { enable = true },
                                },
                            },
                        })
                    end,

                    ["rust_analyzer"] = function()
                        lspconfig.rust_analyzer.setup({
                            capabilities = capabilities,
                            handlers = handlers,
                            settings = {
                                ["rust-analyzer"] = {
                                    inlayHints = {
                                        bindingModeHints = { enable = true },
                                        chainingHints = { enable = true },
                                        closureReturnTypeHints = { enable = "always" },
                                        parameterHints = { enable = true },
                                        typeHints = {
                                            enable = true,
                                            hideClosureInitialization = false,
                                            hideNamedConstructor = false,
                                        },
                                        maxLength = 25,
                                    },
                                    checkOnSave = {
                                        enable = true,
                                        command = "clippy",
                                        allFeatures = true,
                                    },
                                    cargo = {
                                        allFeatures = true,
                                        runBuildScripts = true,
                                        autoreload = true,
                                    },
                                    procMacro = {
                                        enable = true,
                                    },
                                    completion = {
                                        autoimport = { enable = true },
                                        postfix = { enable = true },
                                        addCallParenthesis = true,
                                    },
                                    assist = {
                                        importGranularity = "module",
                                        importPrefix = "by_self",
                                    },
                                }
                            }
                        })
                    end,


                    ["clangd"] = function()
                        lspconfig.clangd.setup({
                            capabilities = capabilities,
                            handlers = handlers,
                            cmd = {
                                "clangd",
                                "--background-index",
                                "--clang-tidy",
                                "--header-insertion=iwyu",
                                "--completion-style=detailed",
                                "--function-arg-placeholders",
                                "--fallback-style=llvm",
                            },
                            init_options = {
                                usePlaceholders = true,
                                completeUnimported = true,
                                clangdFileStatus = true,
                            },
                        })
                    end,

                    ["ts_ls"] = function()
                        lspconfig.ts_ls.setup({
                            capabilities = capabilities,
                            handlers = handlers,
                            settings = {
                                javascript = {
                                    inlayHints = {
                                        includeInlayParameterNameHints = "all",
                                        includeInlayFunctionParameterTypeHints = true,
                                    }
                                },
                                typescript = {
                                    inlayHints = {
                                        includeInlayParameterNameHints = "all",
                                        includeInlayFunctionParameterTypeHints = true,
                                    }
                                }
                            },
                        })
                    end,
                },
            })
        end,
    },

    {
        "hrsh7th/nvim-cmp",
        enabled = true,
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        event = { "InsertEnter", "CmdlineEnter" },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                }),
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<Tab>'] = cmp.mapping.select_next_item(),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-Tab>'] = cmp.mapping.close(),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                }),
            })
        end,
    },
}
