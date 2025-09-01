# Consider reference Framework Laptop 16 guide if issues arise:
# https://wiki.nixos.org/wiki/Hardware/Framework/Laptop_16
{ config, pkgs, inputs, ... }:
{
  imports =
    [
      # Include hardware configuration (will need to be generated when setting up the PC)
      ./hardware-configuration.nix

      # Include building blocks for specific stuff
      ../../modules/core.nix
      ../../modules/hyprland.nix
    ];

  networking.hostName = "capra";
  networking.hosts = {
    "127.0.0.1" = [ "keycloak.local" ];
  };

  # Might be needed for Slack to work properly with Wayland
  # TODO: test if still needed
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.PLAYWRIGHT_BROWSERS_PATH = "${pkgs.playwright-driver.browsers}";
  environment.sessionVariables.PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS = "true";

  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    # CLI - Utils - Etc
    docker
    dotnet-sdk
    nodejs_22
    playwright-driver.browsers
    python313
    slack

    # GUI - Applications
    dbeaver-bin
    font-manager
    google-chrome
    libreoffice-fresh
    inputs.zen-browser.packages.x86_64-linux.default
  ];
}
