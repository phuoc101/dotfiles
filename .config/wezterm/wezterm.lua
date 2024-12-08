-- Pull in the wezterm API
local Config = require 'config'
local modules = Config.map({
  'config.appearance',
  'config.keys',
  'config.rendering',
  'config.tab_bar',
}, Config.req)
Config = Config.merge(table.unpack(modules))

require('events.tab_status').enable()
require('events.toggle_colorscheme').enable()

-- and finally, return the configuration to wezterm
return Config
