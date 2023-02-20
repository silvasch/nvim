local utils = require("profiles.dev.utils")

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

        -- signcolumn
        signcolumn = "yes",

        timeoutlen = 150,

        termguicolors = true,
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

                f = { "<cmd>Telescope find_files<cr>", "Open the file picker" },
                e = { "<cmd>Neotree float<cr>", "Open the file explorer" },

                t = { "<cmd>TroubleToggle<cr>", "Show issues in this file" },

                g = {
                    name = "Git",
                    l = { "<cmd>LazyGit<cr>", "Open lazygit" },
                },

                l = {
                    name = "LSP",
                    r = { vim.lsp.buf.rename, "Rename the current symbol" },
                    d = { vim.lsp.buf.definition, "Go to the definition of the current symbol" },
                    h = { vim.lsp.buf.hover, "Open the hover menu of the current symbol" },
                    s = { vim.lsp.buf.signature_help, "Show the signature of the current symbol" },
                    a = { vim.lsp.buf.code_action, "Code actions" },
                    f = { vim.lsp.buf.format, "Format the current file" },
                }
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
        { "famiu/bufdelete.nvim" },
        { "rcarriga/nvim-notify" },
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
        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v2.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons",
                "MunifTanjim/nui.nvim",
            },
            config = function()
                vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
            end,
        },

        -- lsp
        {
            "VonHeikemen/lsp-zero.nvim",
            branch = "v1.x",
            dependencies = {
                -- lsp support
                { 'neovim/nvim-lspconfig' }, -- required
                { 'williamboman/mason.nvim' }, -- optional
                { 'williamboman/mason-lspconfig.nvim' }, -- optional

                -- autocompletion
                { 'hrsh7th/nvim-cmp' }, -- required
                { 'hrsh7th/cmp-nvim-lsp' }, -- required
                { 'hrsh7th/cmp-buffer' }, -- optional
                { 'hrsh7th/cmp-path' }, -- optional
                { 'saadparwaiz1/cmp_luasnip' }, -- optional
                { 'hrsh7th/cmp-nvim-lua' }, -- optional

                -- snippets
                { 'L3MON4D3/LuaSnip' }, -- required
                { 'rafamadriz/friendly-snippets' }, -- optional
            },
            config = function()
                require("profiles.dev.lsp")
            end
        },
        {
            "folke/trouble.nvim",
            dependencies = {
                "nvim-tree/nvim-web-devicons",
            },
            config = {
                position = "right",
                width = 35,
            },
        },

        -- git
        { "lewis6991/gitsigns.nvim",         config = true },
        { "kdheepak/lazygit.nvim" },

        -- treesitter
        { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

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
