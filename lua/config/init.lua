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

        -- line numbers
        number = true,
        relativenumber = true,

        timeoutlen = 150,

        signcolumn = "yes",

        background = "dark",
    },
    g = {},
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

                t = {
                    funcs.open_trouble.func,
                    funcs.open_trouble.desc,
                },

            },
            [":"] = {
                "<cmd>FineCmdline<cr>",
                "Open the command line",
            },
        },
    },
    plugins = {
        -- small enhancements
        { "windwp/nvim-autopairs",      config = true },
        { "nvim-tree/nvim-web-devicons" },
        { "rcarriga/nvim-notify" },
        { "famiu/bufdelete.nvim" },
        { "stevearc/dressing.nvim" },
        {
            "VonHeikemen/fine-cmdline.nvim",
            dependencies = {
                { "MunifTanjim/nui.nvim" },
            },
        },

        -- file pickers
        {
            "nvim-telescope/telescope.nvim",
            dependencies = {
                { "nvim-lua/plenary.nvim" },
            },
        },

        -- lsp
        {
            "VonHeikemen/lsp-zero.nvim",
            branch = "v1.x",
            dependencies = {
                -- lsp support
                { "neovim/nvim-lspconfig" },             -- required
                { "williamboman/mason.nvim" },           -- optional
                { "williamboman/mason-lspconfig.nvim" }, -- optional

                -- autocompletion
                { "hrsh7th/nvim-cmp", },        -- required
                { "hrsh7th/cmp-nvim-lsp" },     -- required
                { "hrsh7th/cmp-buffer" },       -- optional
                { "hrsh7th/cmp-path" },         -- optional
                { "saadparwaiz1/cmp_luasnip" }, -- optional
                { "hrsh7th/cmp-nvim-lua" },     -- optional

                -- snippets
                { "L3MON4D3/LuaSnip" },             -- required
                { "rafamadriz/friendly-snippets" }, -- optional
            },
            config = function()
                require("config.plugins.lsp")
            end
        },
        {
            "folke/trouble.nvim",
            dependencies = {
                "nvim-tree/nvim-web-devicons",
            },
            opts = {
                position = "right",
                width = 35,
            },
        },
        {
            "saecki/crates.nvim",
            tag = "v0.3.0",
            dependencies = {
                "nvim-lua/plenary.nvim",
            },
            config = function()
                require("crates").setup()
            end
        },

        -- git
        { "lewis6991/gitsigns.nvim", opts = {} },
        { "kdheepak/lazygit.nvim" },

        -- treesitter
        {
            "nvim-treesitter/nvim-treesitter",
            build = "TSUpdate",
            config = function()
                require("config.plugins.treesitter")
            end,
        },

        -- themes
        { "catppuccin/nvim",                 name = "catppuccin" },
        { "nyoom-engineering/oxocarbon.nvim" },
        { "NTBBloodbath/sweetie.nvim" },
        {
            "rebelot/kanagawa.nvim",
            opts = {
                theme = "wave",
            },
        },
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
