local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values

local funcs = require("config.funcs")
local funcs_for_entry_maker = {}
for _, v in pairs(funcs) do
    table.insert(funcs_for_entry_maker, v)
end


return function(opts)
    opts = opts or {}
    pickers.new(opts, {
        prompt_title = "Command Palette",
        finder = finders.new_table({
            results = funcs_for_entry_maker,
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = entry.desc,
                    ordinal = entry.desc,
                }
            end,
        }),
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                selection.value.func()
            end)
            return true
        end,
    }):find()
end
