local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

config.color_scheme =  'Catppuccin Mocha'
config.enable_tab_bar = true
config.font_size = 13.0
config.line_height = 1.2
config.font = wezterm.font('JetBrainsMono Nerd Font')

nushell_args = {"/opt/homebrew/bin/nu", "--config ~/.config/nushell/config.nu", "--env-config ~/.config/nushell/env.nu"}

config.default_prog = nushell_args
config.launch_menu = {
    {
        label = 'Nushell',
        args = nushell_args,
    },
    {
    label = 'Zsh',
    args = { '/bin/zsh'},
    }
}

-- Tips https://github.com/HeyItsGilbert/dotfiles/tree/main/dot_config/wezterm
-- config.disable_default_key_bindings = true
config.leader = { key = "a", mods = "CMD", timeout_milliseconds = 1000 }
config.keys = {
    { key = "l", mods = "SHIFT|CTRL", action = act.ShowDebugOverlay },
    { key = "t", mods = "SHIFT|CTRL", action = act.ShowLauncher },
    --- Pane management ---
    ---   Movement  ---
    { key = "LeftArrow", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
    { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
    { key = "RightArrow", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
    { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
    { key = "UpArrow", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
    { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
    { key = "DownArrow", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
    { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
    --- Resize ---
    { key = "H", mods = "LEADER", action = act.AdjustPaneSize({ "Left", 3 }) },
    { key = "L", mods = "LEADER", action = act.AdjustPaneSize({ "Right", 3 }) },
    { key = "K", mods = "LEADER", action = act.AdjustPaneSize({ "Up", 3 }) },
    { key = "J", mods = "LEADER", action = act.AdjustPaneSize({ "Down", 3 }) },
    --- Splits ---
    { key = "\\", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
    { key = "q", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
    ---
}

return config
