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
map({"n", "v"}, "<leader>C", "gcc", { desc = "Toggle Comment" })
map("n", "<leader>Cl", "gcc", { desc = "Toggle Comment Line" })

-- NeoTree
map("n", "<leader>e", "", { desc = "+Explorer" })
map("n", "<leader>ee", "<cmd>Neotree toggle position=left<cr>", { desc = "Sidebar" })
map("n", "<leader>ef", "<cmd>Neotree toggle position=float<cr>", { desc = "Floating" })
map("n", "<leader>ew", "<cmd>Neotree toggle position=current<cr>", { desc = "Netrw Style" })

-- Action
map("n", "<leader>F", "", { desc = "+File" })
map("n", "<leader>Fw", "<cmd>w<cr>", { desc = "Write" })
map("n", "<leader>FW", "<cmd>wa<cr>", { desc = "Write All" })
map("n", "<leader>Fq", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>FQ", "<cmd>qa!<cr>", { desc = "Quit All (Force)" })

-- function
function SetToggleTermKeymaps()
  map("n", "<leader>t", "", { desc = "+Terminal" })
  map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Floating" })
  map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Horizontal" })
  map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Vertical" })
  map("n", "<leader>tg", "<cmd>lua _lazygit_toggle()<cr>", { desc = "Lazygit" })
  map("n", "<leader>tn", "<cmd>ToggleTermGoToNext<cr>", { desc = "Next Terminal" })
  map("n", "<leader>tp", "<cmd>ToggleTermGoToPrevious<cr>", { desc = "Previous Terminal" })
end
