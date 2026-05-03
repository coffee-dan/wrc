# Gaming config - to be expanded later.
#   TODO: Consider grabbing from notquitethereyet gaming.nix
#   https://github.com/notquitethereyet/nixchan/blob/main/Documents/nixos/modules/services/gaming.nix
{ config, pkgs, ... }:
{
  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    # heroic # epic games launcher alternative, attempted to use this for fall guys but did not work
    # lutris # not sure which game this was installed to assist with or if it is needed for anything
    protontricks
    steam
    wine
    # yad or zenity needed for protontricks gui
    yad
    zenity
  ];
}
