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

**BSPWM** 
```
xbps-install bspwm sxhkd kitty xorg xinit mesa dmenu numlockx nitrogen  
make cmake meson ninja git xtools base-devel libX11-devel libXft-devel  
libXinerama-devel freetype-devel fontconfig-devel  
```  
  
**MEDIA**  
```
firefox telegram-desktop viewnior mpv pcmanfm transmission-gtk alsa-utils pulseaudio pavucontrol 
```  

**CREO**  
```
gimp krita lmms audacity obs  
```  

**TERMINAL**  
```
htop links cmus neofetch scrot cava
```  
  
**POLYBAR**  
```
polybar font-awesome6 jq 
```  

**WINE STEAM**  
```
void-repo-multilib libgcc-32bit libstdc++-32bit libdrm-32bit libglvnd-32bit wine winetricks steam  
```  

simplescreenrecorder blender inkscape picom geany  



**KEYBOARD**  
sudo nano /etc/X11/xorg.conf.d/00-keyboard.conf  
```
Section "InputClass"  
    Identifier "system-keyboard"  
    MatchIsKeyboard "on"  
    Option "XkbLayout" "us,ru"  
    Option "XkbModel" "pc105"  
    Option "XkbOptions" "grp:alt_shift_toggle"  
EndSection  
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
```