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
sudo aa-autodep /usr/bin/lutris  
sudo aa-complane usr.bin.lutris  
sudo aa-logprof 
```

## ФЛАГИ
```

r — чтение
w — запись
a — инкрементальная запись в конец файла
k — блокировка файлов
l — создание символических ссылок на исполняемые файлы
m — загрузка исполняемых файлов в память
cx — переход в профиль нижнего уровня при выполнении
Cx — переход в профиль нижнего уровня при выполнении с очисткой переменных окружения
ix — наследование исполнения;
px — требуется определение дискретного профиля безопасности для ресурса
Px — требуется определение дискретного профиля безопасности для ресурса, производится очистка переменных окружения
ux — не проверять запуск новых процессов
Ux — не проверять запуск новых процессов и производить очистку переменных окружения
```
 