# From main repo

sudo dnf install \
    azure-cli \
    bat \
    docker-compose \
    ffmpeg \
    fzf \
    gh \
    helix \
    podman-compose \
    ripgrep \
    stow \
    zoxide \
    zsh

# from Copr

sudo dnf copr enable jdxcode/mise &&
sudo dnf install mise

sudo dnf copr enable atim/starship &&
sudo dnf install starship

sudo dnf copr enable quadratech188/vicinae &&
sudo dnf install vicinae

# Wezterm also available on flathub
sudo dnf copr enable wezfurlong/wezterm-nightly &&
sudo dnf install wezterm

# Snap Store
sudo dnf install snapd
echo "enabling snaps - this requires restart..."
sudo snap install slack

## DBeaver Classic
sudo snap install dbeaver-ce --classic
sudo snap install postman

## alternatively in snap store
## sudo snap install code --classic
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc &&
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update &&
sudo dnf install code

# configuration

systemctl --user start podman.socket
systemctl --user enable podman.socket
