local profile = "dev"

local funcs = require("config.profiles." .. profile .. ".funcs")

return {
    -- global configs
    mapleader = " ",
    colorscheme = "catppuccin",
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

                t = {
                    funcs.open_trouble.func,
                    funcs.open_trouble.desc,
                },

                l = {
                    name = "LSP",
                    r = { vim.lsp.buf.rename, "Rename the current symbol" },
                    d = { vim.lsp.buf.definition, "Go to the definition of the current symbol" },
                    D = { vim.lsp.buf.declaration, "Go to the declaration of the current symbol" },
                    h = { vim.lsp.buf.hover, "Open the hover menu of the current symbol" },
                    s = { vim.lsp.buf.signature_help, "Show the signature of the current symbol" },
                    a = { vim.lsp.buf.code_action, "Code actions" },
                    f = { vim.lsp.buf.format, "Format the current file" },
                },

            },
            [":"] = {
                "<cmd>FineCmdline<cr>",
                "Open the command line",
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
                require("config.profiles." .. profile .. ".plugins.lsp")
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
                require("config.profiles." .. profile .. ".plugins.treesitter")
            end,
        },

        -- themes
        {
            "catppuccin/nvim",
            name = "catppuccin"
        },
        { "nyoom-engineering/oxocarbon.nvim" },
        { "NTBBloodbath/sweetie.nvim" },
        {
            "rebelot/kanagawa.nvim",
            opts = {
                theme = "wave",
            },
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
