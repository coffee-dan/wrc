# Gaming config - to be expanded later.
#   TODO: Consider grabbing from notquitethereyet gaming.nix
#   https://github.com/notquitethereyet/nixchan/blob/main/Documents/nixos/modules/services/gaming.nix
{ config, pkgs, ... }:
{
  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    heroic
    lutris
    steam
  ];
}
