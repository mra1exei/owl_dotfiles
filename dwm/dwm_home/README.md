**DWM** 
```
wget kitty xorg xinit mesa dmenu numlockx nitrogen make
base-devel libX11-devel libXft-devel libXinerama-devel freetype-devel fontconfig-devel 
```  
**MEDIA**  
```
firefox telegram-desktop viewnior mpv pcmanfm transmission-gtk
```  

**TERMINAL**  
```
htop links cmus neofetch scrot cava
```  


obs-studio simplescreenrecorder blender inkscape gimp krita lmms audacity 

ntp picom geany

lib32-mesa lib32-vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau wine winetricks steam ttf-liberation(for steam)

**KEYBOARD**  
sudo nano /etc/X11/xorg.conf.d/00-keyboard.conf  
```
Section "InputClass"  
    Identifier "system-keyboard"  
    MatchIsKeyboard "on"  
    Option "XkbLayout" "us,ru"  
    Option "XkbModel" "pc105"  
    Option "XkbOptions" "grp:alt_shift_toggle"  
EndSection  
```

**OS-PROBER**  
```
sudo xbps-install os-prober  
sudo echo GRUB_DISABLE_OS_PROBER=false >> /etc/default/grub  
sudo update-grub
```