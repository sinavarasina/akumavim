-- lua/core/options.lua

local opt = vim.opt
local cmd = vim.cmd

opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"

opt.shortmess:append("sI")

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.undofile = true

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

opt.updatetime = 250
opt.swapfile = false
