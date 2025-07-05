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
        hyprpolkitagent
        swaynotificationcenter
        waybar
        hyprpaper
        cliphist
        wl-clipboard
        networkmanagerapplet
        blueman
        udiskie
    ];
}
