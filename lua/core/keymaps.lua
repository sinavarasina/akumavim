-- lua/core/keymaps.lua

local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Panel Navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to Left Split" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to Below Split" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to Above Split" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to Right Split" })

-- Buffer Navigation
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })

-- Window Management
map("n", "<leader>w", "", { desc = "+Window" })
map("n", "<leader>wv", "<C-w>v", { desc = "Vertical Split" })
map("n", "<leader>wh", "<C-w>s", { desc = "Horizontal Split" })
map("n", "<leader>w=", "<C-w>=", { desc = "Equalize Windows" })
map("n", "<leader>wr", "<C-w>R", { desc = "Rotate Windows" })
map("n", "<A-k>", ":resize +2<CR>", { desc = "Increase Height" })
map("n", "<A-j>", ":resize -2<CR>", { desc = "Decrease Height" })
map("n", "<A-l>", ":vertical resize +2<CR>", { desc = "Increase Width" })
map("n", "<A-h>", ":vertical resize -2<CR>", { desc = "Decrease Width" })

-- fix overlapping keymap
-- map({ "n", "v" }, "<leader>C", "gcc", { desc = "Toggle Comment" })
-- map("n", "<leader>Cl", "gcc", { desc = "Toggle Comment Line" })

-- NeoTree
map("n", "<leader>e", "", { desc = "+Explorer" })
map("n", "<leader>ee", "<cmd>Neotree toggle position=left<cr>", { desc = "Sidebar" })
map("n", "<leader>ef", "<cmd>Neotree toggle position=float<cr>", { desc = "Floating" })
map("n", "<leader>ew", "<cmd>Neotree toggle position=current<cr>", { desc = "Netrw Style" })

-- Action
map("n", "<leader>f", "", { desc = "+File" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find File" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find by Grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find in Buffers" })
map("n", "<leader>fw", "<cmd>w<cr>", { desc = "Write" })
map("n", "<leader>fW", "<cmd>wa<cr>", { desc = "Write All" })
map("n", "<leader>fq", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>fQ", "<cmd>qa!<cr>", { desc = "Quit All (Force)" })

-- Code
map("n", "<leader>c", "", { desc = "+Code" })
map("n", "<leader>cf", function()
    require("conform").format()
end, { desc = "Format Code" })
map("n", "<leader>cn", vim.lsp.buf.rename, { desc = "Rename Variable" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

-- Compiler
--  map("n", "<leader>co", "<cmd>CompilerOpen<cr>", { desc = "Compiler Open" })
--  map("n", "<leader>ct", "<cmd>CompilerToggleResults<cr>", { desc = "Compiler Toggle Results" })
--  map("n", "<leader>cl", "<cmd>CompilerRedo<cr>", { desc = "Compiler Last Task" })
--  map("n", "<leader>cp", "<cmd>CompilerStop<cr>", { desc = "Compiler Stop Tasks" })

-- UI
map("n", "<leader>u", "", { desc = "+UI" })
map("n", "<Leader>uh", "<cmd>Alpha<cr>", { desc = "Homepage (Alpha)" })
map("n", "<leader>ut", "<cmd>Telescope colorscheme<cr>", { desc = "Themes" })

-- inlay diagnostic
map("n", "<leader>ui", function()
    local is_enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })

    vim.lsp.inlay_hint.enable(not is_enabled, { bufnr = 0 })

    if not is_enabled then
        vim.notify("Inlay Hints: ON", vim.log.levels.INFO)
    else
        vim.notify("Inlay Hints: OFF", vim.log.levels.WARN)
    end
end, { desc = "Toggle Inlay Hints" })

-- Debugger (DAP) -->
map("n", "<leader>d", "", { desc = "+Debug" })
map("n", "<leader>db", function() require('dap').toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
map("n", "<leader>dc", function() require('dap').continue() end, { desc = "Continue" })
map("n", "<leader>do", function() require('dap').step_over() end, { desc = "Step Over" })
map("n", "<leader>di", function() require('dap').step_into() end, { desc = "Step Into" })
map("n", "<leader>du", function() require('dap').step_out() end, { desc = "Step Out" })
map("n", "<leader>dt", function() require('dap').terminate() end, { desc = "Terminate" })
map("n", "<leader>dr", function() require('dap').repl.open() end, { desc = "Open REPL" })
--<


-- Diagnostics & LSP Navigation -->
map("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
map("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help (Params)" })

map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
map("n", "gr", vim.lsp.buf.references, { desc = "Go to References" })


map("n", "<leader>dd", vim.diagnostic.setloclist, { desc = "Show All Diagnostics" })
map("n", "<leader>de", vim.diagnostic.open_float, { desc = "Show Diagnostic Under Cursor" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })

local inlay_enabled = true
map("n", "<leader>ui", function()
    inlay_enabled = not inlay_enabled
    vim.lsp.inlay_hint.enable(inlay_enabled)
    if inlay_enabled then
        vim.notify("Inlay Hints: ON", vim.log.levels.INFO)
    else
        vim.notify("Inlay Hints: OFF", vim.log.levels.WARN)
    end
end, { desc = "Toggle Inlay Hints" })
--<


-- Fold
map('n', 'za', 'za', { desc = 'Toggle fold' })
map('n', 'zM', 'zM', { desc = 'Close all folds' })
map('n', 'zR', 'zR', { desc = 'Open all folds' })
