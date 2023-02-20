local profile = os.getenv("NVIM_CONFIG")
if profile == nil then
	profile = "preset"
end
print("Loading the " .. profile .. " profile...")
local config = require("configs." .. profile)

require("core.options")(config.opts, config.g, config.mapleader)
require("core.plugins")(config.plugins, config.colorscheme, profile, config.disable_autopairs, config.disable_indent_hints)
require("core.mappings")(config.mappings)
require("core.autocmds")(config.autocmds)

if config.colorscheme == nil then
else
    vim.cmd("colorscheme " .. config.colorscheme)
end
