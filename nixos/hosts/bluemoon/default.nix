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

  services.udisks2.enable = true;

  environment.systemPackages = with pkgs; [
    # caligula -- used for disk imaging - not needed right now
    docker
    gifsicle
    gnome-disk-utility
    # disabled because it is x11
    # gparted
    nodejs_22
    mmv
    parted
    python313
    yt-dlp

    # GUI - Applications
    dbeaver-bin
    kdePackages.dragon
    kdePackages.filelight
    #  consider using firewalld to manage firewall interactively -- would replace existing firewall
    # firewalld
    # firewalld-gui
    font-manager
    google-chrome
    kdePackages.koko
    krita
    # zoom-us
    # openrgb-with-all-plugins
  ];
}
