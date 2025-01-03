local wezterm = require 'wezterm'
local config = wezterm.config_builder()

require('config.appearance').apply(config)
require('config.docker').apply(config)
require('config.keys').apply(config)
require('config.rendering').apply(config)
require('config.tab_bar').apply(config)

require('events.toggle_colorscheme').enable()

return config
