return function(funcs)
    local edited_funcs = {}
    for _, v in pairs(funcs) do
        table.insert(edited_funcs, v)
    end

    return {
        "mrjones2014/legendary.nvim",
        opts = {
            funcs = edited_funcs,
        }
    }
end
