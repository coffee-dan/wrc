{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        # CLI - Utils - Etc
        quickshell

        # GUI - Applications

    ];

    fonts.packages = with pkgs; [
        # placeholder
    ];
}
