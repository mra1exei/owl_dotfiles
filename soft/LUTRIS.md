# УСТАНОВКА LUTRIS
  
Привет, это мой гайд по установке lutris на разные дистрибутивы линукс. У меня видеокарта от красных так что все ориентированно на красных. Владельцы нвидии сори( Количество пакетов может показаться избыточным или недостаточным, но именно так у меня все работает. Гайд основан на личном опыте.

## VOID:  
sudo xbps-install void-repo-multilib  
sudo xbps-install -Suy  
  
```
sudo xbps-install lutris MangoHud MangoHud-32bit wine winetricks wine-32bit mesa-dri-32bit libGL-32bit libtxc_dxtn-32bit giflib giflib-32bit libpng libpng-32bit libldap libldap-32bit gnutls gnutls-32bit libopenal libopenal-32bit v4l-utils v4l-utils-32bit libgpg-error libgpg-error-32bit alsa-plugins alsa-plugins-32bit alsa-lib alsa-lib-32bit libjpeg-turbo libjpeg-turbo-32bit sqlite sqlite-32bit libXcomposite libXcomposite-32bit libXinerama libXinerama-32bit libgcrypt libgcrypt-32bit ncurses ncurses-libs ncurses-libs-32bit ocl-icd ocl-icd-32bit libxslt libxslt-32bit libva libva-32bit gst-plugins-base1 gst-plugins-base1-32bit amdvlk amdvlk-32bit vkd3d vkd3d-devel vkd3d-32bit vulkan-loader vulkan-loader-32bit libX11-devel libX11-devel-32bit libgpg-error libgpg-error-32bit gdk-pixbuf gdk-pixbuf-32bit libgcc libgcc-32bit libglvnd libglvnd-32bit mesa-vulkan-radeon mesa-vulkan-radeon-32bit
```
  
> Если система с pulseaudio то alsa-пакеты не нужны  
  
## ARCH:  
sudo nano /etc/pacman.conf

Раскоментировать:  
[multilib]
Include = /etc/pacman.d/mirrorlist
  
sudo pacman -Suy  
  
```
sudo pacman -S lutris wine wine-gecko wine-mono winetricks giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls openal lib32-openal v4l-utils lib32-v4l-utils libx11 lib32-libx11 ncurses lib32-ncurses libgcrypt lib32-libgcrypt libxcomposite lib32-libxcomposite dqlite lib32-sqlite libxinerama lib32-libxinerama gdk-pixbuf2 lib32-gdk-pixbuf2 gcc-libs lib32-gcc-libs ocl-icd lib32-ocl-icd libxslt lib32-libxslt libva lib32-libva gst-plugins-base lib32-gst-plugins-base libgpg-error lib32-libgpg-error libjpeg-turbo lib32-libjpeg-turbo libglvnd lib32-libglvnd libva-mesa-driver lib32-libva-mesa-driver amdvlk lib32-amdvlk vkd3d lib32-vkd3d lib32-vulkan-icd-loader vulkan-icd-loader glad
```
  
## FEDORA:  
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm  
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm  

```
sudo dnf install lutris wine winetricks wine-mono mingw32-wine-gecko giflib glad dqlite libva openal ncurses v4l-utils libgcrypt libgcrypt.i686 libXinerama libXinerama.i686 libglvnd libglvnd.i686 libXcomposite libXcomposite.i686 libX11 libX11.i686 libpng libpng.i686 gnutls gnutls.i686 libgpg-error libgpg-error.i686 libxslt libxslt.i686 ocl-icd ocl-icd.i686 libjpeg-turbo libjpeg-turbo.i686 gdk-pixbuf2 gdk-pixbuf2.i686 gcc gcc.i686 giflib.i686 mesa-omx-drivers vulkan gamemode gamemode.i686 mesa-libGL mesa-libGL.i686 libvkd3d libvkd3d.i686 openldap openldap.i686 openal-soft openal-soft.i686 gstreamer1-plugins-base gstreamer1-plugins-base.i686 libv4l-1.22.1-4.fc37.i686    
```
  
## УСТАНОВКА MANGOHUD  
```
pacman -S --needed git base-devel  
git clone https://aur.archlinux.org/yay.git  
cd yay  
makepkg -si  
yay mangohud  
4 5 7  
```

## ВОССТАНОВЛЕНИЕ БИБЛИОТЕКИ LUTRIS
Для того что бы была возможность восстановить библиотеку lutris на другой или переустановленной системе необходимо обязательно бэкапить вот эти каталоги:
  
> ~/.cache/lutris  
> ~/.config/lutris  
> ~/.local/share/lutris  
  
После установки системы нужно выполнить следующие действия:  
1. Установить lutris как в это описанно в этом гайде выше
2. Запустить lutris для того что бы lutris создал все необходимые каталоги
3. Закрыть lutris что бы не мешался
4. Заменить каталоги ~/.cache/lutris ~/.config/lutris ~/.local/share/lutris на те что были в предыдущей системе
  
ВАЖНО! Что бы диск с библиотекой игр был примонтирован по тому же пути что и в предыдущей системе. Иначе придется перепесывать все пути вручную. Если библиотека с играме находилась в home то путь к каталогу с библиотекой должен быть таким же как и ранее.