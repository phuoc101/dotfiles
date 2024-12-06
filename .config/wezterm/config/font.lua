local wezterm = require("wezterm")
local mod = {}
local font_size = 11

local font = "JetBrainsMono Nerd Font"
local font_rules = {
	-- For Bold-but-not-italic text
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font({
			family = font,
			weight = "Bold",
		}),
	},

	-- Bold-and-italic
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font({
			family = font,
			weight = "Bold",
			italic = true,
		}),
	},

	-- normal-intensity-and-italic
	{
		intensity = "Normal",
		italic = true,
		font = wezterm.font({
			family = font,
			weight = "Regular",
			italic = true,
		}),
	},

	-- half-intensity-and-italic (half-bright or dim); use a lighter weight font
	{
		intensity = "Half",
		italic = true,
		font = wezterm.font({
			family = font,
			weight = "Light",
			italic = true,
		}),
	},

	-- half-intensity-and-not-italic
	{
		intensity = "Half",
		italic = false,
		font = wezterm.font({
			family = font,
			weight = "ExtraLight",
		}),
	},
}
function mod.apply_to_config(config)
	config.font = wezterm.font(font, { weight = "Regular", italic = false })
	config.font_size = font_size
	config.font_rules = font_rules
end

return mod
