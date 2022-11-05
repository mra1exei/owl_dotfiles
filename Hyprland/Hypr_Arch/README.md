**ARCH LINUX INSTALL**  
  
```
cfdisk dos /dev/sda4  
mkfs.ext4 /dev/sda4  
mount /dev/sda1/mnt  
  
pacstrap /mnt base linux linux-firmware  
genfstab -U /mnt >> /mnt/etc/fstab  
arch-chroot /mnt  
  
pacman -S grub nano sudo dhcpcd os-prober ntfs-3g  

/etc/locale.gen en_US.UTF-8 UTF-8  
locale-gen  
localectl set-locale ru_RU.UTF-8  

grub-install /dev/sda  
grub-mkconfig -o /boot/grub/grub.cfg  
  
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime  
hwclock --systohc  

passwd  
useradd -m -g users -G wheel -s /bin/bash username  
passwd username  
EDITOR=micro visudo user ALL=(ALL) ALL  
  
systemctl enable dhcpcd  
```  
  
**HYPRLAND INSTALL**  
```
sudo pacman -S base-devel git cmake gdb meson ninja gcc mesa wayland-protocols  
wayland wlroots xcb-proto xcb-util xcb-util-keysyms xcb-util-wm cairo pango  
seatd libxkbcommon libxcb libxfixes libx11 libxcomposite pixman xorg-xinput  
polkit xorg-xwayland libxrender  
  
git clone --recursive https://github.com/hyprwm/Hyprland  
cd Hyprland  
git submodule init  
git submodule update  
sudo make install  

sudo systemctl enable seatd
sudo chmod 777 /run/seatd.sock  
``` 
  
**ALSA INSTALL**  
```
sudo pacman -S alsa-lib alsa-plugins alsa-tools alsa-utils  
sudo gpasswd -a username audio  
``` 
  
**AUTOLOGIN & AUTOSTRTX** 
```
sudo micro  /etc/sv/agetty-tty1/conf  
GETTY_ARGS="-a username --noclear"  
  
micro ./config/fish/config.fish  

if status is-login
    if test -z "$DISPLAY" -a "$(tty)" = /dev/tty1
        exec startx -- -keeptty
    end
end
``` 
  
**SOFT INSTALL**  
```
sudo pacman -S firefox telegram-desktop viewnior mpv thunar tumbler mupdf leafpad gimp inkscape blender transmission-gtk  
```  
  
**TERMINAL SOFT INSTALL**  
```
sudo pacman -S htop links cmus neofetch ranger grim unzip  
```  
  
**FISH-SHELL**  
```
fish  
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher  
fisher install jorgebucaran/nvm.fish  
fisher install IlanCosman/tide@v5  
chsh -s /usr/bin/fish  
set -U fish_greeting  
``` 
  
**ST TERMINAL**  
```
git clone https://git.suckless.org/st  
cd st  
edit config.def.h  
sudo make clean install  
```  
  
**LUTRIS**  
```
sudo pacman -S lutris MangoHud MangoHud-32bit wine winetricks wine-32bit mesa-dri-32bit libGL-32bit amdvlk
amdvlk-32bit vkd3d vkd3d-devel vkd3d-32bit vulkan-loader vulkan-loader-32bit libX11-devel libX11-devel-32bit libgpg-error libgpg-error-32bit gdk-pixbuf gdk-pixbuf-32bit libgcc libgcc-32bit libglvnd libglvnd-32bit  
``` 
  