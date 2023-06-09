## GALLERY
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/NEWM/newm_nord/.img/20221224_01h20m59s_grim.png" width="450" align="center">
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/NEWM/newm_nord/.img/20221224_01h45m59s_grim.png" width="450" align="center">
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/NEWM/newm_nord/.img/20221224_01h46m24s_grim.png" width="450" align="center">
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/NEWM/newm_nord/.img/20221224_01h47m17s_grim.png" width="450" align="center">
  
## INFO
|DIstro|[ARCH](https://archlinux.org/)|
|:---:|:---:|
|WM|[NEWM](https://github.com/jbuchermn/newm)|
|Bar|[Waybar](https://github.com/Alexays/Waybar)|
|Terminal|[Alacritty](https://github.com/alacritty/alacritty)|
|Shell|[Fish](https://fishshell.com/)|
|Icon|[Nordzy](https://github.com/alvatip/Nordzy-icon)|
|GTK3|[Nordic](https://github.com/EliverLara/Nordic)|
|Cursors|[Nordzy](https://github.com/alvatip/Nordzy-cursors)|
|Fonts|[JetBrainsMono](https://www.jetbrains.com/lp/mono/)|
|Menu|Wofi|
  
## ARCH LINUX INSTALL EFI
  
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

grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/EFI --removable  
grub-mkconfig -o /boot/grub/grub.cfg  

passwd  
useradd -m -g users -G wheel -s /bin/bash username  
passwd username  
EDITOR=micro visudo user ALL=(ALL) ALL  
  
systemctl enable dhcpcd  
```  

## Install yay
```
sudo pacman -S --needed git base-devel  
git clone https://aur.archlinux.org/yay.git  
cd yay  
makepkg -si
```  
  
## Install NEWM
```
sudo pacman -S wayland python-pywayland python-pywlroots mesa wlroots polkit alacritty waybar   
yay newm-git  
    
start-newm  
```
  
## ALSA INSTALL  
```
sudo pacman -S alsa-lib alsa-plugins alsa-tools alsa-utils alsa-firmware  
sudo gpasswd -a username audio  
```
  
## FISH-SHELL  
```
sudo pacman -S fish
fish  
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher  
fisher install jorgebucaran/nvm.fish  
fisher install IlanCosman/tide@v5  
chsh -s /usr/bin/fish  
set -U fish_greeting  
``` 
  
## MICRO
```
micro --plugin install nordcolors  
```
  
## SOFT
```
sudo pacman -S firefox telegram-desktop thunar tumbler awesome-terminal-fonts imv mpv wofi mousepad blender inkscape  
```

## TERMINAL SOFT
```
sudo pacman -S htop links cmus neofetch ranger grim unzip ueberzug w3m imagemagick wf-recorder  
```
  
## WLOGOUT
```
yay wlogout-git  
```