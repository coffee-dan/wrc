{
  description = "A wrc flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    # https://github.com/0xc000022070/zen-browser-flake
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = { nixpkgs, zen-browser, ... } @ inputs:
  let
    system = "x86_64-linux";

    # Function to create a NixOS configuration for a specific host
    mkHost = { hostname, system ? "x86_64-linux" }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/${hostname}
        ];
      };

    # Function to create a default configuration based on the current hostname
    mkDefaultHost = { defaultSystem ? "x86_64-linux" }:
      let
        hostname = builtins.readFile "/etc/hostname";
        # Strip trailing newlines
        cleanHostname = builtins.replaceStrings ["\n"] [""] hostname;
      in
        mkHost {
          hostname = cleanHostname;
          system = defaultSystem;
        };
  in {
    nixosConfigurations = {
      # General and Personal Desktop
      dgrdt1-nixos = mkHost {
        hostname = "bluemoon";
        system = "x86_64-linux";
      };

      bluemoon = mkHost {
        hostname = "bluemoon";
        system = "x86_64-linux";
      };

      # Work laptop
      capra = mkHost {
        hostname = "capra";
        system = "x86_64-linux";
      };

      default = mkDefaultHost {
        defaultSystem = "x86_64-linux";
      };
    };
  };
}
