local utils = require("configs.preset.utils")

return {
    -- global configs
	mapleader = " ",
    colorscheme = nil,

    -- options
	opts = {
		-- four wide tabs
		shiftwidth = 4,
		tabstop = 4,
		expandtab = true,

		-- line numbers
		number = true,
		relativenumber = true,
	},
	g = {},

    -- mappings
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
    plugins = {},
    -- disable_autopairs = false,
    -- disable_indent_hints = false,

    -- autocmds
    autocmds = {},
}
