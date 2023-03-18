## GALLERY
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/bspwm/my_bspwm/.img/2022-12-12-151307_1920x1080_scrot.png" width="450" align="center">
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/bspwm/my_bspwm/.img/2022-12-12-153156_1920x1080_scrot.png" width="450" align="center">
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/bspwm/my_bspwm/.img/2022-12-12-161038_1920x1080_scrot.png" width="450" align="center">
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/bspwm/my_bspwm/.img/2022-12-12-160947_1920x1080_scrot.png" width="450" align="center">

## INFO
|DIstro|[VOID](https://voidlinux.org/)|
|:---:|:---:|
|WM|[--](--)|
|Bar|[--](--)|
|Terminal|[--](--)|
|Shell|[Fish](https://fishshell.com/)|
|Icon|[--](--)|
|GTK3|[--](--)|
|Fonts|[--](--)|
  
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