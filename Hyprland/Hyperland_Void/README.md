## GALLERY
<img src="1" width="450" align="center">
<img src="1" width="450" align="center">
<img src="1" width="450" align="center">
<img src="1" width="450" align="center">

## INFO
|DIstro|[VOID](https://voidlinux.org/)|
|:---:|:---:|
|WM|[Hyprland](https://hyprland.org/)|
|Bar|[Waybar](https://github.com/Alexays/Waybar)|
|Terminal|[Alacritty](https://github.com/alacritty/alacritty)|
|Shell|[Fish](https://fishshell.com/)|
|Icon|[--](--)|
|GTK3|[--](--)|
|Cursors|[Capitaine cursors](https://github.com/keeferrourke/capitaine-cursors)|
|Fonts|[JetBrainsMono](https://www.jetbrains.com/lp/mono/)|
|Menu|wofi|
  
## INSTALL:

  
**VOID INSTALL:**  
```
cfdisk /dev/sdd
mkfs.vfat /dev/sdd4  
mkfs.btrfs -f /dev/sdd5  
mount /dev/sdd5 /mnt
mkdir -p /mnt/boot/efi/  
mount /dev/sdd4 /mnt/boot/efi/  
  
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
  
EFI:
xbps-install grub-x86_64-efi  
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id="Void" 
echo GRUB_DISABLE_OS_PROBER=false >> /etc/default/grub  
update-grub 
  
xbps-reconfigure -fa  
exit  
reboot  
```  
  
**DHCPCD:** 
```
sudo ln -s /etc/sv/dhcpcd /var/service  
sudo sv up dhcpcd  
```  
  
**CHRONY:**  
```
sudo xbps-install chrony  
sudo ln -s /etc/sv/chronyd /var/service  
sudo sv up chronyd  
```
  
**FISH-SHELL:**  
```
sudo xbps-install fish-shell 
fish  
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher  
fisher install jorgebucaran/nvm.fish  
fisher install IlanCosman/tide@v5  
chsh -s /usr/bin/fish  
set -U fish_greeting  
  
tide configure - что бы конфигурировать тильды
``` 
  
**INSTALL HYPRLAND:**
```
sudo xbps-install libgbm-devel libglvnd-devel libseat-devel eudev-libudev-devel  
libdrm-devel libinput-devel libxkbcommon-devel pixman-devel wayland-devel  
wayland-protocols vulkan-loader Vulkan-Headers xcb-util-errors-devel xcb-util-wm-devel  
xcb-util-renderutil-devel pkg-config seatd dbus elogind pango-devel cairo-devel  
xorg-server-xwayland xorg git make wlroots meson cmake gcc polkit  
  
sudo ln -s /etc/sv/seatd /var/service  
sudo ln -s /etc/sv/dbus /var/service  
sudo ln -s /etc/sv/elogind /var/service  
  
sudo usermod -aG _seatd username  
  
git clone https://github.com/void-linux/void-packages.git  
cd void-packages  
./xbps-src binary-bootstrap  

echo XBPS_ALLOW_RESTRICTED=yes >> etc/conf  
echo libdisplay-info.so.1 libdisplay-info-0.1.1_1 >> common/shlibs  
echo libliftoff.so.0 libliftoff-0.4.1_1 >> common/shlibs  
  
./xbps-src pkg libliftoff  
./xbps-src pkg libdisplay-info  
./xbps-src pkg hyprland  
  
xbps-install --repository hostdir/binpkgs hyprland  
```
  
**ALSA:**  
```
sudo xbps-install alsa-lib alsa-lib-devel alsa-plugins alsa-tools alsa-utils  
sudo ln -s /etc/sv/alsa /var/service  
sudo sv up alsa  
```  
  
**SOFT:**
```
firefox telegram-desktop imv mpv nemo tumbler wofi blender inkscape htop neofetch cmus ranger grim unzip links gimp ardour lmms audacity obs transmission transmission-gtk inkscape blender ghostscript  
```