local function wrapped(cmd)
    return function()
        vim.cmd(cmd)
    end
end

return {
    wrapped = wrapped,
}
