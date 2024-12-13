local wezterm = require 'wezterm'
local font_size = 11
local M = {}

local font = 'JetBrainsMono Nerd Font'

function M.apply(config)
  config.window_padding = {
    left = 20,
    right = 20,
    top = 20,
    bottom = 0,
  }
  config.color_scheme = 'nordfox'
  config.force_reverse_video_cursor = false
  config.font = wezterm.font(font, { weight = 'Regular', italic = false })
  config.font_size = font_size
end

return M
