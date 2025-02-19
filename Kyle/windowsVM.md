# Windows Virtual Machine (QEMU/KVM w `virt-manager`)

Install necessary packages
```
sudo pacman -S qemu-full virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat libguestfs edk2-ovmf
```

Enable and start libvirtd

```
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
```

Add user to libvirtd group
```
sudo usermod -aG libvirt $(whoami)
```

Download Windows ISO from Microsoft [here](https://www.microsoft.com/en-us/software-download/windows11)

Launch Virtual Machine Manager
```
virt-manager
```
- Click "New Virtual Machine"
- Choose "Local install media"
- Browse and select Windows ISO
- Configure RAM and CPU cores (recommend at least 4GB RAM and 2 cores)
- Create a new virtual disk (recommend at least 64GB)
- Complete the wizard and start the installation

Add TPM Hardware (security feature required for Windows installation)
- Type: Emulated
- Model: TIS
- Version: 2.0

Make CDROM the default boot method

Enable secure boot
