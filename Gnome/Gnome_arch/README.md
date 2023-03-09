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
  
## INSTALL AWESOME
```
sudo pacman -S gnome gdm  
  
systemctl enable gdm  
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
git clone https://aur.archlinux.org/yay.git  
cd yay  
makepkg -si       
```
