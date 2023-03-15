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
            func = function()
                vim.cmd("quit")
            end,
        },
        new_file = {
            desc = "Create a new file",
            func = function()
                vim.cmd("enew")
            end
        },
        -- file picker
        find_files = {
            desc = "Open the file picker",
            func = function()
                vim.cmd("Telescope find_files")
            end,
        },
        -- config
        open_config_file = {
            desc = "Open the config file",
            func = function()
                vim.cmd("e ~/.config/nvim/lua/config/profiles/" .. profile .. "/init.lua")
            end
        },
        open_funcs_file = {
            desc = "Open the command definition file",
            func = function()
                vim.cmd("e ~/.config/nvim/lua/config/profiles/" .. profile .. "/funcs.lua")
            end
        },
        select_colorscheme = {
            desc = "Select the colorscheme",
            func = function()
                vim.cmd("Telescope colorscheme")
            end
        },
    }
end
