{ config, pkgs, ... }:

let
  unstable = import (pkgs.fetchFromGitHub {
    # Give me Godot 4.4.1-stable
    # https://github.com/NixOS/nixpkgs/commit/37ff82688737bab1fc6edaa739d498cff71a6200
    owner = "NixOS";
    repo = "nixpkgs";
    rev = "37ff82688737bab1fc6edaa739d498cff71a6200";
    hash = "sha256-FgSqfuHPxmkz3pvlYopBtV827LyDMoGdv2UMWQ9bKMw=";
  }) {};
in {
  system.stateVersion = "24.05";

  imports =
    [
      /etc/nixos/hardware-configuration.nix
      ./plasma.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.supportedFilesystems = [ "ntfs" ];

  networking.hostName = "dgrdt1-nixos";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

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

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Not sure if required...
  hardware.bluetooth.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dan = {
    isNormalUser = true;
    description = "Daniel Ramirez";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Env vars
  environment.sessionVariables.MY_OS = "NixOS";
  environment.sessionVariables.EDITOR = "helix";

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  programs.zsh.promptInit = "eval \"$(starship init zsh)\"";

  programs.firefox.enable = true;
  programs.steam.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    bat
    cliphist
    ffmpeg
    fuzzel
    fzf
    gifsicle
    git
    helix
    home-manager
    mise
    neofetch
    pulseaudioFull
    rar
    rofi-wayland
    starship
    stow
    tmux
    udisks
    wget
    xclip
    yt-dlp
    zoxide
    zsh
    zsh-powerlevel10k

    _1password-gui
    aseprite
    alacritty
    discord-ptb
    google-chrome
    unstable.godot
    lutris
    mpv
    pinta
    protonvpn-gui
    steam
    vscode
    wezterm
    zoom-us
  ];

  fonts.packages = with pkgs; [
    # Don't pull in every nerdfont
    # https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts
    (nerdfonts.override { fonts = [
        "JetBrainsMono"
        "Go-Mono"
    ];})
  ];
}
