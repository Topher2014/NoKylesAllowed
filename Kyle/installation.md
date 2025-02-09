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
pacman -S nvidia nvidia-utils // nvidia drivers
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
```
