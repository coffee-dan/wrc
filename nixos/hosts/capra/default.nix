{ config, pkgs, system, inputs, ... }:
{
  imports =
    [
      # Include hardware configuration (will need to be generated when setting up the PC)
      ./hardware-configuration.nix

      # Include building blocks for specific stuff
      # TODO: split out gaming, printing, development, office tools
      ../../modules/core.nix
      ../../modules/hyprland.nix
      ../../modules/work.nix
    ];

  networking.hostName = "capra";
  networking.networkmanager.enable = true;

  # Enable autodiscovery of network printers:
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
  services.printing = {
    # Enable CUPS to print documents.
    enable = true;
    drivers = with pkgs; [
      cups-filters
      cups-browsed
    ];
  };

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

  programs.zsh.promptInit = "eval \"$(starship init zsh)\"";

  # Needed for dynamically linked programs that were intended for use on standard linux distros.
  # ex: binaries installed by mise
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
  ];

  programs.firefox.enable = true;
  programs.steam.enable = true;

  virtualisation.docker.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # CLI - Utils - Etc
    docker
    ffmpeg
    gh
    gifsicle
    mise
    neofetch
    nodejs_22
    pulseaudioFull
    python313
    sddm-astronaut
    starship
    tmux
    trashy
    udisks
    xclip
    yt-dlp

    # GUI - Applications
    _1password-gui
    alacritty
    dbeaver-bin
    discord-ptb
    font-manager
    google-chrome
    mpv
    pinta
    protonvpn-gui
    steam
    vscode
    wezterm
    inputs.zen-browser.packages.x86_64-linux.default
  ];

  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.go-mono
  ];
}
