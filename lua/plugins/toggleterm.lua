-- lua/plugins/toggleterm.lua

return {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {
    size = 20,
    open_mapping = [[<c-t>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = 'float',
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = 'curved',
      winblend = 0,
    },
    winbar = {
      enabled = true,
      name_formatter = function(term)
        return term.name
      end,
    },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      direction = "float",
      float_opts = {
        border = "double",
      },
    })

    function _lazygit_toggle()
      lazygit:toggle()
    end

    SetToggleTermKeymaps()
  end,
}
