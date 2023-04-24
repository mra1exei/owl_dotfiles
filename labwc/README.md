## GALLERY
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/labwc/img/20230425_02h31m23s_grim.png" width="450" align="center">
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/labwc/img/20230425_02h27m06s_grim.png" width="450" align="center">
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/labwc/img/20230425_02h31m41s_grim.png" width="450" align="center">
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/labwc/img/20230425_02h32m32s_grim.png" width="450" align="center">
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/labwc/img/20230425_02h26m48s_grim.png" width="450" align="center">
<img src="1" width="450" align="center">
  
## INFO
|DIstro|[ARCH](https://archlinux.org/)|
|:---:|:---:|
|WM|[Labwc](https://github.com/labwc/labwc)|
|Bar|[Waybar](https://github.com/Alexays/Waybar)|
|Terminal|[Alacritty](https://github.com/alacritty/alacritty)|
|Shell|[Fish](https://fishshell.com/)|
|Icon|[Fluent-green-dark](https://www.pling.com/p/1477945)|
|GTK3|[Skeuos-Grey-Dark](https://www.pling.com/p/1441725)|
|Cursors|[Capitaine cursors](https://github.com/keeferrourke/capitaine-cursors)|
|Fonts|[JetBrainsMono](https://www.jetbrains.com/lp/mono/)|
|Launcher|[wofi](https://sr.ht/~scoopta/wofi/)|
  
## INSTALL
```
cfdisk /dev/sdaX  
mkfs.fat -F 32 /dev/sdaX1  
mkfs.ext4 /dev/sdaX2  
mount /dev/sdaX2 /mnt  
mkdir /mnt/boot
mount /dev/sdaX1 /mnt/boot  
  
pacstrap /mnt base linux linux-firmware  
genfstab -U /mnt >> /mnt/etc/fstab  
arch-chroot /mnt  
  
pacman -S grub efibootmgr micro sudo dhcpcd os-prober ntfs-3g  

/etc/locale.gen (uncomment en_US.UTF-8 & ru_RU.UTF-8)  
locale-gen  
  
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime  
hwclock --systohc 

mount /dev/sdaX1 /boot/EFI  
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/EFI --removable  
grub-mkconfig -o /boot/grub/grub.cfg  

passwd  
useradd -m -g users -G wheel -s /bin/bash username  
passwd username  
EDITOR=micro visudo user ALL=(ALL) ALL  
  
systemctl enable dhcpcd  
```  
  
## YAY
```
git clone https://aur.archlinux.org/yay.git  
cd yay  
makepkg -si       
```
  
## LABWC INSTALL 
```
sudo pacman -S alacritty mesa base-devel wlroots polkit waybar swaybg  
yay labwc
cp -r /usr/share/doc/labwc .config/

labwc - для того что бы запустить
``` 

## SOFT 
```
sudo pacman -S pulseaudio pavucontrol firefox telegram-desktop gimp inkscape blender ghostscript obs-studio xdg-desktop-portal-wlr transmission-gtk python imv mpv nemo wofi awesome-terminal-fonts rofi htop cmus neofetch grim ranger unzip gedit  
``` 
  
## FISH INSTALL  
```
sudo pacman -S fish 
fish  
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher  
fisher install jorgebucaran/nvm.fish  
fisher install IlanCosman/tide@v5  
chsh -s /usr/bin/fish  
set -U fish_greeting  
  
tide configure - что бы конфигурировать тильды
```  
  
## THEMES, ICONS, FONTS...
```
gsettings set org.gnome.desktop.interface icon-theme Fluent-dark  
gsettings set org.gnome.desktop.interface gtk-theme Fluent-Light-compact  
gsettings set org.gnome.desktop.interface cursor-theme capitaine-cursors
```
  
## LUTRIS INSTALL
```
sudo pacman -S lutris wine wine-gecko wine-mono winetricks giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls openal lib32-openal v4l-utils lib32-v4l-utils libx11 lib32-libx11 ncurses lib32-ncurses libgcrypt lib32-libgcrypt libxcomposite lib32-libxcomposite dqlite lib32-sqlite libxinerama lib32-libxinerama gdk-pixbuf2 lib32-gdk-pixbuf2 gcc-libs lib32-gcc-libs ocl-icd lib32-ocl-icd libxslt lib32-libxslt libva lib32-libva gst-plugins-base lib32-gst-plugins-base libgpg-error lib32-libgpg-error libjpeg-turbo lib32-libjpeg-turbo libglvnd lib32-libglvnd libva-mesa-driver lib32-libva-mesa-driver amdvlk lib32-amdvlk vkd3d lib32-vkd3d lib32-vulkan-icd-loader vulkan-icd-loader glad
```