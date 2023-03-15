local wrapped_cmd = require("utils").wrapped_cmd

-- funcs
-- define all commands that the command palette should know here
-- structure:
-- <name> = {
--     desc = <description>,
--     func = <function that should be executed>
-- }
return function(profile)
    return {
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
        select_colorscheme = {
            desc = "Select the colorscheme",
            func = wrapped_cmd("Telescope colorscheme"),
        },
        find_files = {
            desc = "Open the file picker",
            func = wrapped_cmd("Telescope find_files"),
        },
        open_file_tree = {
            desc = "Open the filebrowser",
            func = wrapped_cmd("NeoTreeFloatToggle"),
        },
        quit_buffer = {
            desc = "Quit the current buffer",
            func = wrapped_cmd("quit"),
        },
        new_file = {
            desc = "Create a new file",
            func = wrapped_cmd("enew"),
        },
        open_config_file = {
            desc = "Open the config file",
            func = wrapped_cmd("e ~/.config/nvim/lua/config/profiles/" .. profile .. "/init.lua"),
        },
        open_funcs_file = {
            desc = "Open the command definition file",
            func = wrapped_cmd("e ~/.config/nvim/lua/config/profiles/" .. profile .. "/funcs.lua"),
        },
        open_trouble = {
            desc = "Open trouble",
            func = wrapped_cmd("TroubleToggle"),
        },
        -- lsp
        lsp_rename = {
            desc = "LSP: Rename the current symbol",
            func = vim.lsp.buf.rename,
        },
        lsp_hover = {
            desc = "LSP: Show the hover menu of the current symbol",
            func = vim.lsp.buf.hover,
        },
        code_actions = {
            desc = "LSP: Code actions",
            func = vim.lsp.buf.code_action,
        },
        format = {
            desc = "LSP: Format the current document",
            func = vim.lsp.buf.format,
        },
        lsp_declaration = {
            desc = "LSP: Go to the declaration of the current symbol",
            func = vim.lsp.buf.declaration,
        },
        lsp_definition = {
            desc = "LSP: Go to the definition of the current symbol",
            func = vim.lsp.definition,
        },
        lazygit = {
            desc = "Open lazygit",
            func = wrapped_cmd("LazyGit"),
        }
    }
end
