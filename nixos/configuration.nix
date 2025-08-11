{ config, pkgs, ... }:
{
  system.stateVersion = "24.05";

  imports =
    [
      /etc/nixos/hardware-configuration.nix
      ./hyprland.nix
      ./work.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.supportedFilesystems = [ "ntfs" ];

  # Env vars
  environment.sessionVariables.MY_OS = "NixOS";
  environment.sessionVariables.EDITOR = "helix";

  networking.hostName = "dgrdt1-nixos";
  networking.networkmanager.enable = true;

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
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
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
  users.defaultUserShell = pkgs.zsh;

  xdg.mime.enable = true;
  xdg.menus.enable = true;

  programs.zsh.enable = true;
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
    bat
    bottom
    docker
    ffmpeg
    fzf
    gh
    gifsicle
    git
    helix
    mise
    neofetch
    nodejs_22
    pulseaudioFull
    python313
    rar
    ripgrep
    sddm-astronaut
    starship
    stow
    tmux
    trashy
    udisks
    unzip
    wget
    xclip
    yt-dlp
    zip
    zoxide
    zsh
    zsh-powerlevel10k

    # GUI - Applications
    _1password-gui
    aseprite
    alacritty
    dbeaver-bin
    discord-ptb
    flyctl
    font-manager
    godot
    google-chrome
    heroic
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
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.go-mono
  ];
}
