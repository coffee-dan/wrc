local wz = require 'wezterm'
local config = wz.config_builder()

config.default_prog = { 'zsh' }

config.font = wz.font 'JetBrains Mono'

config.hide_tab_bar_if_only_one_tab = true

config.window_background_opacity = 0.65

local mod = string.find(wz.target_triple, "apple") and "SUPER" or "ALT"

config.keys = {
    -- New tabs with <mod>+T
    {key="t", mods=mod, action=wz.action{SpawnTab="CurrentPaneDomain"}},
    -- Move between tabs with <mod>+[1-9] <mod>+Left <mod>+Right
    {key="1", mods=mod, action=wz.action{ActivateTab=0}},
    {key="2", mods=mod, action=wz.action{ActivateTab=1}},
    {key="3", mods=mod, action=wz.action{ActivateTab=2}},
    {key="4", mods=mod, action=wz.action{ActivateTab=3}},
    {key="5", mods=mod, action=wz.action{ActivateTab=4}},
    {key="6", mods=mod, action=wz.action{ActivateTab=5}},
    {key="7", mods=mod, action=wz.action{ActivateTab=6}},
    {key="8", mods=mod, action=wz.action{ActivateTab=7}},
    {key="9", mods=mod, action=wz.action{ActivateTab=8}},
    {key="LeftArrow", mods=mod, action=wz.action{ActivateTabRelative=-1}},
    {key="RightArrow", mods=mod, action=wz.action{ActivateTabRelative=1}},

    -- New splits with <mod>+H horizontal <mod>+J (vertical)
    {key="h", mods=mod, action=wz.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    {key="j", mods=mod, action=wz.action{SplitVertical={domain="CurrentPaneDomain"}}},

    -- Move between splits using <mod>+WASD
    {key="w", mods=mod, action=wz.action{ActivatePaneDirection="Up"}},
    {key="a", mods=mod, action=wz.action{ActivatePaneDirection="Left"}},
    {key="s", mods=mod, action=wz.action{ActivatePaneDirection="Down"}},
    {key="d", mods=mod, action=wz.action{ActivatePaneDirection="Right"}},

    -- Resize the current split using <mod>+Shift+WASD
    {key="w", mods= mod .. "|SHIFT", action=wz.action{AdjustPaneSize={"Up", 1}}},
    {key="a", mods= mod .. "|SHIFT", action=wz.action{AdjustPaneSize={"Left", 1}}},
    {key="s", mods= mod .. "|SHIFT", action=wz.action{AdjustPaneSize={"Down", 1}}},
    {key="d", mods= mod .. "|SHIFT", action=wz.action{AdjustPaneSize={"Right", 1}}},

    -- Close current split or tab if it's the only split
    {key="k", mods=mod, action=wz.action{CloseCurrentPane={confirm=true}}},
}

return config
