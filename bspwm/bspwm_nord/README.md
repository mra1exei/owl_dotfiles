## GALLERY
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/bspwm/bspwm_nord/.img/2023-01-25-021637_1920x1080_scrot.png" width="450" align="center">
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/bspwm/bspwm_nord/.img/2023-01-25-021839_1920x1080_scrot.png" width="450" align="center">
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/bspwm/bspwm_nord/.img/2023-01-25-021705_1920x1080_scrot.png" width="450" align="center">
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/bspwm/bspwm_nord/.img/2023-01-25-021745_1920x1080_scrot.png" width="450" align="center">
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/bspwm/bspwm_nord/.img/2023-01-25-022931_1920x1080_scrot.png" width="450" align="center">
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/bspwm/bspwm_nord/.img/2023-01-25-022906_1920x1080_scrot.png" width="450" align="center">
  
## INFO
|DIstro|[ARCH](https://archlinux.org/)|
|:---:|:---:|
|WM|[BSPWM](https://github.com/baskerville/bspwm)|
|Bar|[Polybar](https://github.com/polybar/polybar)|
|Terminal|[Alacritty](https://github.com/alacritty/alacritty)|
|Shell|[Fish](https://fishshell.com/)|
|Icon|[Nordzy-icon](https://github.com/alvatip/Nordzy-icon)|
|GTK3|[Nordic](https://github.com/EliverLara/Nordic)|
|Cursor|[Nordzy-cursors](https://github.com/alvatip/Nordzy-cursors)|
|Fonts|[JetBrainsMono](https://www.jetbrains.com/lp/mono/)|
|Picom|[jonaburg](https://github.com/jonaburg/picom)|
|Launcher|rofi|
  
## INSTALL
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

## KEYBOARD  
sudo micro /etc/X11/xorg.conf.d/00-keyboard.conf  
```
Section "InputClass"  
    Identifier "system-keyboard"  
    MatchIsKeyboard "on"  
    Option "XkbLayout" "us,ru"  
    Option "XkbModel" "pc105"  
    Option "XkbOptions" "grp:alt_shift_toggle"  
EndSection  
```
  
## BSPWM INSTALL 
```
sudo pacman -S xorg xorg-xinit mesa bspwm git base-devel sxhkd alacritty  
  
.xinitrc:
exec sxhkd &
exec bspwm
    
chmod u+x .config/bspwm/bspwmrc
``` 

## SOFT 
```
sudo pacman -S pulseaudio pavucontrol firefox gimp inkscape telegram-desktop lxappearance nitrogen viewnior  
obs-studio python  thunat tumbler jq polybar awesome-terminal-fonts rofi  
``` 
  
## TERMINAL SOFT  
```
sudo pacman -S htop links cmus neofetch scrot ranger cava ueberzug w3m ImageMagick  
```  
  
## FISH  
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
  
## YAY
```
git clone https://aur.archlinux.org/yay.git  
cd yay  
makepkg -si       
```  
  
## PICOM
```
yay picom-jonaburg-git  
```  