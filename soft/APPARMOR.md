## ARCH LINUX
### Install
```
sudo pacman -S apparmor
```
  
```
/etc/default/grub
  
CONFIG_SECURITY_APPARMOR=y
CONFIG_AUDIT=y
CONFIG_LSM="landlock,lockdown,yama,integrity,apparmor,bpf"
GRUB_CMDLINE_LINUX_DEFAULT="apparmor=1 security=apparmor"
  
grub-mkconfig -o /boot/grub/grub.cfg
  
sudo systemctl enable apparmor
```
  
## Создание профиля
```
sudo aa-autodep /путь/к/файлу - создание профиля
sudo aa-genprof /путь/к/файлу - генерация правил
```