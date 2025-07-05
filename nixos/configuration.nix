{ config, pkgs, ... }:
{
  system.stateVersion = "24.05";

  imports =
    [
      /etc/nixos/hardware-configuration.nix
      ./hyprland.nix
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
  services.pulseaudio.enable = false;
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
    extraGroups = [ "docker" "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
  ];

  # Env vars
  environment.sessionVariables.MY_OS = "NixOS";
  environment.sessionVariables.EDITOR = "helix";

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  programs.zsh.promptInit = "eval \"$(starship init zsh)\"";

  programs.firefox.enable = true;
  programs.steam.enable = true;

  virtualisation.docker.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # CLI - Utils - Etc
    bat
    docker
    ffmpeg
    fzf
    gifsicle
    git
    helix
    mise
    neofetch
    nodejs_22
    pulseaudioFull
    python313
    rar
    starship
    stow
    tmux
    trashy
    udisks
    wget
    xclip
    yt-dlp
    zoxide
    zsh
    zsh-powerlevel10k

    # Fonts
    nerd-fonts.jetbrains-mono
    nerd-fonts.go-mono

    # GUI - Applications
    _1password-gui
    aseprite
    alacritty
    discord-ptb
    flyctl
    godot
    google-chrome
    lutris
    mpv
    pinta
    protonvpn-gui
    steam
    vscode
    wezterm
    zoom-us
  ];

  fonts.enableDefaultPackages = true;
}
