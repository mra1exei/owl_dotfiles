**ARCH LINUX INSTALL**  
  
```
cfdisk dos /dev/sda4  
mkfs.ext4 /dev/sda4  
mount /dev/sda1/mnt  
  
pacstrap /mnt base linux linux-firmware  
genfstab -U /mnt >> /mnt/etc/fstab  
arch-chroot /mnt  
  
pacman -S grub nano sudo dhcpcd os-prober  

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
  
**KEYBOARD**  
```
sudo micro /etc/X11/xorg.conf.d/00-keyboard.conf  
  
Section "InputClass"  
    Identifier "system-keyboard"  
    MatchIsKeyboard "on"  
    Option "XkbLayout" "us,ru"  
    Option "XkbModel" "pc105"  
    Option "XkbOptions" "grp:alt_shift_toggle"  
EndSection  
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
  
**XORG INSTALL**  
```
sudo pacman -S xorg xorg-xinit mesa numlockx nitrogen git make patch gcc base-devel unzip fish  
```  
  
**ALSA INSTALL**  
```
sudo pacman -S alsa-lib alsa-plugins alsa-tools alsa-utils   
```  
  
**XMONAD INSTALL**  
```
sudo pacman -S xmonad xmonad-contrib xmonad-utils xmobar  
download config http://code.haskell.org/xmonad/man/xmonad.hs >>~/.xmonad
```  
  
**SOFT INSTALL**  
```
sudo pacman -S firefox telegram-desktop viewnior mpv thunar tumbler mupdf leafpad gimp inkscape blender simplescreenrecorder transmission-gtk  
```  
  
**TERMINAL SOFT INSTALL**  
```
sudo pacman -S htop links cmus neofetch scrot ranger  
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
  
**DMENU**  
```
git clone https://git.suckless.org/dmenu  
cd dmenu  
patch < dmenu-xyw-5.0.diff  
sudo make clean install  
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
  
 orc-0.4.32-2  polkit-121-1  rtkit-0.13-2  tdb-1.4.7-1  webrtc-audio-processing-0.3.1-3  pulseaudio-16.1-1 libcanberra-1:0.30+r2+gc0620e4-1  sound-theme-freedesktop-0.8-5  pavucontrol-1:5.0+r61+gee77d86-2
