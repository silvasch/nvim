local profile = os.getenv("NVIM_PROFILE")
if profile == nil then
    profile = "dev"
end

if profile == "none" then
    return
end

print("Loading the " .. profile .. " profile...")

local config = require("profiles." .. profile)

require("core.options")(config.opts, config.g, config.mapleader)
require("core.plugins")(config.plugins, config.colorscheme, profile, config.default_plugins)
require("core.mappings")(config.mappings)
require("core.autocmds")(config.autocmds)

if config.colorscheme == nil then
else
    vim.cmd("colorscheme " .. config.colorscheme)
end
