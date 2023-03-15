local components = {
    active = {},
    inactive = {},
}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})

table.insert(components.active[1], {
    provider = function()
        local mode = vim.api.nvim_get_mode().mode
        local modes = {
            n = "NORMAL",
            i = "INSERT",
            v = "VISUAL",
            c = "COMMAND",
            V = "VISUAL BLOCK",
        }
        return modes[mode]
    end,
    icon  = " ",
    hl = function()
        local mode = vim.api.nvim_get_mode().mode
        local modes = {
            n = "#f38ba8",
            i = "#a6e3a1",
            v = "#89b4fa",
            c = "#cba6f7",
            V = "#89b4fa",
        }
        return { bg = modes[mode], fg = "#1e1e2e" }
   end,
   right_sep = "right_rounded",
})

table.insert(components.active[2], {
    provider = "file_info",
    right_sep = "right_rounded",
    left_sep = "left_rounded",
    hl = {
        fg = "#1e1e2e",
        bg = "#b4befe",
    },
})

table.insert(components.active[3], {
    provider = "position",
    left_sep = "left_rounded",
    hl = {
        fg = "#1e1e2e",
        bg = "#fab387",
    },
})

return components
