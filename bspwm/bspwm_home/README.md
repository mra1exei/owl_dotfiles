**VOID INSTALL**  
```
cfdisk /dev/sda  
mkfs.ext4 /dev/sda1  
mount /dev/sda1 /mnt  
  
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
  
xbps-install nano  
nano /etc/default/libc-locales  
xbps-reconfigure -f glibc-locales  
  
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime  
  
passwd  
useradd -m -g users -G wheel audio -s /bin/bash user  
passwd user  
EDITOR=nano visudo user ALL=(ALL) ALL  
  
cp /proc/mounts /etc/fstab  
  
xbps-install grub  
grub-install /dev/sda  
  
xbps-reconfigure -fa  
exit  
reboot  
```  
  
**AUTOLOGIN & AUTOSTRTX** 
```
sudo nano  /etc/sv/agetty-tty1/conf  
GETTY_ARGS="-a username --noclear"  
  
nano .bash_profile  
[ -f $HOME/.bashrc ] && . $HOME/.bashrc  
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then  
exec startx  
fi
```    

**BSPWM** 
```
xbps-install bspwm sxhkd kitty xorg xinit mesa dmenu numlockx nitrogen  
make cmake meson ninja git xtools base-devel libX11-devel libXft-devel  
libXinerama-devel freetype-devel fontconfig-devel  
```  
  
**MEDIA**  
```
firefox telegram-desktop viewnior mpv nemo transmission-gtk alsa-utils pulseaudio pavucontrol 
```  

**CREO**  
```
gimp krita lmms audacity obs geany ssr  
```  

**TERMINAL**  
```
htop links cmus neofetch scrot cava
```  
  
**POLYBAR**  
```
polybar font-awesome6 jq 
```  
  
**BLENDER INKSCAPE PICOM**  
```
git clone https://github.com/void-linux/void-packages.git  
cd void-packages  
./xbps-src binary-bootstrap  
  
sudo echo XBPS_ALLOW_RESTRICTED=yes >> etc/conf  
  
nano ~/void-packages/srcpkgs/blender/template  
  version=3.2.1
  checksum=f6912f2f62e4007272802e56de95c21cadd994b548a9088fdf4ee96554ae8278  
  
delete ~/void-packages/srcpkgs/blender/patches  
./xbps-src pkg blender  
  
sudo xbps-install --repository hostdir/binpkgs blender
  
  
nano ~/void-packages/srcpkgs/inkscape/template  
  version=1.2  
  wrksrc="inkscape-${version}_2022-05-15_dc2aedaf03"  
  checksum=8d9b31142554945664edfefe2d6b55910a5099765f7176a71107c34f1dcde6ad  
  
delete ~/void-packages/srcpkgs/inkscape/patches & ~/void-packages/srcpkgs/inkscape/update
./xbps-src pkg inkscape  
  
sudo xbps-install --repository hostdir/binpkgs inkscape  
  
  
git clone https://github.com/ibhagwan/picom-ibhagwan-template  
mv picom-ibhagwan-template ./srcpkgs/picom-ibhagwan  
  
./xbps-src pkg picom-ibhagwan  
sudo xbps-install --repository=hostdir/binpkgs picom-ibhagwan  
```  
  
**WINE STEAM**  
```
void-repo-multilib libgcc-32bit libstdc++-32bit libdrm-32bit libglvnd-32bit wine-32bit wine winetricks steam  
void-repo-multilib void-repo-nonfree libGL-32bit libpulseaudio-32bit libtxc_dxtn-32bit mesa-dri-32bit  
```  

**KEYBOARD**  
```
sudo nano /etc/X11/xorg.conf.d/00-keyboard.conf  
  
Section "InputClass"  
    Identifier "system-keyboard"  
    MatchIsKeyboard "on"  
    Option "XkbLayout" "us,ru"  
    Option "XkbModel" "pc105"  
    Option "XkbOptions" "grp:alt_shift_toggle"  
EndSection  
```  
  
**UDEV RULES**  
```
echo SUBSYSTEM=="block", ATTR{size}=="234441648", SYMLINK+="root" > /etc/udev/rules.d/09-local.rules  
echo SUBSYSTEM=="block", ATTR{size}=="625139712", SYMLINK+="home" > /etc/udev/rules.d/10-local.rules
```  
  
**NTP**  
```
sudo xbps-install ntp  
sudo ln -s /etc/sv/ntpd /var/service 
sudo sv up ntpd
```  

**OS-PROBER**  
```
sudo xbps-install os-prober  
sudo echo GRUB_DISABLE_OS_PROBER=false >> /etc/default/grub  
sudo update-grub
```  
  
**ICONS**  
```
cd ~/.icons  
git clone https://github.com/keeferrourke/la-capitaine-icon-theme.git  
```
  
**CMUS**  
```
start cmus
disable mpris in the settings  
sudo xbps-install cmus-pulseaudio  
set output_plugin=pulse  
```  
  
**VIRT-MANAGER**  
```
sudo xbps-install virt-manager qemu bridge-utils dnsmasq  
  
sudo usermod -aG kvm $USER  
sudo usermod -aG libvirt $USER  
  
sudo modprobe kvm-amd  
sudo ln -s /etc/sv/libvirtd /var/service  
sudo ln -s /etc/sv/virtlockd /var/service  
sudo ln -s /etc/sv/virtlogd /var/service  
```  
  
**DMENU**  
```
git clone https://git.suckless.org/dmenu  
cd dmenu  
patch < dmenu-xyw-5.0.diff  
sudo make clean install  
```  