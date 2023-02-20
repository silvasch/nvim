local profile = os.getenv("NVIM_CONFIG")
if profile == nil then
	profile = "dev"
end

print("Loading the " .. profile .. " profile")

local config = require("configs." .. profile)
