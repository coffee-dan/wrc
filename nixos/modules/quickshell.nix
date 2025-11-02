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

        # Audio
        libcava # or astal.cava
        lxqt.pavucontrol-qt # or just pavucontrol...
        wireplumber
        libdbusmenu-gtk3
        gtklock-playerctl-module

        # Backlight
        geoclue2
        brightnessctl
        ddcutil

        # Basic
        axel
        bc
        coreutils-full
        cliphist
        cmake
        curl
        rsync
        wget
        ripgrep
        jq
        meson
        # https://mynixos.com/options/xdg.userDirs


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
        hyprland-qt-support
        hyprlang
        hyprlock
        hyprpicker
        hyprsunset
        hyprutils
        hyprwayland-scanner
        xdg-desktop-portal-hyprland


        # Toolkit
        kdialog
    	qt6-5compat
    	qt6-avif-image-plugin
    	qt6-base
    	qt6-declarative
    	qt6-imageformats
    	qt6-multimedia
    	qt6-positioning
    	qt6-quicktimeline
    	qt6-sensors
    	qt6-svg
    	qt6-tools
    	qt6-translations
    	qt6-virtualkeyboard
    	qt6-wayland
    	syntax-highlighting
    	upower
    	wtype
    	ydotool

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
