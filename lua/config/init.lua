return {
    colorscheme = nil,
	mapleader = " ",

	opts = {
		-- tab length
		tabstop = 4,
		shiftwidth = 4,
		expandtab = true,
	},
	g = {},
    -- this table will be passed to lazy.nvim
    plugins = {
        -- enhancements
        { "windwp/nvim-autopairs", config = true },
    },
    mappings = {
        n = {
            w = {  }
        }
    },
    funcs = {
        ["say_hello"] = {
            function() print("Hello, World!") end,
            description = "Say hello to the world",
        },
    }
}
