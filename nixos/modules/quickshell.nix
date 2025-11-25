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
        hyprutils
        hyprpicker
        hyprlang
        hypridle
        hyprland-qt-support
        hyprland-qtutils
        hyprlock
        hyprcursor
        hyprwayland-scanner
        hyprland
        xdg-desktop-portal-hyprland
        hyprsunset


        # Toolkit
        # kdialog -> qt5compat
        # qt6-5compat -> kdialog
    	# qt6-avif-image-plugin -> ???
    	# qt6-base -> qtbase
    	# qt6-declarative -> qtdeclarative
    	# qt6-imageformats -> qtimageformats
    	# qt6-multimedia -> qtmultimedia
    	# qt6-positioning -> qtpositioning and qt6-location
    	# qt6-quicktimeline -> qtmultimedia
    	# qt6-sensors -> qtsensors
    	# qt6-svg -> qtsvg
    	# qt6-tools -> qttools
    	# qt6-translations -> qttranslations
    	# qt6-virtualkeyboard -> qtvirtualkeyboard
    	# qt6-wayland -> qtwayland
    	# syntax-highlighting -> syntax-highlighting
    	# upower
    	# wtype
    	# ydotool

        # KDE ecosystem pkgs
        kdePackages.kdialog # arch kdialog
        kdePackages.qt5compat # for Qt5compat.GraphicalEffects - arch qt6-5compat

        kdePackages.qtbase
        kdePackages.qtdeclarative # for QML
        kdePackages.qtimageformats
        kdePackages.qtpositioning # for Weather service location features
        kdePackages.qtlocation # additional location services for QtPositioning
        kdePackages.qtmultimedia
        kdePackages.qtquicktimeline
        kdePackages.qtsensors
        kdePackages.qtsvg
        kdePackages.qttools
        kdePackages.qttranslations
        kdePackages.qtvirtualkeyboard
        kdePackages.qtwayland
        kdePackages.syntax-highlighting
        upower
    	wtype
    	ydotool

    ];

    fonts.packages = with pkgs; [
        # placeholder
    ];
}
