# write using flakes to target specific versions of aseprite and godot
{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    aseprite
    flyctl
    godot
  ];
}
