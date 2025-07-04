{ config, pkgs, ... }:
{
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
    ]
}
