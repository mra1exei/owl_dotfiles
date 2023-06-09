<img src=https://notabug.org/owl410/owl_dotfiles/raw/master/bspwm/bspwm_city/img/2022-06-18-024256_1920x1080_scrot.png width="450" align="center">
<img src=https://notabug.org/owl410/owl_dotfiles/raw/master/bspwm/bspwm_city/img/2022-06-18-163519_1920x1080_scrot.png width="450" align="center">
<img src=https://notabug.org/owl410/owl_dotfiles/raw/master/bspwm/bspwm_city/img/2022-06-18-163529_1920x1080_scrot.png width="450" align="center">
<img src=https://notabug.org/owl410/owl_dotfiles/raw/master/bspwm/bspwm_city/img/2022-06-18-163624_1920x1080_scrot.png width="450" align="center">

**BSPWM:**  
```
xorg xorg-xinit mesa bspwm sxhkd kitty dmenu numlockx nitrogen
```  

**SYSTEM SOFT:**  
```
nano sudo ntfs-3g os-prober dhcpcd pulseaudio pavucontrol
``` 

**OTHER SOFT:**  
```
firefox telegram-desktop nemo viewnior geany mpv lib32-mesa lib32-vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau conky
```  

**MEDIA SOFT:**  
```
obs-studio simplescreenrecorder blender inkscape gimp krita steam ttf-liberation(for steam) lmms audacity wine winetricks transmission-gtk
```  

**TERMINAL SOFT:**  
```
btop links cmus neofetch scrot
```  
  
**Time/Date setting:**  
```
sudo pacman -S ntp && sudo systemctl enable ntpd
```  

**Git**  
```
fakeroot base-devel git
```  

**Polybar**  
```
sudo pacman -S polybar polybar awesome-terminal-fonts jq
```  

**Picom**
```
mkdir build && cd build  
git clone https://github.com/ibhagwan/picom-ibhagwan-git  
cd picom-ibhagwan-git  
makepkg -si  
```  

**Cava**
```
mkdir build && cd build  
git clone https://aur.archlinux.org/cava-git.git 
cd cava-git 
makepkg -si  
```

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