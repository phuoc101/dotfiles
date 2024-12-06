return {
	max_fps = 120,
	-- So that it doesn't shrink window when font size is changed
	adjust_window_size_when_changing_font_size = false,
	-- Stop sending warnings about missing glyphs
	warn_about_missing_glyphs = false,
	-- run debug overlay (ctrl|shift|alt + L) and then wezterm.gui.enumerate_gpus()
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
	term = "xterm-256color",
	enable_kitty_graphics = true,
}
