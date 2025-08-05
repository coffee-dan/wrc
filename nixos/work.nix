{ config, pkgs, ... }:
{
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    environment.systemPackages = with pkgs; [
        dotnet-sdk
        slack
    ];

    networking.hosts = {
        "127.0.0.1" = [ "keycloak.local" ];
    };
}
