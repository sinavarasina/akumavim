-- lua/plugins/alpha.lua

return {
    'goolord/alpha-nvim',
    enabled = true,
    event = "VimEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local alpha = require('alpha')
        local dashboard = require('alpha.themes.dashboard')
        -- Akuma means Devil, Tho this logo are heavely inspired by FreeBSD, Made By AI, And Modified by Me.
        -- why apple? i remember the touhou song titled "Koakuma Ringo/Bad Apple", so i decide it to be look like apple.
        dashboard.section.header.val = {
            [[    @@                                      %%                                             ]],
            [[   %%@                                      @@@                                            ]],
            [[  %@%@                                      %%@@                                           ]],
            [[  @%@%                                      @@%%                                           ]],
            [[ %@%@@%%                                  #@%@@%%                                          ]],
            [[  %%@@%@@+                              *%@@@%@@                                           ]],
            [[  @@%@@%@%%@                          %@%@@@%@@@                                           ]],
            [[   %@@%@@@%% %@%@%@+          %@@%%@% *@@%@@%@%                                            ]],
            [[    @@@@% %@@%@@%@@@%@@%@@@%@@@%@@@%@%%@ +%@%@                                             ]],
            [[     %% %@%@@@%@%@%@@%@@@%%@@@%@%%@@@%@@%@ %%                                              ]],
            [[      @%@@@%@%@%@%@%@@%@@@@@%@@@@%%@@%@%@%%                                                ]],
            [[     @@%@@%@%@@@@@@@%@@%@@@%@@%@%@@@%@@%                                                   ]],
            [[     @%@@%%@@@%@@@@%@@@%@%@@@@@@@@%%@@%                                                    ]],
            [[    @%@@@@@@%%@@@%@@@%@@@@@@%@@@@@@@@%                        Powered by VI VI VI          ]],
            [[    @@@%@@%%@@%@@@@@%%@@%@@@@@%@%%@%@@                                   6  6  6           ]],
            [[    %%@@%%@%@@%@%@@%@@@@@@@@%@@@@@%@@@                        Release your Devil!!!        ]],
            [[    @@@%@@@@@@@%  AkumaVIM  %@@@@%@@@@                                                     ]],
            [[    @%@%@%@@%@@@@@%@%@@@%@@@@@@@%@%@@%%                                                    ]],
            [[    *@@@@@%@@@%@@%@%@@@%@@%@%@%@@%@@%%@@                                                   ]],
            [[     @@%%@@@%@@@%@@@@%@%%@%@@@@@%@%@@@@@@@                                                 ]],
            [[     *%@%@@@@@@@%@@@@@@@%@@@%@@%%@@@%@@%%@%@                                               ]],
            [[      @@@@%@@%%%@%%@%@%@@@@@@%@@@%%@@%%@@@@@                                               ]],
            [[       %%@@%@%@@@@@@%@@@@%%%@@%@@@@@@@@@@@%                                                ]],
            [[        @@@@@%@@%%@@@@%@@@%@@%%@@%@@%@%@@                                                  ]],
            [[         @%%@@@@@@%@@%@@@@@%@@@@%@@%%@%@% @                                                ]],
            [[          @@@%@%@%@@%@@@%@@@@@@%@@%@@@%% %%@@@                                             ]],
            [[            @%@@@@@@%@@@@%%%@%%@@@@@%@    @@@%%*                                           ]],
            [[              %%@@%%          @%%@@%        %%@%                                           ]],
            [[                                             %@@@                                          ]],
            [[                                             @%@@                                          ]],
            [[           %@  %@%@@@%%@@%@%                %@@@                                           ]],
            [[         :@@@@%%@@%@@@@%@@%@%@%@@%@      %@@@%%                                            ]],
            [[        @@%%@%@@              %@%%@@%%@@@@@%%                                              ]],
            [[       @@@%@=                                                                              ]],
            [[      +%=                                                                                  ]],
        }
        dashboard.section.header.opts.hl = 'Type'

        dashboard.section.buttons.val = {
            dashboard.button("n", "  New file", ":enew<CR>"),
            dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
            dashboard.button("c", "  Config", ":e " .. vim.fn.stdpath('config') .. "<CR>"),
            dashboard.button("h", "  Cheatsheet", ":!xdg-open https://vim.rtorr.com/<CR>"),
            dashboard.button("l", "󰒲  Lazy", ":Lazy<CR>"),
            dashboard.button("m", "  Mason", ":Mason<CR>"),
            dashboard.button("d", "  Health Check", ":checkhealth<CR>"),
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
