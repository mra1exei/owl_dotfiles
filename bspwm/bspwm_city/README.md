![](https://notabug.org/owl410/owl_dotfiles/raw/master/bspwm/bspwm_city/img/2022-06-18-024256_1920x1080_scrot.png)  
![](https://notabug.org/owl410/owl_dotfiles/raw/master/bspwm/bspwm_city/img/2022-06-18-163519_1920x1080_scrot.png)  
![](https://notabug.org/owl410/owl_dotfiles/raw/master/bspwm/bspwm_city/img/2022-06-18-163529_1920x1080_scrot.png)  
![](https://notabug.org/owl410/owl_dotfiles/raw/master/bspwm/bspwm_city/img/2022-06-18-163624_1920x1080_scrot.png)  

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
firefox telegram-desktop nemo viewnior geany mpv obs-studio simplescreenrecorder blender inkscape gimp krita steam ttf-liberation(for steam) lib32-mesa  lib32-vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau conky
```  

**TERMINAL SOFT:**  
```
htop links cmus neofetch scrot
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