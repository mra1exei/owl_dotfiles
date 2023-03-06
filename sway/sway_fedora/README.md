<img src="https://notabug.org/1.png" width="450" align="center"> 
<img src="https://notabug.org/1.png" width="450" align="center"> 
<img src="https://notabug.org/1.png" width="450" align="center"> 
<img src="https://notabug.org/1.png" width="450" align="center"> 

## INFO
|DIstro|[Fedora](https://getfedora.org/)|
|:---:|:---:|
|WM|[Sway](https://swaywm.org/)|
|Bar|[Waybar](https://github.com/Alexays/Waybar)|
|Terminal|[Alacritty](https://github.com/alacritty/alacritty)|
|Shell|[Fish](https://fishshell.com/)|
|Icon|[Fluent (edit)](https://github.com/vinceliuice/Fluent-icon-theme)|
|GTK3|[Flat-Remix-GTK](https://github.com/daniruiz/Flat-Remix-GTK)|
|Cursors|[capitaine-cursors](https://github.com/keeferrourke/capitaine-cursors)|
|Fonts|[JetBrainsMono](https://www.jetbrains.com/lp/mono/)|
|Menu|wofi|
  
**SWAY INSTALL**  
```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm  
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm  
  
sudo dnf install sway waybar alacritty git wofi grim slurp  
  
start: sway  
  
export MOZ_ENABLE_WAYLAND=1  
export QT_QPA_PLATFORM=wayland  
``` 
  
**SOFT INSTALL**  
```
sudo dnf install firefox thunar mousepad pavucontrol telegram-desktop font-awesome inkscape gimp blender tumbler audacity obs-studio qt5-qtwayland xdg-desktop-portal-wlr transmission transmission-gtk ghostscript imv mpv  
```  
  
**TERMINAL SOFT INSTALL**  
```
sudo dnf install htop links cmus neofetch scrot ranger cava unzip micro  
```  
  
**FISH-SHELL**  
```
sudo dnf install util-linux-user fish  
  
fish  
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher  
fisher install jorgebucaran/nvm.fish  
fisher install IlanCosman/tide@v5  
chsh -s /usr/bin/fish  
set -U fish_greeting  
  
tide configure - что бы конфигурировать тильды 
``` 
    
**LUTRIS**  
```
sudo dnf install lutris wine winetricks giflib glad dqlite libva openal ncurses v4l-utils libgcrypt libgcrypt.i686 libXinerama libXinerama.i686 libglvnd libglvnd.i686 libXcomposite libXcomposite.i686 libX11 libX11.i686 libpng libpng.i686 gnutls gnutls.i686 libgpg-error libgpg-error.i686 libxslt libxslt.i686 ocl-icd ocl-icd.i686 libjpeg-turbo libjpeg-turbo.i686 gdk-pixbuf2 gdk-pixbuf2.i686 gcc gcc.i686 giflib.i686 mesa-omx-drivers vulkan gamemode gamemode.i686   
``` 
  