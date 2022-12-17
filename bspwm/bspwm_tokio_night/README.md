<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/Hyprland/Hypr_Arch/img/20221115_23h51m53s_grim1.png" width="450" align="center"> 
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/Hyprland/Hypr_Arch/img/20221115_23h52m09s_grim1.png" width="450" align="center">
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/Hyprland/Hypr_Arch/img/20221115_23h51m45s_grim1.png" width="450" align="center">
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/Hyprland/Hypr_Arch/img/20221115_23h51m40s_grim1.png" width="450" align="center"> 

**ARCH LINUX INSTALL EFI**  
  
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
  
**BSPWM INSTALL**  
```
sudo pacman -S 
``` 
