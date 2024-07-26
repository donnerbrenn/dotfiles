-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration
local config = wezterm.config_builder()

config.font = wezterm.font("RobotoMonoNerdFont")
config.font_size = 18
config.enable_tab_bar = false
config.window_background_opacity = 0.9
config.color_scheme = "Catpuccin Mocha"
return config
