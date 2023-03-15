local function wrapped(cmd)
    return function()
        vim.cmd(cmd)
    end
end

-- funcs
-- define all commands that the command palette should know here
-- structure:
-- <name> = {
--     desc = <description>,
--     func = <function that should be executed>
-- }
return function(profile)
    return {
        -- basic commands
        save_file = {
            desc = "Save the current file",
            func = function()
                local file_name = vim.fn.bufname()
                if file_name == "" then
                    file_name = vim.fn.input("Filename (esc or leave empty to cancel): ", "", "file")
                    if file_name == nil or file_name == "" then
                        return
                    end
                end
                vim.cmd("write " .. file_name)
            end,
        },
        quit_buffer = {
            desc = "Quit the current buffer",
            func = wrapped("quit"),
        },
        new_file = {
            desc = "Create a new file",
            func = wrapped("enew"),
        },
        -- file picker
        find_files = {
            desc = "Open the file picker",
            func = wrapped("Telescope find_files"),
        },
        -- config
        open_config_file = {
            desc = "Open the config file",
            func = wrapped("e ~/.config/nvim/lua/config/profiles/" .. profile .. "/init.lua"),
        },
        open_funcs_file = {
            desc = "Open the command definition file",
            func = wrapped("e ~/.config/nvim/lua/config/profiles/" .. profile .. "/init.lua"),
        },
        select_colorscheme = {
            desc = "Select the colorscheme",
            func = wrapped("Telescope colorscheme"),
        },
    }
end
