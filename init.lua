local profile = os.getenv("NVIM_PROFILE")
if profile == nil then
    profile = require("config").default_profile
end

if profile == "none" then
    return
end

local config = require("config.profiles." .. profile)

vim.g["mapleader"] = config.mapleader
require("core.opts")(config.opts, config.g)

local default_plugins = require("core.default_plugins")
local user_plugins = config.plugins
for _, plugin in ipairs(user_plugins) do
    table.insert(default_plugins, plugin)
end
require("core.plugins")(default_plugins, config.colorscheme, profile)

require("core.mappings")(config.mappings)
if not (config.command_palette_mapping == nil) then
    local funcs = require("config.profiles." .. profile .. ".funcs")(profile)
    local funcs_for_func = {}
    for _, v in pairs(funcs) do
        table.insert(funcs_for_func, v)
    end
    require("which-key").register({
        {
            [config.command_palette_mapping] = {
                function() require("core.command_palette")(require("telescope.themes").get_dropdown(), funcs_for_func) end,
                "Open the command palette",
            }
        }
    })
end

require("core.autocmds")(config.autocmds)

print("Loaded the " .. profile .. " profile")
