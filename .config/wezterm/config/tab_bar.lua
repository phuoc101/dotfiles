-- Separators
local colors = require("config.colors")
local wezterm = require("wezterm")
local mod = {}

local SOLID_LEFT_HALF_CIRCLE = wezterm.nerdfonts.ple_left_half_circle_thick
local SOLID_RIGHT_HALF_CIRCLE = wezterm.nerdfonts.ple_right_half_circle_thick

local function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = tab.tab_index .. ": " .. tab_title(tab)

	local edge_background = "transparent"
	local background = colors.bg1
	local foreground = colors.fg1

	if tab.is_active then
		background = colors.fg2
		foreground = colors.bg2
	elseif hover then
		background = colors.bg3
		foreground = colors.fg3
	end

	local edge_foreground = background
	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_LEFT_HALF_CIRCLE },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_HALF_CIRCLE },
	}
end)

function mod.apply_to_config(config)
	config.colors = {
		tab_bar = {
			background = colors.bg0,
		},
	}
	-- Tab bar configs
	config.tab_bar_at_bottom = true
	config.use_fancy_tab_bar = false
	config.show_new_tab_button_in_tab_bar = false
	config.hide_tab_bar_if_only_one_tab = false
	config.tab_max_width = 32
	config.show_tab_index_in_tab_bar = true
end

return mod
