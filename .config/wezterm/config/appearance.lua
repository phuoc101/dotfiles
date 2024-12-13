local wezterm = require 'wezterm'
local font_size = 11

local font = 'JetBrainsMono Nerd Font'

return {
  window_padding = {
    left = 20,
    right = 20,
    top = 20,
    bottom = 0,
  },
  color_scheme = 'nordfox',
  force_reverse_video_cursor = false,
  font = wezterm.font(font, { weight = 'Regular', italic = false }),
  font_size = font_size,
}
