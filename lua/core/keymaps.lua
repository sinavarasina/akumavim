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
map({ "n", "v" }, "<leader>C", "gcc", { desc = "Toggle Comment" })
map("n", "<leader>Cl", "gcc", { desc = "Toggle Comment Line" })

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
map("n", "<leader>fc", function()
    require("conform").format()
end, { desc = "Format Code" })

-- UI
map("n", "<leader>u", "", { desc = "+UI" })
map("n", "<Leader>uh", "<cmd>Alpha<cr>", { desc = "Homepage (Alpha)" })
map("n", "<leader>ut", "<cmd>Telescope colorscheme<cr>", { desc = "Themes" })
