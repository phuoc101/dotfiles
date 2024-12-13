-- Separators
local colors = require 'config.colors'
local M = {}

function M.apply(config)
  config.colors = {
    tab_bar = {
      background = colors.bg0,
      active_tab = {
        bg_color = colors.fg1,
        fg_color = colors.bg1,
        intensity = 'Bold',
        underline = 'None',
        italic = false,
        strikethrough = false,
      },
      inactive_tab = {
        bg_color = colors.bg3,
        fg_color = colors.fg3,
      },

      inactive_tab_hover = {
        bg_color = colors.bg2,
        fg_color = colors.fg2,
        italic = true,
      },
      new_tab = {
        bg_color = colors.bg2,
        fg_color = colors.fg2,
      },
      new_tab_hover = {
        bg_color = colors.bg3,
        fg_color = colors.fg3,
        italic = true,
      },
    },
  }
  -- Tab bar configs
  config.tab_bar_at_bottom = true
  config.use_fancy_tab_bar = false
  config.show_new_tab_button_in_tab_bar = true
  config.hide_tab_bar_if_only_one_tab = false
  config.tab_max_width = 16
  config.show_tab_index_in_tab_bar = true
end

return M
