local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.default_prog = { 'zsh' }

config.font = wezterm.font 'JetBrains Mono'

config.hide_tab_bar_if_only_one_tab = true

config.window_background_opacity = 0.65


config.keys = {
    -- New tabs with Alt+T
    {key="t", mods="ALT", action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
    -- Move between tabs with Alt+[1-9] Alt+Left Alt+Right
    {key="1", mods="ALT", action=wezterm.action{ActivateTab=0}},
    {key="2", mods="ALT", action=wezterm.action{ActivateTab=1}},
    {key="3", mods="ALT", action=wezterm.action{ActivateTab=2}},
    {key="4", mods="ALT", action=wezterm.action{ActivateTab=3}},
    {key="5", mods="ALT", action=wezterm.action{ActivateTab=4}},
    {key="6", mods="ALT", action=wezterm.action{ActivateTab=5}},
    {key="7", mods="ALT", action=wezterm.action{ActivateTab=6}},
    {key="8", mods="ALT", action=wezterm.action{ActivateTab=7}},
    {key="9", mods="ALT", action=wezterm.action{ActivateTab=8}},
    {key="LeftArrow", mods="ALT", action=wezterm.action{ActivateTabRelative=-1}},
    {key="RightArrow", mods="ALT", action=wezterm.action{ActivateTabRelative=1}},

    -- New splits with Alt+H horizontal Alt+J (vertical)
    {key="h", mods="ALT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    {key="j", mods="ALT", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},

    -- Move between splits using Alt+WASD
    {key="w", mods="ALT", action=wezterm.action{ActivatePaneDirection="Up"}},
    {key="a", mods="ALT", action=wezterm.action{ActivatePaneDirection="Left"}},
    {key="s", mods="ALT", action=wezterm.action{ActivatePaneDirection="Down"}},
    {key="d", mods="ALT", action=wezterm.action{ActivatePaneDirection="Right"}},

    -- Resize the current split using Alt+Shift+WASD
    {key="w", mods="ALT|SHIFT", action=wezterm.action{AdjustPaneSize={"Up", 1}}},
    {key="a", mods="ALT|SHIFT", action=wezterm.action{AdjustPaneSize={"Left", 1}}},
    {key="s", mods="ALT|SHIFT", action=wezterm.action{AdjustPaneSize={"Down", 1}}},
    {key="d", mods="ALT|SHIFT", action=wezterm.action{AdjustPaneSize={"Right", 1}}},

    -- Close current split or tab if it's the only split
    {key="k", mods="ALT", action=wezterm.action{CloseCurrentPane={confirm=true}}},
}

return config
