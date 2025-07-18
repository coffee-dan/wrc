{ config, pkgs, ... }:
{
    services.xserver.enable = true;
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;
    services.desktopManager.plasma6.enable = true;

    environment.plasma6.excludePackages = with pkgs.kdePackages; [
        konsole
    ];

    environment.systemPackages = with pkgs; [
        fuzzel
        rofi-wayland
    ];
}
