## GALLERY
<img src="https://notabug.org/owl410/owl_dotfiles/src/master/XFCE/xfce_tokio_night/img/src_1.jpg" width="450" align="left">
<img src="https://notabug.org/owl410/owl_dotfiles/src/master/XFCE/xfce_tokio_night/img/src_2.jpg" width="450" align="right">
<img src="https://notabug.org/owl410/owl_dotfiles/src/master/XFCE/xfce_tokio_night/img/src_3.jpg" width="450" align="left">
<img src="https://notabug.org/owl410/owl_dotfiles/src/master/XFCE/xfce_tokio_night/img/src_4.jpg" width="450" align="right">
  
## Install GTK theme

**Download theme:**  
* [Tokyonight-Dark-BL-LB](https://www.gnome-look.org/p/1681315)
* [Tokyonight-Light-BL-LB](https://www.gnome-look.org/p/1681315)
* [Tokyonight-Moon-BL-LB](https://www.gnome-look.org/p/1681315)
* [Tokyonight-Storm-BL-LB](https://www.gnome-look.org/p/1681315)
  
mkdir ~/.themes  
copy & unzip gtk themes in ~/.themes  
  
## Install icons
* git clone https://github.com/alvatip/Nordzy-icon    
* cd Nordzy-icon  
* install.sh  

## Install fonts
* Download font [JetBrainsMono ](https://download.jetbrains.com/fonts/JetBrainsMono-2.242.zip?_gl=1*x4bu9c*_ga*MjAyOTUyMTMxMy4xNjcwOTM4NDY4*_ga_9J976DJZ68*MTY3MDkzODQ2OC4xLjAuMTY3MDkzODQ2OC4wLjAuMA..&_ga=2.32591222.957622972.1670938469-2029521313.1670938468)  
* mkdir ~/.fonts  
* copy & unzip all fonts files in ~/.fonts
* sudo pacman -S awesome-terminal-fonts

## Install fish shell
* sudo pacman -S fish  
* fish  
* curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher  
* fisher install jorgebucaran/nvm.fish  
* fisher install IlanCosman/tide@v5  
* chsh -s /usr/bin/fish  
* set -U fish_greeting  
  
tide configure    

## Install yay
* sudo pacman -S --needed git base-devel  
* git clone https://aur.archlinux.org/yay.git  
* cd yay  
* makepkg -si  

## Install cursors
* yay xcursor-simp1e-tokyo-night-storm   
* yay xcursor-simp1e-tokyo-night-light  
* yay xcursor-simp1e-tokyo-night
  
## Terminal custom
* download [this](https://notabug.org/owl410/owl_dotfiles/src/master/XFCE/xfce_tokio_night/.config/xfce4/terminal/colorschemes/tokyonight_night.theme) theme
* mkdir -p ~/.config/xfce4/terminal/colorschemes
* move theme to ~/.config/xfce4/terminal/colorschemes
* change terminal setting:
  
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/XFCE/xfce_tokio_night/img/term_1.png" width="450" align="center">
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/XFCE/xfce_tokio_night/img/term_1.png" width="450" align="right">  
  
## Wallpaper custom
* download [this](https://images.unsplash.com/photo-1477346611705-65d1883cee1e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80) wallpaper
* change desktop setting:
  
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/XFCE/xfce_tokio_night/img/desktop.png" width="750" align="center">  
  
## Dock
* yay xfce4-docklike-plugin
* add new panel:
  
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/XFCE/xfce_tokio_night/img/dock.png" width="450" align="center">  
  
## Panel
* yay vala-panel-appmenu-xfce
* sudo pacman - S appmenu-gtk-module
* add new panel:
  
<img src="https://notabug.org/owl410/owl_dotfiles/raw/master/XFCE/xfce_tokio_night/img/panel.png" width="450" align="center">  
  
## Picom
* yay picom-tryone-git
* mkdir -p ~/.config/picom
* download [this](https://notabug.org/owl410/owl_dotfiles/src/master/XFCE/xfce_tokio_night/.config/picom/picom.conf) archive and unzip to ~/.config/picom
* add to autostart: picom  
  

## Conky(for cmus player)
* sudo pacman - S conky jq glava cmus
* mkdir -p ~/.config/conky
* mkdir -p ~/.config/glava
* download [this](https://notabug.org/owl410/owl_dotfiles/src/master/XFCE/xfce_tokio_night/.config/conky/conky.tar.gz) archive and unzip to ~/.config/conky
*download [this](https://notabug.org/owl410/owl_dotfiles/src/master/XFCE/xfce_tokio_night/.config/glava/glava.tar.gz) file and move to ~/.config/glava
* add to autostart: glava --desktop
* add to autostart: conky

## Micro
* sudo pacman - S micro
* mkdir -p ~/.config/micro/colorshemes
* download [this](https://notabug.org/owl410/owl_dotfiles/src/master/XFCE/xfce_tokio_night/.config/micro/colorshemes/tokyo_night.micro) file and move to ~/.config/micro/colorshemes
* start micro
* ctrl+e
* set colorsheme tokyo_night
  
## Neofetch
* sudo pacman - S neofetch
* mkdir -p ~/.config/neofetch
* download [this](https://notabug.org/owl410/owl_dotfiles/src/master/XFCE/xfce_tokio_night/.config/neofetch/config.conf) file and move to ~/.config/neofetch
  
## Telegram
* sudo pacman - S telegram-desktop
* download [this](https://notabug.org/owl410/owl_dotfiles/src/master/XFCE/xfce_tokio_night/telegram/TokyoNight.tdesktop-theme) file, sand message to telegram, apply sheme
* set [this](https://notabug.org/owl410/owl_dotfiles/src/master/XFCE/xfce_tokio_night/telegram/fon.png) fon to setting
