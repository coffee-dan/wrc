{ config, pkgs, inputs, ... }:
{
  imports =
    [
      # Include hardware configuration (will need to be generated when setting up the PC)
      ./hardware-configuration.nix

      # Include building blocks for specific stuff
      ../../modules/core.nix
      ../../modules/hyprland.nix
      ../../modules/quickshell.nix
      ../../modules/gaming.nix
      ../../modules/development/godot-workflow.nix
      ../../modules/services/printing.nix
    ];

  networking.hostName = "bluemoon";

  # OpenRGB does not seem to detect the lights on the fans
  # TODO: investigate how/why this is happening
  # services.hardware.openrgb = {
  #   enable = true;
  #   package = pkgs.openrgb-with-all-plugins;
  # };

  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    docker
    gifsicle
    nodejs_22
    mmv
    python313
    yt-dlp

    # GUI - Applications
    dbeaver-bin
    font-manager
    kdePackages.koko
    google-chrome
    # zoom-us
    # openrgb-with-all-plugins
    xfce.ristretto
  ];
}
