local wezterm = require("wezterm")

local config = wezterm.config_builder()

local is_windows = wezterm.target_triple:find("windows") ~= nil

if is_windows then
	config.default_domain = "WSL:Ubuntu"
	config.wsl_domains = {
		{
			name = "WSL:Ubuntu",
			distribution = "Ubuntu",
			default_cwd = "~",
		},
	}
end

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.85
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.enable_tab_bar = false
config.font_size = 10.0

wezterm.on("gui-startup", function()
	local _, _, window = wezterm.mux.spawn_window({})
	window:gui_window():maximize()
end)

return config
