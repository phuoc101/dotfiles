local wezterm = require 'wezterm'
local os = require 'os'
local M = {}

local function toggle_colorscheme(window, pane)
  local overrides = window:get_config_overrides() or {}
  if not overrides.color_scheme then
    overrides.color_scheme = 'nord-light'
    os.execute 'reload_nvim_theme -c dayfox'
    os.execute 'init_displays -l'
  else
    overrides.color_scheme = nil
    os.execute 'reload_nvim_theme -c nordfox'
    os.execute 'init_displays -n'
  end
  window:set_config_overrides(overrides)
end
function M.enable()
  wezterm.on('toggle-colorscheme', toggle_colorscheme)
end

return M
