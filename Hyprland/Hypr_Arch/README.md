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
sudo pacman -S base-devel gdb ninja gcc cmake libxcb xcb-proto xcb-util  
xcb-util-keysyms libxfixes libx11 libxcomposite xorg-xinput libxrender  
pixman wayland-protocols cairo pango seatd libxkbcommon xcb-util-wm  
xorg-xwayland cmake wlroots mesa git meson alacritty polkit 
  
git clone --recursive https://github.com/hyprwm/Hyprland  
cd Hyprland  
git submodule init  
git submodule update  
sudo make install  

sudo systemctl enable seatd 
``` 
  
**HYPRPAPER INSTALL**  
```
git clone https://github.com/hyprwm/hyprpaper  
cd hyprpaper  
make all  
  
cp ~/hyprpaper/build/hyprpaper /usr/bin 
```  
  
**YAY INSTALL**  
```  
pacman -S --needed git base-devel  
git clone https://aur.archlinux.org/yay.git  
cd yay  
makepkg -si  
```  
  
**WAYBAR INSTALL**  
```
git clone https://github.com/Alexays/Waybar/  
cd Waybar  
sudo pacman -S fmt spdlog gtkmm3 libdbusmenu-gtk3 upower libmpdclient sndio gtk-layer-shell scdoc  
clang awesome-terminal-fonts  

yay catch2-git

sed -i 's/zext_workspace_handle_v1_activate(workspace_handle_);/const std::string command = "hyprctl dispatch   workspace " + name_;\n\tsystem(command.c_str());/g' src/modules/wlr/workspace_manager.cpp  

meson --prefix=/usr --buildtype=plain --auto-features=enabled --wrap-mode=nodownload build  
meson configure -Dexperimental=true build  
sudo ninja -C build install    
```  
  
**ALSA INSTALL**  
```
sudo pacman -S alsa-lib alsa-plugins alsa-tools alsa-utils  
sudo gpasswd -a username audio  
``` 
  
**AUTOLOGIN & AUTOSTRTX** 
```
sudo pacman -S sddm
``` 
  
**SOFT INSTALL**  
```
sudo pacman -S firefox telegram-desktop viewnior mpv thunar  
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
    
**LUTRIS**  
```
sudo pacman -S lutris MangoHud MangoHud-32bit wine winetricks wine-32bit mesa-dri-32bit libGL-32bit amdvlk
amdvlk-32bit vkd3d vkd3d-devel vkd3d-32bit vulkan-loader vulkan-loader-32bit libX11-devel libX11-devel-32bit libgpg-error libgpg-error-32bit gdk-pixbuf gdk-pixbuf-32bit libgcc libgcc-32bit libglvnd libglvnd-32bit  
``` 
  