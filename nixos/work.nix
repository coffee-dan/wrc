{ config, pkgs, ... }:
{
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    environment.systemPackages = with pkgs; [
        slack
    ];
}
