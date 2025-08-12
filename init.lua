-- init.lua

-- Core Preload
require("core.preload-opts")
require("core.keymaps")
require("core.autocmds")

-- Lazy Load
require("config.lazy")

-- Core After Load
require("core.afterload-opts")
