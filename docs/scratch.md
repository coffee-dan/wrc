
## Separations of concerns

### Window Manager

The window manager was once just a program that listened for other programs to
write to the screen in a coordinate way. However the concept of compositing
gained traction of the years so that the content of the windows could be
modified before hitting the screen such that fancy animations could be used for
minimizing, maximizing, resizing, etc and fancy effects could be used on all
windows such as transparency, shadows and rounded corners. Now all but the most
minimal window managers have compositing built in. In the past compositing was
accomplished by installing a separate program to handle such concerns for
example, picom.

Wayland is a compelling choice because it is an ecosystem with compositing in
mind so it can accompish even fancier animations and effects with greater ease
on the part of window manager maintainers.

`[protocol]/[server]/[type]`

X11/
    MATE/floating       # Succesor of Gnome 2 WM "Metacity"
                        # - used in lightweight versions of major distros
                        # - no built in compositing
    Mutter/floating     # Built into Gnome
    Kwin/floating       # Built into KDE Plasma 5
    i3/tiling
    Awesome/hybrid

Wayland/
    Kwin/floating       # Built into KDE Plasma 6
    Hyprland/tiling
    Sway/tiling
