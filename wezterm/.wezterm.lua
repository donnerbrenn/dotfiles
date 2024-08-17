-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

-- This will hold the configuration
local config = wezterm.config_builder()
-- Window
config.max_fps = 144
config.window_background_opacity = 0.95
-- Style
config.enable_tab_bar = false
config.color_scheme = "ChallengerDeep"
config.window_close_confirmation = "NeverPrompt"
-- Font
config.font = wezterm.font("RobotoMonoNerdFont")
config.font_size = 16
-- Cursor
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 144
config.cursor_blink_rate = 500
config.cursor_blink_ease_in = "EaseOut"
config.cursor_blink_ease_out = "EaseOut"
return config
