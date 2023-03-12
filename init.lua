local config = require("config")
config.g.mapleader = config.mapleader

require("core.opts")(config.opts, config.g)
