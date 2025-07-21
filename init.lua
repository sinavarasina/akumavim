-- init.lua

-- Core Preload
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- Lazy Load
require("config.lazy")

-- Core After Load
require("core.afterload")
