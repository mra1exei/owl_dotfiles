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
 
Download font [JetBrainsMono ](https://download.jetbrains.com/fonts/JetBrainsMono-2.242.zip?_gl=1*x4bu9c*_ga*MjAyOTUyMTMxMy4xNjcwOTM4NDY4*_ga_9J976DJZ68*MTY3MDkzODQ2OC4xLjAuMTY3MDkzODQ2OC4wLjAuMA..&_ga=2.32591222.957622972.1670938469-2029521313.1670938468)  
mkdir ~/.fonts  
copy & unzip all fonts files in ~/.fonts
sudo pacman -S awesome-terminal-fonts
  
## Install fish shell
 
sudo pacman -S fish  
fish  
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher  
fisher install jorgebucaran/nvm.fish  
fisher install IlanCosman/tide@v5  
chsh -s /usr/bin/fish  
set -U fish_greeting  
  
tide configure - что бы конфигурировать тильды