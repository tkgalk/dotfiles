local wezterm = require "wezterm"

local function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

local function scheme_for_appearance(appearance)
	if appearance:find "Dark" then
		return "NvimDark"
	else
		return "NvimLight"
	end
end

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font("Berkeley Mono")
config.font_size = 16
config.line_height = 1.2
config.freetype_render_target = "HorizontalLcd"

config.window_background_opacity = 1
config.strikethrough_position = "0.5cell"
config.use_resize_increments = true

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

config.color_scheme = scheme_for_appearance(get_appearance())

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.keys = {
	{
		key = 'R',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.PromptInputLine {
			description = 'Enter new name for tab',
			action = wezterm.action_callback(function(window, _, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:active_tab():set_title(line)
				end
			end),
		},
	},
	{
		key = 'H',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.MoveTabRelative(-1),
	},
	{
		key = 'L',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.MoveTabRelative(1),
	}
}

-- CTRL+ALT + number to move to that position
for i = 1, 8 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = 'CTRL|SHIFT',
		action = wezterm.action.MoveTab(i - 1),
	})
end

-- Start wezterm with a maximized window.
wezterm.on('gui-startup', function(cmd)
	local _, _, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

return config
