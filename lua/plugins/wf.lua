-- lua/plugins/wf.lua

return {
  "Cassin01/wf.nvim",
  enabled = false,
  version = "*",
  event = "VeryLazy",
  config = function()
    require("wf").setup({
      theme = "space",
    })

    local which_key = require("wf.builtin.which_key")
    local buffer = require("wf.builtin.buffer")
    local map = vim.keymap.set

    map("n", "<leader>", which_key({ text_insert_in_advance = "<Space>" }), {
      noremap = true,
      silent = true,
      nowait = true,
      desc = "wf.nvim which-key",
    })

    map("n", "<leader>fb", buffer(), {
      noremap = true,
      silent = true,
      desc = "Find Buffer (wf.nvim)",
    })
  end,
}
