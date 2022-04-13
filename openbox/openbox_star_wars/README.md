### SYSTEM:


### SOFT:
**Base soft:** sudo apt install xorg firmware-linux-nonfree libgl1-mesa-dri xserver-xorg-video-ati
openbox tint2 plank obconf lxappearance viewnior kitty nemo ark kitty picom numlockx scrot fonts-font-awesome nitrogen pulseaudio pavucontrol alsa-utils

**Graphic soft:** sudo -t chimaera-backports install blender gimp krita inkscape 

**Multimedia soft:** sudo apt install firefox-esr telegram-desktop audacious audacity lmms

**Terminal soft:** sudo apt install cmus ranger neofetch links cmatrix


### VIRT-MANAGER:
sudo apt remove netcat-traditional
sudo apt install netcat-openbsd
sudo apt install qemu-kvm qemu-utils virt-manager libvirt-clients libvirt-daemon-system virtinst dnsmasq gir1.2-spiceclientgtk-3.0

### STEAM:
sudo dpkg --add-architecture i386
sudo apt update
sudo apt-get install  libgl1-mesa-dri:i386 libgl1-mesa-glx:i386 libc6:i386
sudo apt-get -t chimaera-backports install steam