## ARCH LINUX
### Установка
```
sudo pacman -S apparmor
```
  
```
sudo micro /etc/default/grub
  
CONFIG_SECURITY_APPARMOR=y
CONFIG_AUDIT=y
CONFIG_LSM="landlock,lockdown,yama,integrity,apparmor,bpf"
GRUB_CMDLINE_LINUX_DEFAULT="apparmor=1 security=apparmor"
```
```
sudo grub-mkconfig -o /boot/grub/grub.cfg
```  
```
sudo systemctl enable apparmor  
sudo systemctl enable auditd  
```
  
## СОЗДАНИЕ ПРОФИЛЯ
```
sudo aa-autodep /usr/bin/lutris  
sudo aa-complane usr.bin.lutris  
sudo aa-logprof 
```

## ФЛАГИ
```
r - разрешить чтение
w - разрешить запись
a - разрешить запись в конец файла
px - разрешить запуск новых процессов если для них есть профиль
Px - разрешить запуск новых процессов, если для них есть профиль и стереть переменные окружения
ix - разрешить запуск нового процесса под профилем текущего
m - разрешить загружать исполняемые файлы в память и запускать
l - разрешить создавать символические ссылки на исполняемые файлы
k - разрешить блокировать файлы
ux - не контролировать новые процессы
Ux - не контролировать новые процессы и очистить переменные окружения
```
 