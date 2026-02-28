local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("CaskaydiaCove Nerd Font")
config.font_size = 13

config.color_scheme = "Catppuccin Mocha"

config.hide_tab_bar_if_only_one_tab = true
 
config.kde_window_background_blur = true

-- Set initial transparency
config.window_background_opacity = 0.95

-- Setup Toggle Keybinding
wezterm.on('toggle-opacity', function(window, pane)
    local overrides = window:get_config_overrides() or {}
    if overrides.window_background_opacity  == 1 then
        overrides.window_background_opacity = 0.95
    else
        overrides.window_background_opacity = 1
    end
    window:set_config_overrides(overrides)
end)

--config.keys = {
--  {
--    key = 'o', 
--    mods = 'CTRL', 
--    action = wezterm.action.EmitEvent("toggle-opacity")
--  }
--}


-- Move tab bar to top
config.tab_bar_at_bottom = true
-- Hide tab bar if only one tab is open
config.hide_tab_bar_if_only_one_tab = true
-- Optional: Style to match minimalism
config.use_fancy_tab_bar = false


config.keys = {
  {
    key = "t",
    mods = "CMD",
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = "w",
    mods = "CMD",
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 't',
    mods = 'ALT',
    action = wezterm.action.SpawnCommandInNewTab {
      domain = 'CurrentPaneDomain' -- Opens in same directory
    },
  },
  {
    key = "w",
    mods = "ALT",
    action = wezterm.action.CloseCurrentTab { confirm = true }
  },
  {
    key = "LeftArrow",
    mods = 'ALT',
    action = wezterm.action.ActivateTabRelative(-1)
  },
  {
    key = "RightArrow",
    mods = 'ALT',
    action = wezterm.action.ActivateTabRelative(1)
  },
  --Set tab title
  {
    key = 't',
    mods = 'ALT|SHIFT',
    action = wezterm.action.PromptInputLine {
      description = 'Enter new name for tab',
      initial_value = '',
      action = wezterm.action_callback(function(window, pane, line)
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
    key = 'o', 
    mods = 'CTRL', 
    action = wezterm.action.EmitEvent("toggle-opacity")
  }
}
for i = 1, 8 do
  -- CTRL+ALT + number to activate that tab
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'ALT',
    action = wezterm.action.ActivateTab(i - 1),
  })
  -- F1 through F8 to activate that tab
  table.insert(config.keys, {
    key = 'F' .. tostring(i),
    action = wezterm.action.ActivateTab(i - 1),
  })
end

return config
