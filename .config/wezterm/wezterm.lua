-- Pull in the wezterm API
local config = require 'config'
local modules = config.map({
  'config.appearance',
  'config.keys',
  'config.rendering',
  'config.tab_bar',
}, config.req)

require('events.tab_status').enable()
require('events.toggle_colorscheme').enable()

-- and finally, return the configuration to wezterm
return config.merge(table.unpack(modules))
