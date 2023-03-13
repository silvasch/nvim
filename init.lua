local config = require("config")
config.g.mapleader = config.mapleader

require("core.opts")(config.opts, config.g)

table.insert(config.plugins, require("core.default_plugins_conf.legendary")(config.funcs))
table.insert(config.plugins, require("core.default_plugins_conf.whichkey"))
require("core.plugins")(config.plugins, config.colorscheme)
require("core.mappings")(config.mappings)
