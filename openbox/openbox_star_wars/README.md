### SOFT
Distr: Devuan chimaera
Base soft: sudo apt install xorg firmware-linux-nonfree libgl1-mesa-dri xserver-xorg-video-ati
WM: openbox sudo apt install tint2 plank obconf lxappearance viewnior kitty nemo ark kitty picom numlockx scrot fonts-font-awesome nitrogen
Graphic soft: sudo -t chimaera-backports install blender gimp krita inkscape 
Multimedia soft: firefox-esr telegram-desktop

### VIDEO
install 

### VIRT-MANAGER
sudo apt remove netcat-traditional
sudo apt install netcat-openbsd
sudo apt install qemu-kvm qemu-utils virt-manager libvirt-clients libvirt-daemon-system virtinst dnsmasq gir1.2-spiceclientgtk-3.0

### STEAM
sudo dpkg --add-architecture i386
sudo apt update
sudo apt-get install  libgl1-mesa-dri:i386 libgl1-mesa-glx:i386 libc6:i386
sudo apt-get -t chimaera-backports install steam