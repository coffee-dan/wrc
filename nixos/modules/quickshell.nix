{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        # CLI - Utils - Etc
        fuzzel
        glib # for settings
        gsettings-desktop-schemas # GNOME schemas for non-GNOME environments
        translate-shell
        quickshell
        wayland
        wayland-protocols
        wlogout

        # Python system pkgs
        clang
        gtk4
        libadwaita
        libsoup_3 # needed for manga browser?
        libportal-gtk4
        gobject-introspection
        sassc
        opencv4 # computer vision python-opencv
        # -- additional system libs for python pkgs
        stdenv.cc.cc.lib # provides libstdc++.so.6
        glibc
        zlib
        libffi
        openssl
        bzip2
        xz
        ncurses
        readline
        sqlite

        # Hyprland pkgs
        hypridle
        hyprcursor
        hyprland
        hyprland-qtutils
        hyprlang
        hyprlock
        hyprpicker
        hyprsunset
        hyprutils
        hyprwayland-scanner
        xdg-desktop-portal-hyprland

        # KDE ecosystem pkgs
        kdePackages.qt5compat # for Qt5compat.GraphicalEffects
        kdePackages.qtdeclarative # for QML
        kdePackages.kdialog
        kdePackages.qtwayland
        kdePackages.qtpositioning # for Weather service location features
        kdePackages.qtlocation # additional location services for QtPositioning


        # GUI - Applications

    ];

    fonts.packages = with pkgs; [
        # placeholder
    ];
}
