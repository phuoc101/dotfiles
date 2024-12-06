-- Separators
local colors = require("config.colors")

return {
	colors = {
		tab_bar = {
			background = colors.bg0,
		},
	},
	-- Tab bar configs
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	show_new_tab_button_in_tab_bar = false,
	hide_tab_bar_if_only_one_tab = false,
	tab_max_width = 16,
	show_tab_index_in_tab_bar = true,
}
