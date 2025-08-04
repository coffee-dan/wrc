{ config, pkgs, ... }:
{
    environment.sessionVariables.MY_SDDM = "wayland-sessions";
    environment.sessionVariables.MY_HYPRLAND_MONITORS = "desktop-ips235";

    services.xserver.enable = true;

    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
    };

    programs.hyprland.enable = true;

    environment.systemPackages = with pkgs; [
        # CLI - Utils - Etc
        brightnessctl       # laptop brightness control
        cliphist
        hyprpaper
        hyprpolkitagent
        playerctl           # media player control
        ( sddm-astronaut.override
            { embeddedTheme = "cyberpunk"; }
        )
        udiskie
        wl-clipboard

        # GUI - Applications
        blueman
        ( flameshot.override
            { enableWlrSupport = true; }
        )
        networkmanagerapplet
        swaynotificationcenter
        waybar
        wofi

        # KDE Ecosystem
        kdePackages.dolphin           # file manager
        kdePackages.gwenview          # image viewer
        kdePackages.okular            # document viewer (pdf)
        kdePackages.plasma-workspace  # "Various components needed to run a Plasma-based environment"
        kdePackages.qtsvg             # support for svg icons
    ];

    fonts.packages = with pkgs; [
        fira
        font-awesome
    ];
}
