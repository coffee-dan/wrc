{ config, pkgs, ... }:
{
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
}
