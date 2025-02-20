# Installation

## Network Manager
```
# find INTERFACE with `ip link`
`ip link set INTERFACE up`

sudo systemctl enable systemd-networkd
sudo systemctl start systemd-networkd

sudo systemctl enable systemd-resolved
sudo systemctl start systemd-resolved

pacman -S networkmanager

sudo systemctl disable systemd-networkd
sudo systemctl stop systemd-networkd

sudo systemctl enable systemd-resolved
sudo systemctl start systemd-resolved
```

## New User
```
useradd -m -G wheel username
passwd username
EDITOR=nano visudo // uncomment `%wheel ALL=(ALL:ALL) ALL`
exit
```

## Window Manager
```
pacman -S i3 // window manager
pacman -S xorg-server xorg-xinit xorg-apps // graphics interface
pacman -S nvidia nvidia-utils nvidia-settings // nvidia drivers
pacman -S alacritty // terminal emulator
```

For monitor placement, install
```
pacman -s arandr // monitor placement GUI tool (make `displays` s-link)
```
then save the config file as `~/.screenlayout/display.sh`.
Copy i3 config file from git into `~/.config/i3/config`

## Audio
```
sudo pacman -S pulseaudio
systemctl --user start pulseaudio
systemctl --user enable pulseaudio
sudo pacman -S pavucontrol
ln -s /usr/bin/pavucontrol /usr/local/bin/audio
```

## yay (Arch User Repository helper)
```
pacman -S --needed git base-devel
cd /opt
sudo git clone https://aur.archlinux.org/yay.git
sudo chown -R $USER:$USER ./yay
cd yay
makepkg -si
```

## ssh
```
sudo pacman -S openssh git
ssh-keygen -t ed25519 -C "your_email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub // public key for git
git config --global user.name "Your Name"
git config --global user.email "your_email@example.com"
```

## VS Code
```
sudo pacman -S code
```
Copy `vscode.settings.json` to `~/Code/User/settings.json` (or similar)
```
sudo pacman -S cmake
```
Extensions
  - CMake
  - CMake IntelliSence
  - vscode-icons
  - vscode-pdf
  - rainbow csv
  - C/C++ Extension Pack (MS)
      - Download VSIX from [github](https://github.com/microsoft/vscode-cpptools)
      - Install from VSIX in VS Code

## Steam
First, enable multilib repo for 32-bit libraries. Uncomment the following lines from `/etc/pacman.conf`:
```
[multilib]
Include = /etc/pacman.d/mirrorlist
```
Then
```
sudo pacman -Syu
sudo pacman -S steam
sudo pacman -S lib32-nvidia-utils
```

## Other
```
yay -S brave-bin
sudo pacman -S tmux
sudo pacman -S xclip
```

## i3 Screen Tearing (NVIDIA, multi-montior with different resolutions)
i3 does not handle display composition by iteself. "Composition" refers to how frames from different windows are combined and drawn to your screen. Without proper composition, you can get screen tearing.

1. Install a compositor
```
sudo pacman -S picom
```

2. Set the compositor config at `~/.config/picom.conf`:
```
backend = "glx";  // use OpenGL for rendering
vsync = true;
glx-no-stencil = true;
glx-copy-from-front = false;

# For NVIDIA cards specifically
xrender-sync-fence = true;
```

3. Specify i3 to use the compositor (``/.config/i3/config`):
```
exec --no-startup-id picom -b
```

4. (optional) NVIDIA-specifc optimization in `/etc/X11/xorg.conf.d/20-nvidia.conf`
```
Section "Device"
    Identifier     "Device0"
    Driver         "nvidia"
    Option         "ForceFullCompositionPipeline" "on"
    Option         "AllowIndirectGLXProtocol" "off"
EndSection
```

