local function wrapped_cmd(cmd)
    return function()
        vim.cmd(cmd)
    end
end

local function load_mod(mod)
	return function()
		require(mod)
	end
end

local function profile_mod(profile, module)
    return "config.profiles." .. profile .. "." .. module
end

return {
    wrapped_cmd = wrapped_cmd,
    load_mod = load_mod,
    profile_mod = profile_mod,
}
