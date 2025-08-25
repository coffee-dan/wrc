{ config, pkgs, system, inputs, ... }:
{
  imports =
    [
      # Include hardware configuration (will need to be generated when setting up the PC)
      ./hardware-configuration.nix

      # Include building blocks for specific stuff
      # TODO: split out development
      ../../modules/core.nix
      ../../modules/hyprland.nix
      ../../modules/gaming.nix
      ../../modules/development/godot-workflow.nix
      ../../modules/services/printing.nix
    ];

  networking.hostName = "bluemoon";

  # Not sure if required...
  hardware.bluetooth.enable = true;

  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.dan = {
    isNormalUser = true;
    description = "Daniel Ramirez";
    extraGroups = [ "docker" "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  xdg.mime.enable = true;
  xdg.menus.enable = true;

  # Needed for dynamically linked programs that were intended for use on standard linux distros.
  # ex: binaries installed by mise
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
  ];

  programs.firefox.enable = true;

  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    # CLI - Utils - Etc
    docker
    fzf
    gh
    gifsicle
    mise
    neofetch
    nodejs_22
    pulseaudioFull
    python313
    tmux
    udisks
    xclip
    yt-dlp

    # GUI - Applications
    _1password-gui
    dbeaver-bin
    discord-ptb
    font-manager
    google-chrome
    mpv
    pinta
    protonvpn-gui
    vscode
    wezterm
    # zoom-us
    inputs.zen-browser.packages.x86_64-linux.default
  ];
}
