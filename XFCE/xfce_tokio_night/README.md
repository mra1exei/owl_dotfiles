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
  
tide configure - что бы конфигурировать тильды  

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
* move theme in ~/.config/xfce4/terminal/colorschemes/
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