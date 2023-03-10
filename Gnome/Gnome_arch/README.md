## GALLERY
<img src="1" width="450" align="center">
<img src="1" width="450" align="center">
<img src="1" width="450" align="center">
<img src="1" width="450" align="center">
  
## INFO
|DIstro|[ARCH](https://archlinux.org/)|
|:---:|:---:|
|DE|[Gnome](https://www.gnome.org/)|
|Terminal|[Console]|
|Shell|[Fish](https://fishshell.com/)|
|Icon|[--](--)|
|GTK3|[--](--)|
|Cursor|[--](--)|
|Fonts|[--](--)|
|Picom|[--)|
|Launcher|--|
  
## INSTALL ARCH UEFI
```
cfdisk /dev/sdaX  (make partition for root & efi)
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

mkdir /boot/efi  
mount /dev/sdaX1 /boot/efi  
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/EFI --removable  
grub-mkconfig -o /boot/grub/grub.cfg  

passwd  
useradd -m -g users -G wheel -s /bin/bash username  
passwd username  
EDITOR=micro visudo user ALL=(ALL) ALL  
  
systemctl enable dhcpcd  
```  
  
## INSTALL GNOME
```
sudo pacman -S gnome gdm  
  
systemctl enable gdm  
  
yay gnome-browser-connector  
``` 

## SOFT 
```
sudo pacman -S firefox telegram-desktop inkscape blender gimp obs-studio awesome-terminal-fonts    
``` 
  
## TERMINAL SOFT  
```
sudo pacman -S htop links cmus neofetch scrot ranger  
```  
  
## FISH  
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
  
## YAY
```
sudo pacman -S --needed git base-devel  
git clone https://aur.archlinux.org/yay.git  
cd yay  
makepkg -si       
```
  
## LUTRIS  
```
sudo pacman -S lutris wine wine-gecko wine-mono winetricks giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls openal lib32-openal v4l-utils lib32-v4l-utils libx11 lib32-libx11 ncurses lib32-ncurses libgcrypt lib32-libgcrypt libxcomposite lib32-libxcomposite dqlite lib32-sqlite libxinerama lib32-libxinerama gdk-pixbuf2 lib32-gdk-pixbuf2 gcc-libs lib32-gcc-libs ocl-icd lib32-ocl-icd libxslt lib32-libxslt libva lib32-libva gst-plugins-base lib32-gst-plugins-base libgpg-error lib32-libgpg-error libjpeg-turbo lib32-libjpeg-turbo libglvnd lib32-libglvnd libva-mesa-driver lib32-libva-mesa-driver amdvlk lib32-amdvlk vkd3d lib32-vkd3d lib32-vulkan-icd-loader vulkan-icd-loader glad
```
  
## GNOME SHELL EXTENSION
[ArcMenu](https://extensions.gnome.org/extension/3628/arcmenu/)  
[Auto Move Windows](https://extensions.gnome.org/extension/16/auto-move-windows/)  
[User Themes](https://extensions.gnome.org/extension/19/user-themes/)  
[App Icons Taskbar](https://extensions.gnome.org/extension/4944/app-icons-taskbar/)
  

[Dash to Dock](https://extensions.gnome.org/extension/307/dash-to-dock/)


[Remove App Menu](https://extensions.gnome.org/extension/3906/remove-app-menu/)