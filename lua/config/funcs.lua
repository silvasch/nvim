return {
    save_file = {
        desc = "Save the current file",
        func = function()
            local file_name = vim.fn.bufname()
            if file_name == "" then
                file_name = vim.fn.input("Filename (esc or leave empty to cancel): ", "", "file")
                if file_name == nil or file_name == "" then
                    return
                end
            end
            vim.cmd("write " .. file_name)
        end,
    },

    find_files = {
        desc = "Open the file picker",
        func = function()
            vim.cmd("Telescope find_files")
        end,
    },
    quit_buffer = {
        desc = "Quit the current buffer",
        func = function()
            vim.cmd("quit")
        end,
    },

    open_trouble = {
        desc = "Open trouble",
        func = function()
            vim.cmd("TroubleToggle")
        end,
    },

    -- lsp
    lsp_rename = {
        desc = "LSP: Rename the current symbol",
        func = vim.lsp.buf.rename,
    },
    lsp_hover = {
        desc = "LSP: Show the hover menu of the current symbol",
        func = vim.lsp.buf.signature_help,
    },
    code_actions = {
        desc = "LSP: Code actions",
        func = vim.lsp.buf.code_actions,
    },
    format = {
        desc = "LSP: Format the current document",
        func = vim.lsp.buf.format,
    },
    lsp_declaration = {
        desc = "LSP: Go to the declaration of the current symbol",
        func = vim.lsp.buf.hover,
    },
    lsp_definition = {
        desc = "LSP: Go to the definition of the current symbol",
        func = vim.lsp.definition,
    }
}
