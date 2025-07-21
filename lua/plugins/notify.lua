-- lua/plugins/notify.lua

return {
    'rcarriga/nvim-notify',
    enabled = true,
    opts = {
        stages = "slide",
        render = "wrapped-compact",
        timeout = 3000,
        background_colour = "#000000",
        max_width = 100,
        top_down = true,
    },
    config = function(_, opts)
        require('notify').setup(opts)
        vim.notify = require('notify')
    end
}
