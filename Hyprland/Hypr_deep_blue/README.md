<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/Hyprland/Hypr_deep_blue/img/20230321_03h06m14s_grim.png" width="450" align="center"> 
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/Hyprland/Hypr_deep_blue/img/20230321_03h07m15s_grim.png" width="450" align="center">
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/Hyprland/Hypr_deep_blue/img/20230321_03h07m02s_grim.png" width="450" align="center">
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/Hyprland/Hypr_deep_blue/img/20230321_03h08m21s_grim.png" width="450" align="center">
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/Hyprland/Hypr_deep_blue/img/20230321_03h06m09s_grim.png" width="450" align="center">
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/Hyprland/Hypr_deep_blue/img/20230321_03h06m07s_grim.png" width="450" align="center">
  
## INFO
|DIstro|[ArchLinux](https://archlinux.org/)|
|:---:|:---:|
|WM|[Hyprland](https://hyprland.org/)|
|Bar|[Waybar](https://github.com/Alexays/Waybar)|
|Terminal|[Alacritty](https://github.com/alacritty/alacritty)|
|Shell|[Fish](https://fishshell.com/)|
|Icon|[Fluent](https://github.com/vinceliuice/Fluent-icon-theme)|
|GTK3|[Flat-Remix-GTK](https://github.com/daniruiz/Flat-Remix-GTK)|
|Cursors|[Capitaine cursors](https://github.com/keeferrourke/capitaine-cursors)|
|Fonts|[JetBrainsMono](https://www.jetbrains.com/lp/mono/)|
|Menu|wofi|
  
## ARCH LINUX INSTALL
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
  
## YAY INSTALL
```  
pacman -S --needed git base-devel  
git clone https://aur.archlinux.org/yay.git  
cd yay  
makepkg -si  
```  
  
## HYPRLAND INSTALL
```  
yay hyprland  
yay waybar-hyprland-git  
yay hyprpaper-git  
```  
  
## AUTOLOGIN & AUTOSTRTX
```
sudo pacman -S sddm  
systemctl enable sddm  
``` 
  
## SOFT INSTALL
```
sudo pacman -S alacritty firefox telegram-desktop imv mpv nemo wofi mousepad gimp blender inkscape ghostscript obs-studio xdg-desktop-portal-wlr transmission-gtk pavucontrol pulseaudio  
```  
  
## TERMINAL SOFT INSTALL
```
sudo pacman -S htop links cmus neofetch scrot ranger cava unzip micro  
```  
  
## FISH-SHELL INSTALL
```
fish  
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher  
fisher install jorgebucaran/nvm.fish  
fisher install IlanCosman/tide@v5  
chsh -s /usr/bin/fish  
set -U fish_greeting  
``` 
  
## THEMES, ICONS, FONTS  
```
gsettings set org.gnome.desktop.interface icon-theme Fluent-dark  
gsettings set org.gnome.desktop.interface gtk-theme Flat-Remix-GTK-Blue-Dark  
gsettings set org.gnome.desktop.interface cursor-theme capitaine-cursors
``` 
  
## LUTRIS INSTALL
```
sudo pacman -S lutris wine wine-gecko wine-mono winetricks giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls openal lib32-openal v4l-utils lib32-v4l-utils libx11 lib32-libx11 ncurses lib32-ncurses libgcrypt lib32-libgcrypt libxcomposite lib32-libxcomposite dqlite lib32-sqlite libxinerama lib32-libxinerama gdk-pixbuf2 lib32-gdk-pixbuf2 gcc-libs lib32-gcc-libs ocl-icd lib32-ocl-icd libxslt lib32-libxslt libva lib32-libva gst-plugins-base lib32-gst-plugins-base libgpg-error lib32-libgpg-error libjpeg-turbo lib32-libjpeg-turbo libglvnd lib32-libglvnd libva-mesa-driver lib32-libva-mesa-driver amdvlk lib32-amdvlk vkd3d lib32-vkd3d lib32-vulkan-icd-loader vulkan-icd-loader glad    
``` 
  