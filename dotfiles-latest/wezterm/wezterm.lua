local wezterm = require("wezterm")

-- Load your custom colors from the shared Neovim/WezTerm color table
local colors = dofile(os.getenv("HOME") .. "/github/dotfiles-latest/neovim/neobean/lua/config/colors.lua")

-- Use the builder so settings can be merged/extended later
local config = wezterm.config_builder()

-- --- Terminal Emulation & Compatibility ---
config.term = "xterm-256color" -- Use kitty terminfo for best graphics/undercurl support
config.enable_kitty_graphics = true -- Enable kitty-style image protocol for inline images

-- --- Performance ---
config.max_fps = 120 -- Smoother rendering

-- --- Keyboard/Input ---
config.send_composed_key_when_left_alt_is_pressed = true -- Allows left alt + key combos for accents, etc.

-- --- Window UI ---
config.window_decorations = "TITLE" -- No Mac-style titlebar/buttons, just resizable border

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

-- --- Hide Scrollbar ---
config.enable_scroll_bar = false

-- --- Ligatures ---
config.harfbuzz_features = { "calt=1", "clig=1", "liga=1" }

-- --- Transparency / Opacity ---
config.window_background_opacity = 0.90 -- Main window background (0.0 - 1.0)
config.text_background_opacity = 1.0 -- Text is fully solid (can reduce if you want, but 1.0 is good for readability)

-- --- Fonts ---
config.font = wezterm.font("JetBrainsMono Nerd Font Mono") -- Use your preferred nerd font
config.font_size = 15 -- Font size (change to your liking)

-- --- Tabs/Pane UI ---
config.enable_tab_bar = false -- Hide the tab bar at the top (set to true to show tabs)
config.window_close_confirmation = "NeverPrompt" -- Don’t ask for confirmation when closing windows

-- --- Cursor ---
config.default_cursor_style = "SteadyBlock" -- Solid, non-blinking block cursor
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_rate = 0 -- 0 disables blinking

-- --- Window Padding ---
config.window_padding = {
	left = 18,
	right = 18,
	top = 20,
	bottom = 12,
}

-- --- Rounded Corners ---
config.window_frame = {
	border_left_width = "2px",
	border_right_width = "2px",
	border_bottom_height = "2px",
	border_top_height = "2px",
	border_left_color = "#232e3b",
	border_right_color = "#232e3b",
	border_bottom_color = "#232e3b",
	border_top_color = "#232e3b",
}

-- --- Colorscheme ---
config.colors = {
	-- General colors
	foreground = colors["linkarzu_color14"], -- Default text
	background = colors["linkarzu_color10"], -- Default background
	cursor_bg = "#ff61ef", -- Cursor background
	cursor_fg = colors["linkarzu_color10"], -- Cursor text
	cursor_border = "#ff61ef", -- Cursor border

	selection_fg = colors["linkarzu_color14"], -- Selected text
	selection_bg = colors["linkarzu_color16"], -- Selection background

	scrollbar_thumb = "#6a5acd", -- Scrollbar color
	split = colors["linkarzu_color02"], -- Pane splitter color

	-- ANSI colors
	ansi = {
		colors["linkarzu_color10"], -- black
		colors["linkarzu_color11"], -- red
		colors["linkarzu_color02"], -- green
		colors["linkarzu_color05"], -- yellow
		colors["linkarzu_color04"], -- blue
		colors["linkarzu_color01"], -- magenta
		colors["linkarzu_color03"], -- cyan
		colors["linkarzu_color14"], -- white
	},

	brights = {
		colors["linkarzu_color08"], -- bright black
		colors["linkarzu_color11"], -- bright red
		colors["linkarzu_color02"], -- bright green
		colors["linkarzu_color05"], -- bright yellow
		colors["linkarzu_color04"], -- bright blue
		colors["linkarzu_color01"], -- bright magenta
		colors["linkarzu_color03"], -- bright cyan
		colors["linkarzu_color14"], -- bright white
	},
}

-- Wezterm Config --
config.default_prog = { "/usr/bin/zsh" }

-- --- Done! ---
return config
