# Core system configuration that should be common across all hosts
{ config, lib, pkgs, ... }:
{
  # Bootloader configuration (can be override by specific hosts)
  boot.loader.systemd-boot.enable = lib.mkDefault true;
  boot.loader.efi.canTouchEfiVariables = lib.mkDefault true;
  boot.supportedFilesystems = lib.mkDefault [ "ntfs" ];

  # Nix settings
  #   stateVersion determines the NixOS release from which the default
  #   settings for stateful data, like file locations and datbase versions
  #   on your system were taken.
  system.stateVersion = lib.mkDefault "24.05";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  #   Allow unfree packages by default (can be override)
  nixpkgs.config.allowUnfree = lib.mkDefault true;

  # Use NetworkManager for obtaining an IP address and managing all
  # network interfaces. Also creates a group networkmanager that
  # membership of decides which users can manage network settings.
  # (Can be overridden by specific hosts)
  networking.networkmanager.enable = lib.mkDefault true;

  # Env vars
  environment.sessionVariables.MY_OS = "NixOS";
  environment.sessionVariables.EDITOR = "helix";

  # Locale and time settings (can be overridden by specific hosts)
  time.timeZone = lib.mkDefault "America/Chicago";
  i18n.defaultLocale = lib.mkDefault "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # https://nixos.wiki/wiki/Bluetooth
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
    # TODO: determine if these groups can be defined in /hosts/<host>.nix
    # - this may be needed for groups that only exist based on config (ex: docker, networkmanager)
    # - this may not be needed in add an extragroup with no meaning is fine (ex: foobar)
    extraGroups = [ "docker" "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Default shell configuration
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
    enable = true;
    promptInit = "eval \"$(starship init zsh)\"";
  };

  # Needed for dynamically linked programs that were intended for use on standard linux distros.
  # ex: binaries installed by mise
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
  ];

  programs.firefox.enable = true;

  # Basic packages used by all hosts (should be lightweight)
  environment.systemPackages = with pkgs; [
    # CLI - Utils - Etc
    bat
    bottom
    cmatrix
    ffmpeg
    fzf
    gh
    git
    helix
    jq
    mise
    neofetch
    # TODO: determine if this is needed
    pulseaudioFull
    rar
    ripgrep
    starship
    stow
    trashy
    tree
    udisks
    unzip
    vitetris
    wget
    zip
    zoxide
    zsh

    # GUI - Applications
    _1password-gui
    discord-ptb
    mpv
    pinta
    protonvpn-gui
    sherlock-launcher
    ulauncher
    vicinae
    vscode
    wezterm
  ];

  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.go-mono
  ];
}
