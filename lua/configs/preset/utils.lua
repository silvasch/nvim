function SaveFile()
    local file_name = vim.fn.bufname() -- get current file name
    if file_name == "" then -- is it an empty buffer?
        vim.api.nvim_feedkeys(":w ", "n", true) -- yes, prepare write command for user to type the filename in
    else
        vim.cmd([[ write ]]) -- no, already is a file, just save
    end
end

return {
    save_file = SaveFile,
}
