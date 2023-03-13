return {
	mapleader = " ",
    colorscheme = "catppuccin",

	opts = {
		-- tab length
		tabstop = 4,
		shiftwidth = 4,
		expandtab = true,
	},
	g = {},
    plugins = {
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
}
