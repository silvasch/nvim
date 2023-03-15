local profile = "minimal"

local funcs = require("config.profiles." .. profile .. ".funcs")(profile)

return {
    -- global configs
    mapleader = " ",
    colorscheme = nil,
    command_palette_mapping = "<leader>p",
    -- options
    -- you would set them with `:set k=v`, or in lua `vim.opt[k] = v`
    opts = {
        -- tab length
        tabstop = 4,
        shiftwidth = 4,
        expandtab = true,
        -- line numbers
        number = true,
        relativenumber = true,

        timeoutlen = 150,
        signcolumn = "yes",
        background = "dark",
    },
    -- variables
    -- you would set them with `:let k=v`, or in lua `vim.g[k] = v`
    g = {},
    -- mappings
    -- first layer is the mode that the mapping should be usable in
    -- second layer are the keybindings, defined with the structure of which-key (https://github.com/folke/which-key.nvim#%EF%B8%8F-mappings)
    mappings = {
        n = {
            ["<leader>"] = {
                w = {
                    funcs.save_file.func,
                    funcs.save_file.desc,
                },
                q = {
                    funcs.quit_buffer.func,
                    funcs.quit_buffer.desc,
                },

                f = {
                    funcs.find_files.func,
                    funcs.find_files.desc,
                },
            },
        },
        i = {},
        v = {},
        x = {},
    },
    -- plugins
    -- this table gets passed directly to lazy.nvim, the plugin manager
    -- look at the structure here: https://github.com/folke/lazy.nvim#-plugin-spec
    plugins = {
        -- file pickers
        {
            "nvim-telescope/telescope.nvim",
            dependencies = {
                { "nvim-lua/plenary.nvim" },
            },
        },

        -- treesitter
        {
            "nvim-treesitter/nvim-treesitter",
            build = "TSUpdate",
            config = function()
                require("config.profiles." .. profile .. ".plugins.treesitter")
            end,
        },
    },
    -- autocmds
    -- example:
    -- autocmds = {
    --     {
    --         event = "VimEnter",
    --         cmd = {
    --             desc = "Example autocommand",
    --             callback = function()
    --                 print("Ran the example autocommand")
    --             end
    --         }
    --     }
    -- }
    autocmds = {
        -- run `Telescope find_files` on startup
        {
            event = "VimEnter",
            cmd = {
                desc = "Start telescope when opening nvim without any arguments",
                callback = function()
                    if vim.fn.argc() == 0 then
                        vim.cmd("Telescope find_files")
                    end
                end,
            },
        },
    },
}
