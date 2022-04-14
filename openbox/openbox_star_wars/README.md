### SYSTEM:
* **OS:** Devuan GNU/Linux 4 Chimaera
* **Kernel:** 5.10.0-13-amd64
* **Shell:** bash 5.1.4
* **Resolution:** 1920x1080
* **WM:** Openbox
* **WM Theme:** X-Arc-White
* **Panel:** Tint2
* **Dock:** Plank
* **Theme:** X-Arc-Plus [GTK2/3]
* **Icons:** la-capitaine-icon-theme
* **Terminal:** kitty
* **Terminal Font:** JetBrainsMono-Med


### SOFT:
* **Base soft:** xorg firmware-linux-nonfree libgl1-mesa-dri xserver-xorg-video-ati pulseaudio pavucontrol alsa-utils
* **Openbox soft:** openbox tint2 lxappearance plank numlockx scrot fonts-font-awesome nitrogen obconf picom ntp copyq
* **Graphic soft:** sudo -t chimaera-backports install blender gimp krita inkscape 
* **Multimedia soft:** sudo -t chimaera-backports  firefox-esr telegram-desktop audacious audacity lmms
* **Terminal soft:** cmus ranger neofetch links cmatrix
* **Others soft:** viewnior nemo ark kitty geany

### VIRT-MANAGER:
* sudo apt remove netcat-traditional
* sudo apt install netcat-openbsd
* sudo apt install qemu-kvm qemu-utils virt-manager libvirt-clients libvirt-daemon-system virtinst dnsmasq gir1.2-spiceclientgtk-3.0

### STEAM:
* sudo dpkg --add-architecture i386
* sudo apt update
* sudo apt-get install  libgl1-mesa-dri:i386 libgl1-mesa-glx:i386 libc6:i386
* sudo apt-get -t chimaera-backports install steam

### PLANK
* sudo apt install plank
* add export XDG_SESSION_TYPE=x11 >> .bashrc
* restart xorg

### DESKTOP ICONS
* sudo apt install pcmanfm
* pcmanfm --desktop >> autostart
* pcmanfm --desktop-pref - configure desktop