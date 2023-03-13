local config = require("config")

vim.g["mapleader"] = config.mapleader
require("core.opts")(config.opts, config.g)

local default_plugins = require("core.default_plugins")
local user_plugins = config.plugins
for _, plugin in ipairs(user_plugins) do
    table.insert(default_plugins, plugin)
end
require("core.plugins")(default_plugins, config.colorscheme)

require("core.mappings")(config.mappings)
if not (config.command_palette_mapping == nil) then
    require("which-key").register({
        {
            [config.command_palette_mapping] = {
                function() require("core.command_palette")(require("telescope.themes").get_dropdown()) end,
                "Open the command palette",
            }
        }
    })
end

require("core.autocmds")(config.autocmds)
