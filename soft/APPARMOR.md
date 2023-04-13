## ARCH LINUX
### Install
```
sudo pacman -S apparmor
```
  
```
sudo micro /etc/default/grub
  
CONFIG_SECURITY_APPARMOR=y
CONFIG_AUDIT=y
CONFIG_LSM="landlock,lockdown,yama,integrity,apparmor,bpf"
GRUB_CMDLINE_LINUX_DEFAULT="apparmor=1 security=apparmor"
  
sudo grub-mkconfig -o /boot/grub/grub.cfg
  
sudo systemctl enable apparmor  
sudo systemctl enable auditd  
```
  
## Создание профиля
```
sudo aa-autodep /путь/к/файлу - создание профиля
sudo aa-genprof /путь/к/файлу - генерация правил
sudo aa-logprof
```
sudo aa-autodep /usr/bin/lutris  
sudo aa-enforce usr.bin.lutris  
sudo aa-logprof  