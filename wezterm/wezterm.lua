local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.automatically_reload_config = true
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })
config.font_size = 15

config.window_background_opacity = 0.95
config.text_background_opacity = 1.0
config.color_scheme = "Campbell (Gogh)"
return config
