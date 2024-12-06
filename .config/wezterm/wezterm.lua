-- Pull in the wezterm API
local wezterm = require("wezterm")
-- NOTE: Keybindings

local tab_bar = require("config.tab_bar")
local font = require("config.font")
local keys = require("config.keys")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config = {
	color_scheme = "nord",
	force_reverse_video_cursor = true,
	max_fps = 120,
	-- So that it doesn't shrink window when font size is changed
	adjust_window_size_when_changing_font_size = false,
	-- Stop sending warnings about missing glyphs
	warn_about_missing_glyphs = false,
	-- run debug overlay (ctrl|shift|alt + L) and then wezterm.gui.enumerate_gpus()
	-- webgpu_preferred_adapter = {
	-- 	backend = "Vulkan",
	-- 	device = 9376,
	-- 	device_type = "DiscreteGpu",
	-- 	driver = "NVIDIA",
	-- 	driver_info = "550.120",
	-- 	name = "NVIDIA GeForce RTX 3070 Ti Laptop GPU",
	-- 	vendor = 4318,
	-- },
	webgpu_preferred_adapter = {
		backend = "Vulkan",
		device = 5761,
		device_type = "IntegratedGpu",
		driver = "radv",
		driver_info = "Mesa 23.2.1-1ubuntu3.1~22.04.2",
		name = "AMD Unknown (RADV REMBRANDT)",
		vendor = 4098,
	},
	front_end = "WebGpu",
	-- domains
}
font.apply_to_config(config)
keys.apply_to_config(config)
tab_bar.apply_to_config(config)

-- and finally, return the configuration to wezterm
return config
