
![](https://notabug.org/owl410/owl_dotfiles/raw/master/openbox/openbox_star_wars/img/2022-05-02-154718_1920x1080_scrot.png)  
### SOFT:
* **Base soft:** xorg firmware-linux-nonfree libgl1-mesa-dri xserver-xorg-video-ati pulseaudio pavucontrol alsa-utils ntfs-3g
* **Openbox soft:** openbox tint2 lxappearance plank numlockx scrot fonts-font-awesome nitrogen obconf picom ntp copyq rofi dunst flameshot udiskie pcmanfm gsimplecal
* **Graphic soft:** blender gimp krita inkscape 
* **Multimedia soft:** firefox telegram-desktop audacious audacity lmms obs-studio simplescreenrecorder
* **Terminal soft:** cmus ranger neofetch links cmatrix
* **Others soft:** viewnior nemo ark kitty geany mpv scrot virt-manager steam 
### PLANK: 
* copy theme folder in ~/.local/share/plank
### DUNST: 
* mkdir ~/.config/dunst && cp /etk/xdg/dunst/dunstrc ~/.config/dunst
* test: dunstify -h string:x-dunst-stack-tag:test Audacity -A 'tested,default' -i /home/owl/.icons/la-capitaine-icon-theme/apps/scalable/audacity.svg
### DESKTOP ICONS:
* pcmanfm --desktop >> autostart
* pcmanfm --desktop-pref - configure desktop
### MOUNT USB DRIVE:
* sudo pacman -S udiskie
* add udiskie -a  -n -t & >> autostart  
### ROFI:
* rofi -show drun -modi "Files":"~/.config/rofi/rofi-file-browser.sh" - start rofi whitch ffile-browser
* for powermenu add "~/.config/rofi/powermenu" >> tint2 button 
### TINT2:
* add ~/.config/tint2/scripts/script.sh >> executor
* keyboard layout: xset -q|grep Group\ 2|awk {'print $4'}|sed 's/on/ RU/g;s/off/ EN/g' >> executor
* add "/usr/bin/nitrogen --set-zoom-fill --random /home/owl/.wallpaper/ --save" for wallpaper randomize
* add "/usr/bin/nitrogen --set-zoom-fill --random /home/owl/.wallpaper/ --save && pcmanfm --desktop" for save desktop icon 
### OPENBOX:
```
<menu id="apps-Mult-menu" label="Multimedia" icon='~/.config/openbox/icons/icon.svg'>
    <separator label="Multimedia apps" />
        <item label="Audacious" icon='~/.config/openbox/icons/audacious.svg'>
            <action name="Execute">
            <command>audacious</command>
        </action>
    </item>
</menu>
```
```
<application name="nemo">
     <position force="yes">
         <x>410</x>
         <y>90</y>
     </position>
 <size>
     <width>20%</width>
     <height>40%</height>
 </size>
     <focus>yes</focus>
         <desktop>3</desktop>
     <fullscreen>no</fullscreen>
 </application>
 ```
 ### KEYBOARD:
sudo nano /etc/X11/xorg.conf.d/00-keyboard.conf`
```
Section "InputClass"
        Identifier "system-keyboard"
        MatchIsKeyboard "on"
        Option "XkbLayout" "us,ru"
        Option "XkbModel" "pc105"
        Option "XkbOptions" "grp:alt_shift_toggle"
EndSection
```
  [Wallpapers](https://unsplash.com/collections/91828652/wallpaper) [Telegram](https://t.me/prolinux_tg)
