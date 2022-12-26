## GALLERY
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/NEWM/newm_nord/.img/111.png" width="450" align="center">

  
## INFO
|DIstro|[ARCH](https://archlinux.org/)|
|:---:|:---:|
|WM|[Qtile](https://docs.qtile.org)|
|Bar|Qtile-bar|
|Terminal|[Alacritty](https://github.com/alacritty/alacritty)|
|Shell|[Fish](https://fishshell.com/)|
|Icon|[---](---)|
|GTK3|[---](---|
|Cursors|[---](---)|
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
  
## Install Qtile
```
sudo pacman -S qtile mesa alacritty ayland wlroots python-pywayland python-pywlroots  
  
mkdir -p ~/.config/qtile/  
cp /usr/share/doc/qtile_dir/default_config.py ~/.config/qtile/config.py  
  
qtile start -b wayland  
```  
  
https://docs.qtile.org/en/stable/index.html