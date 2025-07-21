-- lua/plugins/alpha.lua

return {
    'goolord/alpha-nvim',
    enabled = true,
    event = "VimEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local alpha = require('alpha')
        local dashboard = require('alpha.themes.dashboard')

        -- NOTE: Need to change ASCII Art later
        dashboard.section.header.val = {
            [[.________________________________________________________________________________________________________________________.]],
            [[| ⠀⠀⢮⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀  A ⠀⣤⣄⣴⣶⣿⣿⣶⣶⣦⣤⣤⣤⣶⣶⣶⣶⣶⣶⣶⣶⣾⣿⣿⣶⣀⣶⣆⣶⣦  ███████╗██╗███╗   ██╗ █████╗ ██╗    ██╗██╗███╗   ███╗ |]],
            [[| ⠀⢘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠠  | ⠀⠉⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿  ██╔════╝██║████╗  ██║██╔══██╗██║    ██║██║████╗ ████║ |]],
            [[| ⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇  | ⢀⣀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇  ███████╗██║██╔██╗ ██║███████║██║    ██║██║██╔████╔██║ |]],
            [[| ⠀⢸⣿⣿⣿⣿⣿⡿⣽⠇⢸⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠆  | ⠈⠛⠛⢿⣿⣿⣿⣿⣿⠛⡟⠛⢿⡿⠛⠛⠛⠛⠛⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ╚════██║██║██║╚██╗██║██╔══██║╚██╗ ██╔╝ ██║██║╚██╔╝██║ |]],
            [[| ⠀⠈⠘⢿⣿⡿⢿⣇⣹⠇⠨⢎⣿⢿⣿⣿⡿⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃  | ⠀⠀⢀⣿⣿⣿⣿⣿⣧⣀⣀⣀⡼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ███████║██║██║ ╚████║██║  ██║ ╚████╔╝  ██║██║ ╚═╝ ██║ |]],
            [[| ⠀⠀⠀⢸⣿⡇⣷⣤⣩⡃⠘⠈⢸⠉⡤⣿⣅⡐⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⠆  | ⠀⠀⣼⣿⣿⣿⣿⣿⠋⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ╚══════╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝  ╚═══╝   ╚═╝╚═╝     ╚═╝ |]],
            [[| ⠀⠀⠀⠈⠃⢿⠘⠛⠛⠃⠀⠀⠀⠀⠀⢿⣤⣉⡓⠻⣿⣿⣿⣿⣿⡳⣿⣿⡿⠀  | ⠀⢰⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  (akumavim by sina_varasina)                           |]],
            [[| ⠀⠀⠀⠀⠀⠈⣆⠀⠐⠀⢀⠀⠀⠀⠀⠈⠛⠿⠛⠁⠁⣿⣿⣿⣏⣽⣿⡟⠇⠀  | ⢀⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  (OSHMKUFA, lol) - i'm steins gate fans tbh            |]],
            [[| ⠀⠀⠀⠀⠀⠀⠈⢦⡀⢀⠯⣤⠀⠀⠀⠀⠀⠀⠀⠀⢨⣿⣿⡿⠿⠿⠻⠁⠀⠀  | ⣼⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  「宇宙には始まりはあるが終わりはない…無限」           |]],
            [[| ⠀⠀⠀⠀⠀⠀⠀⠀⢹⣄⡀⠀⠄⠀⡀⠀⠀⠀⢀⣠⢷⣿⣿⣿⡆⠀⠀⠀⠀⠀  | ⠉⠙⠛⠿⠿⣿⠇⠀⠀⠀⠀⠀el psy congroo.                                                           |]],
            [[| ⠀⠀⠀⠀⠀⢀⣠⣶⣿⣿⠑⢤⣈⣄⣤⣤⢶⣟⠯⠃⢹⣿⣿⣿⣷⣄⠀⠀⠀⠀  |                                                                                       |]],
            [[| ⠀⢀⣠⣴⣾⣿⣿⣿⣿⡏⢀⣦⣿⡞⠓⠋⠉⠀⠀⠀⢸⣿⣿⣿⣿⣿⣷⣄⠀⠀  |_______________________________________________________________________________________|]],
            [[| ⣶⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣷⡀⠂⠄⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣯⣧⡀  |               { If you want to avoid the pain, you should believe in God.             |]],
            [[| ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⢀⠀⣀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶  |               Whether you believe in God or not, he is always with you. }             |]],
            [[| ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿  |                                      Lain Iwakura                                     |]],
            [[|.________________________________A_______________________________________________________________________________________.]],
        }
        dashboard.section.header.opts.hl = 'Type'

        dashboard.section.buttons.val = {
            dashboard.button("n", "  New file", ":enew<CR>"),
            dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
            dashboard.button("c", "  Config", ":e " .. vim.fn.stdpath('config') .. "<CR>"),
            dashboard.button("h", "  Cheatsheet", ":!xdg-open https://vim.rtorr.com/<CR>"),
            dashboard.button("l", "󰒲  Lazy", ":Lazy<CR>"),
            dashboard.button("m", "  Mason", ":Mason<CR>"),
            dashboard.button("q", "  Quit", ":qa<CR>"),
        }
        dashboard.section.buttons.opts.hl = 'Keyword'

        vim.api.nvim_create_autocmd('FileType', {
            pattern = 'alpha',
            callback = function()
                vim.opt_local.fillchars = { eob = ' ' }
            end,
        })
        alpha.setup(dashboard.opts)
    end,
}
