# Modular NixOS Configuration

[This repository](https://github.com/notquitethereyet/nixchan) contains a modular NixOS configuration that can be used across multiple machines. I took it and have made changes as needed. This readme is pulled over as is so I have an unmodified copy in my git history.

## Structure

- `flake.nix` - The entry point for the NixOS configuration
- `hosts/` - Host-specific configurations
  - `common/` - Common configuration for all hosts
  - `bluemoon/` - Configuration for the bluemoon desktop
  - `capra/` - Configuration for the capra laptop (work)
- `modules/` - Reusable NixOS modules
  - `core/` - Core system settings
  - `desktop/` - Desktop environment configurations
  - `development/` - Development tools and environments
  - `services/` - System services
- `profiles/` - Role-based configurations
  - `minimal.nix` - Minimal system profile
  - `desktop.nix` - Desktop system profile
  - `development.nix` - Development system profile

## Adding a New Host

To add a new host:

1. Create a new directory under `hosts/` with the hostname
2. Create a `default.nix` file in the new directory
3. Generate a hardware configuration with `nixos-generate-config` and copy it to `hosts/hostname/hardware-configuration.nix`
4. Add the new host to `flake.nix`

### Hardware Configuration

Each host has its own hardware configuration file in its directory:

- `hosts/bluemoon/hardware-configuration.nix` for the bluemoon desktop
- `hosts/capra/hardware-configuration.nix` for the capra desktop (missing until you set up the machine)

> **Note:** The `hardware-configuration.nix` file in the root directory is redundant in this modular setup. Each host should have its own hardware configuration in its respective directory.

When setting up a new machine, generate the hardware configuration with:

```bash
sudo nixos-generate-config --root /mnt
```

Then copy it to the appropriate host directory:

```bash
cp /mnt/etc/nixos/hardware-configuration.nix /path/to/your/nixos/hosts/hostname/
```

After setting up all your hosts, you can safely remove the root `hardware-configuration.nix` file if desired.

Example:

```nix
# In flake.nix
nixosConfigurations = {
  # Existing hosts
  bluemoon = mkHost {
    hostname = "bluemoon";
    system = "x86_64-linux";
  };

  # New host
  newhost = mkHost {
    hostname = "newhost";
    system = "x86_64-linux";
  };
};
```

## Customizing a Host

Each host can import different profiles and modules based on its role and hardware. Edit the `default.nix` file in the host's directory to customize the configuration.

## Installation and Setup

This configuration is designed to be stored in your home directory and symlinked to `/etc/nixos`. This allows you to manage your NixOS configuration with version control while still having it accessible to NixOS in the expected location.

### Initial Setup

1. Clone this repository to your home directory (e.g., `/home/quiet/Documents/nixos`)
2. Create a symlink to `/etc/nixos`:

```bash
sudo rm -rf /etc/nixos  # Remove the existing nixos directory (backup first if needed)
sudo ln -s /home/quiet/Documents/nixos /etc/nixos
```

3. Make sure the hostname is set correctly:

```bash
hostname > /etc/hostname  # Replace 'hostname' with 'bluemoon' or 'capra'
```

### Building and Activating

To build and activate the configuration:

```bash
sudo nixos-rebuild switch
```

The configuration will automatically detect your hostname and use the corresponding host configuration.

If you want to explicitly specify a host:

```bash
sudo nixos-rebuild switch --flake .#hostname
```

For example, to build and activate the bluemoon configuration:

```bash
sudo nixos-rebuild switch --flake .#bluemoon
```

## Updating

To update the system:

```bash
nix flake update
sudo nixos-rebuild switch
```

## Hyprland Configuration

This setup installs Hyprland and related packages but does not manage the Hyprland configuration. You should manage your Hyprland configuration manually in your home directory (typically `~/.config/hypr/`).

For NVIDIA GPUs (capra), you might want to add these environment variables to your Hyprland configuration:

```
env = LIBVA_DRIVER_NAME,nvidia
env = XDG_SESSION_TYPE,wayland
env = GBM_BACKEND,nvidia-drm
env = __GLX_VENDOR_LIBRARY_NAME,nvidia
env = WLR_NO_HARDWARE_CURSORS,1
```

For Intel GPUs (bluemoon), you might want to add these environment variables:

```
env = LIBVA_DRIVER_NAME,iHD
env = VDPAU_DRIVER,va_gl
env = XDG_SESSION_TYPE,wayland
```
