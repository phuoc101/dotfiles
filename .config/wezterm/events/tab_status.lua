local colors = require("config.colors")
local wezterm = require("wezterm")
local M = {}

local process_icons = {
	["nnn"] = wezterm.nerdfonts.oct_file_submodule,
	["docker"] = wezterm.nerdfonts.linux_docker,
	["docker-compose"] = wezterm.nerdfonts.linux_docker,
	["btm"] = wezterm.nerdfonts.md_application_cog_outline,
	["psql"] = wezterm.nerdfonts.md_database_cog,
	["usql"] = wezterm.nerdfonts.md_database_cog,
	["kuberlr"] = wezterm.nerdfonts.linux_docker,
	["ssh"] = wezterm.nerdfonts.fa_exchange,
	["ssh-add"] = wezterm.nerdfonts.fa_exchange,
	["kubectl"] = wezterm.nerdfonts.linux_docker,
	["stern"] = wezterm.nerdfonts.linux_docker,
	["nvim"] = wezterm.nerdfonts.custom_vim,
	["vim"] = wezterm.nerdfonts.dev_vim,
	["make"] = wezterm.nerdfonts.seti_makefile,
	["node"] = wezterm.nerdfonts.mdi_hexagon,
	["go"] = wezterm.nerdfonts.seti_go,
	["python3"] = wezterm.nerdfonts.dev_python,
	["Python"] = wezterm.nerdfonts.dev_python,
	["zsh"] = wezterm.nerdfonts.dev_terminal,
	["bash"] = wezterm.nerdfonts.cod_terminal_bash,
	["htop"] = wezterm.nerdfonts.mdi_chart_donut_variant,
	["cargo"] = wezterm.nerdfonts.dev_rust,
	["sudo"] = wezterm.nerdfonts.fa_hashtag,
	["lazydocker"] = wezterm.nerdfonts.linux_docker,
	["git"] = wezterm.nerdfonts.dev_git,
	["lua"] = wezterm.nerdfonts.seti_lua,
	["wget"] = wezterm.nerdfonts.mdi_arrow_down_box,
	["curl"] = wezterm.nerdfonts.mdi_flattr,
	["gh"] = wezterm.nerdfonts.dev_github_badge,
	["ruby"] = wezterm.nerdfonts.cod_ruby,
	["tmux"] = wezterm.nerdfonts.cod_terminal_tmux,
	["zellij"] = wezterm.nerdfonts.cod_terminal_tmux,
	["lazygit"] = wezterm.nerdfonts.dev_git,
}
local SOLID_LEFT_HALF_CIRCLE = wezterm.nerdfonts.ple_left_half_circle_thick
local SOLID_RIGHT_HALF_CIRCLE = wezterm.nerdfonts.ple_right_half_circle_thick

local function get_process(tab)
	if not tab.active_pane or tab.active_pane.foreground_process_name == "" then
		return nil
	end

	local process_name = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")
	if string.find(process_name, "kubectl") then
		process_name = "kubectl"
	end

	return process_icons[process_name] or string.format("[%s]", process_name)
end

local function format_tab_title(tab, _, _, _, hover, _)
	local process = get_process(tab)
	local title = process .. " " .. tab.tab_index

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
end

function M.enable()
   wezterm.on('format-tab-title', format_tab_title)
end

return M
