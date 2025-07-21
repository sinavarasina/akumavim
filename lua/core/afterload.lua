-- lua/core/afterload.lua

local opt = vim.opt
local cmd = vim.cmd

opt.background = "dark"
cmd.colorscheme "oxocarbon"

opt.fillchars:append("eob: ")
