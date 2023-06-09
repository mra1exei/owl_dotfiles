<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/sway/sway_fedora/img/screen-1678358997.png" width="450" align="center"> 
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/sway/sway_fedora/img/screen-1678359008.png" width="450" align="center"> 
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/sway/sway_fedora/img/screen-1678359075.png" width="450" align="center"> 
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/sway/sway_fedora/img/screen-1678359175.png" width="450" align="center"> 

## INFO
|DIstro|[Fedora](https://getfedora.org/)|
|:---:|:---:|
|WM|[Sway](https://swaywm.org/)|
|Bar|[Waybar](https://github.com/Alexays/Waybar)|
|Terminal|[Alacritty](https://github.com/alacritty/alacritty)|
|Shell|[Fish](https://fishshell.com/)|
|Icon|[Fluent](https://github.com/vinceliuice/Fluent-icon-theme)|
|GTK3|[Flat-Remix-GTK](https://github.com/daniruiz/Flat-Remix-GTK)|
|Cursors|[Capitaine cursors](https://github.com/keeferrourke/capitaine-cursors)|
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
lutris wine winetricks wine-mono mingw32-wine-gecko giflib glad dqlite libva openal ncurses v4l-utils libgcrypt libgcrypt.i686 libXinerama libXinerama.i686 libglvnd libglvnd.i686 libXcomposite libXcomposite.i686 libX11 libX11.i686 libpng libpng.i686 gnutls gnutls.i686 libgpg-error libgpg-error.i686 libxslt libxslt.i686 ocl-icd ocl-icd.i686 libjpeg-turbo libjpeg-turbo.i686 gdk-pixbuf2 gdk-pixbuf2.i686 gcc gcc.i686 giflib.i686 mesa-omx-drivers vulkan gamemode gamemode.i686 mesa-libGL mesa-libGL.i686 libvkd3d libvkd3d.i686 openldap openldap.i686 openal-soft openal-soft.i686 gstreamer1-plugins-base gstreamer1-plugins-base.i686 libv4l-1.22.1-4.fc37.i686    
``` 
  