local M = {}

function M.apply(config)
  config.max_fps = 120
  config.animation_fps = 120
  -- So that it doesn't shrink window when font size is changed
  config.adjust_window_size_when_changing_font_size = false
  -- Stop sending warnings about missing glyphs
  config.warn_about_missing_glyphs = false
  -- run debug overlay (leader + L) and then wezterm.gui.enumerate_gpus()
  -- config.webgpu_preferred_adapter = {
  --   backend = 'Vulkan',
  --   device = 9376,
  --   device_type = 'DiscreteGpu',
  --   driver = 'NVIDIA',
  --   driver_info = '550.120',
  --   name = 'NVIDIA GeForce RTX 3070 Ti Laptop GPU',
  --   vendor = 4318,
  --   -- backend = 'Vulkan',
  --   -- device = 5761,
  --   -- device_type = 'IntegratedGpu',
  --   -- driver = 'radv',
  --   -- driver_info = 'Mesa 23.2.1-1ubuntu3.1~22.04.2',
  --   -- name = 'AMD Unknown (RADV REMBRANDT)',
  --   -- vendor = 4098,
  -- }
  -- config.webgpu_power_preference = 'HighPerformance'
  config.front_end = 'OpenGL'
  config.term = 'xterm-256color'
  config.enable_kitty_graphics = true
end

return M
