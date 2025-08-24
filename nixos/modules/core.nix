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
  system.stateVersion = "24.05";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  #   Allow unfree packages by default (can be override)
  nixpkgs.config.allowUnfree = lib.mkDefault true;


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

  # Default shell configuration
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  # Basic packages, limit to small CLI tools
  environment.systemPackages = with pkgs; [
    bat
    bottom
    fzf
    git
    helix
    rar
    ripgrep
    stow
    trashy
    tree
    unzip
    wget
    zip
    zoxide
    zsh
  ];
}
