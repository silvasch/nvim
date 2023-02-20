local utils = require("profiles.minimal.utils")

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
	},

    -- variables
    -- you would set them with `:let k=v`, or in lua `vim.g[k] = v`
	g = {
        settimeoutlen = 150,
    },

    -- mappings
    -- first layer is the mode that the mapping should be activated in
    -- second layer are the keybindings, with the structure of which-key (https://github.com/folke/which-key.nvim#%EF%B8%8F-mappings)
    mappings = {
        n = {
            ["<leader>"] = {
                w = { utils.save_file, "Save the current file" },
                q = { "<cmd>quit<cr>", "Quit the editor" },
                n = { "<cmd>enew<cr>", "Create a new file" },
            }
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
            config = {
                defaults = {
                    file_ignore_patterns = {
                        "target/",
                        "node_modules/",
                    }
                }
            }
        },
        
        -- treesitter
        {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

        -- themes
        {
            "catppuccin/nvim",
            name = "catppuccin",
            config = {
                flavour = "mocha",
            }
        },
    },
    
    -- this configuration installs three default plugins: folke/which-key.nvim, windwp/nvim-autopairs
    -- and lukas-reineke/indent-blankline.nvim
    -- two of them can be disabled here
    disable_autopairs = false,
    disable_indent_hints = false,

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
        {
            event = "VimEnter",
            cmd = {
                desc = "Start Telescope when vim is opened with no argumens",
                callback = function()
                    if vim.fn.argc() == 0 then
                        vim.cmd("Telescope find_files")
                    end
                end,
            },
        },
    },
}
