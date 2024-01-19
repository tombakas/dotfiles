-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}
local act = wezterm.action

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.color_scheme = "Dracula"
config.window_background_opacity = 1
config.font = wezterm.font {
  family = "FiraCode Nerd Font Mono",
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
}
config.font_size = 14.0
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.set_environment_variables = {
  PATH = "/opt/homebrew/bin/:" .. os.getenv("PATH") .. ":" .. os.getenv("HOME") .. "/local/bin",
  SHELL = "/opt/homebrew/bin/fish",
}

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
  {
    key = "|",
    mods = "LEADER|SHIFT",
    action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },

  {
    key = "-",
    mods = "LEADER",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },

  -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
  {
    key = "a",
    mods = "LEADER|CTRL",
    action = wezterm.action.SendKey({ key = "a", mods = "CTRL" }),
  },

  {
    key = "l",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Right"),
  },
  {
    key = "h",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Left"),
  },
  {
    key = "j",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Down"),
  },
  {
    key = "k",
    mods = "LEADER",
    action = act.ActivatePaneDirection("Up"),
  },
  { key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
  { key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },

  {
    key = "x",
    mods = "LEADER",
    action = act.CloseCurrentPane({ confirm = true }),
  },

  {
    key = "c",
    mods = "LEADER",
    action = act.SpawnTab("CurrentPaneDomain"),
  },

  {
    key = "z",
    mods = "LEADER",
    action = act.TogglePaneZoomState,
  },
  {
    key = "h",
    mods = "CTRL|SHIFT",
    action = 'DisableDefaultAssignment'
  },
  {
    key = "l",
    mods = "CTRL|SHIFT",
    action = 'DisableDefaultAssignment'
  },
  {key = 'o', mods = 'LEADER|CTRL', action = act.RotatePanes 'Clockwise' },
  { key = 'k', mods = 'CTRL|SHIFT', action = act.ScrollByPage(-1) },
  { key = 'j', mods = 'CTRL|SHIFT', action = act.ScrollByPage(1) },

}

config.disable_default_key_bindings = false

return config
