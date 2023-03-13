local funcs = require("config.funcs")

return {
	mapleader = " ",
    colorscheme = "catppuccin",

    command_palette_mapping = "<leader>p",

	opts = {
		-- tab length
		tabstop = 4,
		shiftwidth = 4,
		expandtab = true,

        timeoutlen = 150,
	},
	g = {},

    mappings = {
        n = {
            ["<leader>"] = {
                w = {
                    funcs.save_file.func,
                    funcs.save_file.desc,
                },

                f = {
                    funcs.find_files.func,
                    funcs.find_files.desc,
                },
            },
        },
    },

    plugins = {
        -- small enhancements
        { "windwp/nvim-autopairs", config = true },

        -- file pickers
        {
            "nvim-telescope/telescope.nvim",
            dependencies = {
                { "nvim-lua/plenary.nvim" },
            },
        },

        -- themes
        { "catppuccin/nvim", name = "catppuccin" },
    },
    autocmds = {
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
