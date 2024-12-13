local wezterm = require 'wezterm'
local M = {}

local keys = {
  {
    key = 'Enter',
    mods = 'CTRL',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'Enter',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'w',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = 'd',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  },
  {
    key = 'h',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'k',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'j',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    key = 'LeftArrow',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Left', 5 },
  },
  {
    key = 'DownArrow',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Down', 5 },
  },
  {
    key = 'UpArrow',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Up', 5 },
  },
  {
    key = 'RightArrow',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.AdjustPaneSize { 'Right', 5 },
  },
  {
    key = 'v',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.PasteFrom 'Clipboard',
  },
  {
    key = 'f',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.RotatePanes 'Clockwise',
  },
  {
    key = 'b',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.RotatePanes 'CounterClockwise',
  },
  {
    key = 'z',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    key = 'f',
    mods = 'LEADER',
    action = wezterm.action.Search { CaseSensitiveString = '' },
  },
  {
    key = 'r',
    mods = 'LEADER',
    action = wezterm.action.ReloadConfiguration,
  },
  { key = 'l', mods = 'LEADER', action = wezterm.action.ShowLauncher },
  { key = 'L', mods = 'LEADER', action = wezterm.action.ShowDebugOverlay },
  { key = 'c', mods = 'LEADER', action = wezterm.action.EmitEvent 'toggle-colorscheme' },
}
local key_tables = {
  search_mode = {
    { key = 'Enter', mods = 'NONE', action = wezterm.action.CopyMode 'PriorMatch' },
    { key = 'Escape', mods = 'NONE', action = wezterm.action.CopyMode 'Close' },
    { key = 'n', mods = 'CTRL', action = wezterm.action.CopyMode 'NextMatch' },
    { key = 'p', mods = 'CTRL', action = wezterm.action.CopyMode 'PriorMatch' },
    { key = 'r', mods = 'CTRL', action = wezterm.action.CopyMode 'CycleMatchType' },
    { key = 'u', mods = 'CTRL', action = wezterm.action.CopyMode 'ClearPattern' },
    {
      key = 'PageUp',
      mods = 'NONE',
      action = wezterm.action.CopyMode 'PriorMatchPage',
    },
    {
      key = 'PageDown',
      mods = 'NONE',
      action = wezterm.action.CopyMode 'NextMatchPage',
    },
    { key = 'UpArrow', mods = 'NONE', action = wezterm.action.CopyMode 'PriorMatch' },
    { key = 'DownArrow', mods = 'NONE', action = wezterm.action.CopyMode 'NextMatch' },
  },
}
function M.apply(config)
  config.leader = { key = 'w', mods = 'CTRL', timeout_milliseconds = 1000 }
  config.keys = keys
  config.key_tables = key_tables
end

return M
