{ config, pkgs, ... }:
{
    environment.sessionVariables.MY_SDDM = "wayland-sessions";
    environment.sessionVariables.MY_HYPRLAND_MONITORS = "desktop-ips235";

    programs.hyprland.enable = true;

    services.xserver.enable = true;
    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
    };

    environment.systemPackages = with pkgs; [
        # CLI - Utils - Etc
        brightnessctl       # laptop brightness control
        cliphist
        hyprpaper
        hyprpolkitagent
        playerctl           # media player control
        # TODO add system.userActivationScripts to move installed theme into correct directory
        # - [ ] rose pine (breezeX ish) cursor
        # - [ ] login theme sddm-astronaut
        rose-pine-hyprcursor
        ( sddm-astronaut.override
            { embeddedTheme = "cyberpunk"; }
        )
        udiskie
        wl-clipboard

        # GUI - Applications
        blueman
        ( flameshot.override
            { enableWlrSupport = true; }
        )
        networkmanagerapplet
        swaynotificationcenter
        waybar
        wofi

        # KDE Ecosystem
        kdePackages.dolphin           # file manager
        kdePackages.gwenview          # image viewer
        kdePackages.kate              # text editor
        kdePackages.okular            # document viewer (pdf)
        kdePackages.plasma-workspace  # "Various components needed to run a Plasma-based environment"
        kdePackages.qtsvg             # support for svg icons

        # suggested for dolphin open with menu
        kdePackages.kdf
        # kdePackages.kio                    # Network transparent access to files and data
        # kdePackages.kio-fuse               # interact with network shares
        # kdePackages.kio-extras             # Additional components to increase the functionality of KIO
        # kdePackages.kio-admin              # Manage files as administrator using the admin:// KIO protocol.
        kdePackages.qtwayland
        kdePackages.plasma-integration       # Qt Platform Theme integration plugins for Plasma Workspaces
        kdePackages.kdegraphics-thumbnailers # Thumbnailers for various graphics file formats
        kdePackages.breeze-icons
        kdePackages.kservice                 # KService allows to query information about installed applications and their associated file types.
        shared-mime-info                     # Database of common MIME types
    ];

    environment.etc."/xdg/menus/applications.menu".text = builtins.readFile
        "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

    fonts.packages = with pkgs; [
        fira
        font-awesome
    ];
}
