
wget kitty xorg xinit mesa make base-devel libX11-devel libXft-devel libXinerama-devel freetype-devel fontconfig-devel dmenu numlockx nitrogen

firefox telegram-desktop viewnior mpv pcmanfm

htop links cmus neofetch scrot cava



obs-studio simplescreenrecorder blender inkscape gimp krita lmms audacity transmission-gtk

ntp picom geany

lib32-mesa lib32-vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau wine winetricks steam ttf-liberation(for steam)

**Keyboard**  
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