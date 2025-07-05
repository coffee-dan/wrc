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
        cliphist
        hyprpaper
        hyprpolkitagent
        udiskie
        wl-clipboard

        # Fonts
        fira
        font-awesome

        # GUI - Applications
        blueman
        networkmanagerapplet
        swaynotificationcenter
        waybar
        wofi
    ];
}
