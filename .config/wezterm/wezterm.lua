-- Pull in the wezterm API
local config_utils = require("config_utils")
local modules = config_utils.map({
	"config.appearance",
	"config.keys",
	"config.rendering",
	"config.tab_bar",
}, config_utils.req)

require("events.tab_status").enable()

-- and finally, return the configuration to wezterm
return config_utils.merge(table.unpack(modules))
