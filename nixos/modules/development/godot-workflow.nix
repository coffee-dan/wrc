{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    aseprite
    flyctl
    godot
  ];
}
