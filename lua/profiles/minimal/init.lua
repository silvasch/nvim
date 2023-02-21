local profile_name = "minimal"

local utils = require("profiles." .. profile_name .. ".utils")

return {
    -- global configs
    mapleader = " ",
    colorscheme = "catppuccin",

    -- options
    -- you would set them with `:set k=v`, or in lua `vim.opt[k] = v`
    opts = {
        -- four wide tabs
        shiftwidth = 4,
        tabstop = 4,
        expandtab = true,

        -- line numbers
        number = true,
        relativenumber = true,

        timeoutlen = 150,
    },

    -- variables
    -- you would set them with `:let k=v`, or in lua `vim.g[k] = v`
    g = {},

    -- mappings
    -- first layer is the mode that the mapping should be activated in
    -- second layer are the keybindings, with the structure of which-key (https://github.com/folke/which-key.nvim#%EF%B8%8F-mappings)
    mappings = {
        n = {
            ["<leader>"] = {
                w = { utils.save_file, "Save the current file" },
                q = { "<cmd>quit<cr>", "Quit the editor" },
                n = { "<cmd>enew<cr>", "Create a new file" },
                f = {
                    "<cmd>Telescope find_files<cr>",
                    "Open the file picker"
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
        -- enhancements
        { "nvim-tree/nvim-web-devicons" },

        -- file pickers
        {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.1",
            dependencies = {
                "nvim-lua/plenary.nvim"
            },
            opts = {
                defaults = {
                    file_ignore_patterns = {
                        "target/",
                        "node_modules/",
                    }
                }
            }
        },

        -- themes
        {
            "catppuccin/nvim",
            name = "catppuccin",
            opts = {
                flavour = "mocha",
            }
        },
    },

    -- this configuration installs three default plugins: folke/which-key.nvim, windwp/nvim-autopairs
    -- and lukas-reineke/indent-blankline.nvim
    -- two of them can be disabled here
    default_plugins = {
        disable_autopairs = false,
        disable_indent_hints = false,
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
    autocmds = {},
}
