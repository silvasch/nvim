return function(plugins, colorscheme, profile, disable_autopairs, disable_indent_hints)
    -- Bootstrap lazy
    local lazypath = vim.fn.stdpath("data") .. "/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable",
            lazypath,
        })
    end
    vim.opt.rtp:prepend(lazypath)

    -- Add default plugins
    table.insert(plugins, {
            { "folke/which-key.nvim", config = true }
    })

    if disable_autopairs == true then
    else
        table.insert(plugins, {
            { "windwp/nvim-autopairs", config = true },
        })
    end

    if disable_indent_hints == true then
    else
        table.insert(plugins, {
            { "lukas-reineke/indent-blankline.nvim" },
        })
    end
    
    -- Setup lazy
    require("lazy").setup(plugins, {
        root = vim.fn.stdpath("data") .. "/plugins/" .. profile,
        lockfile = vim.fn.stdpath("data") .. "/plugins/" .. profile .. "/lazy-lock.json",
        install = {
            colorscheme = { colorscheme }
        }
    })
end
