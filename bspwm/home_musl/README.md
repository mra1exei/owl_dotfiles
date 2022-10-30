**VOID INSTALL**  
```
cfdisk /dev/sda  
mkfs.btrfs -f /dev/sda4  
mount /dev/sda4 /mnt  
  
REPO=https://repo-default.voidlinux.org/current  
ARCH=x86_64  
mkdir -p /mnt/var/db/xbps/keys  
cp /var/db/xbps/keys/* /mnt/var/db/xbps/keys/  
  
XBPS_ARCH=$ARCH xbps-install -S -r /mnt -R "$REPO" base-system  

mount --rbind /sys /mnt/sys && mount --make-rslave /mnt/sys  
mount --rbind /dev /mnt/dev && mount --make-rslave /mnt/dev  
mount --rbind /proc /mnt/proc && mount --make-rslave /mnt/proc  
  
cp /etc/resolv.conf /mnt/etc/  
  
PS1='(chroot) # ' chroot /mnt/ /bin/bash  
  
xbps-install micro  
micro /etc/default/libc-locales  
xbps-reconfigure -f glibc-locales  
  
ln -sf /usr/share/zoneinfo/Asia/Novosibirsk /etc/localtime  
  
passwd  
useradd -m -g users -G wheel -s /bin/bash username  
usermod -aG audio username  
passwd user  
EDITOR=micro visudo user ALL=(ALL) ALL  
  
cp /proc/mounts /etc/fstab  
  
xbps-install grub  
grub-install /dev/sda  
echo GRUB_DISABLE_OS_PROBER=false >> /etc/default/grub  
update-grub  
  
xbps-reconfigure -fa  
exit  
reboot  
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
  
**ALSA**  
```
sudo xbps-install alsa-lib alsa-lib-devel alsa-plugins alsa-tools alsa-utils  
```  
  
**CHRONY**  
```
sudo xbps-install chrony  
sudo ln -s /etc/sv/chronyd /var/service  
sudo sv up chronyd  
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
  
**FISH-SHELL**  
```
sudo xbps-install fish-shell 
fish  
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher  
fisher install jorgebucaran/nvm.fish  
fisher install IlanCosman/tide@v5  
chsh -s /usr/bin/fish  
set -U fish_greeting  
```  
  
**BSPWM** 
```
xbps-install bspwm sxhkd xorg xinit mesa numlockx nitrogen git make patch gcc  
libX11-devel libXinerama-devel libXft-devel base-devel unzip fish-shell  
```   
  
**SOFT**  
```
firefox telegram-desktop viewnior mpv thunar tumbler mupdf leafpad gimp ardour lmms audacity obs ssr  
```  

**TERMINAL**  
```
htop links cmus neofetch scrot ranger rtorrent  
```  
  
**POLYBAR**  
```
polybar font-awesome6 jq curl  
```  
  
**BLENDER INKSCAPE PICOM**  
```
git clone https://github.com/void-linux/void-packages.git  
cd void-packages  
./xbps-src binary-bootstrap  
  
echo XBPS_ALLOW_RESTRICTED=yes >> etc/conf  
  
micro ~/void-packages/srcpkgs/blender/template  
  version=3.2.1
  checksum=f6912f2f62e4007272802e56de95c21cadd994b548a9088fdf4ee96554ae8278  
  
rm -rf ~/void-packages/srcpkgs/blender/patches  
./xbps-src pkg blender  
  
sudo xbps-install --repository hostdir/binpkgs blender
  
  
micro ~/void-packages/srcpkgs/inkscape/template  
  version=1.2  
  wrksrc="inkscape-${version}_2022-05-15_dc2aedaf03"  
  checksum=8d9b31142554945664edfefe2d6b55910a5099765f7176a71107c34f1dcde6ad  
  
rm -rf ~/void-packages/srcpkgs/inkscape/patches & ~/void-packages/srcpkgs/inkscape/update
./xbps-src pkg inkscape  
  
sudo xbps-install --repository hostdir/binpkgs inkscape   
```  
  
**ICONS CURSORS**  
```
cd ~/.icons  
git clone https://github.com/keeferrourke/la-capitaine-icon-theme.git  

set XCURSOR_THEME capitaine-cursors
```
  
**CMUS**  
```
start cmus
disable mpris in the settings  
set output_plugin=alsa
set dsp.alsa.device=default
set mixer.alsa.device=default
set mixer.alsa.channel=Master  
```  
  
**VIRT-MANAGER**  
```
sudo xbps-install virt-manager qemu bridge-utils dnsmasq  
  
sudo usermod -aG kvm username  
sudo usermod -aG libvirt username  
  
sudo modprobe kvm-amd  
sudo ln -s /etc/sv/libvirtd /var/service  
sudo ln -s /etc/sv/virtlockd /var/service  
sudo ln -s /etc/sv/virtlogd /var/service  
sudo ln -s /etc/sv/dbus /var/service  
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
sudo xbps-install lutris MangoHud void-repo-multilib wine winetricks wine-32bit mesa-dri-32bit libGL-32bit libtxc_dxtn-32bit  
``` 