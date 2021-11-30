#!/bin/sh

# A dwm_bar function that displays the current keyboard layout
# Joe Standring <git@joestandring.com>
# GNU GPLv3

# Dependencies: xorg-setxkbmap

dwm_keyboard () {
    t=$(xset -q | grep LED)
    code=${t##*mask:  }


    if [[ $code -eq "00000002" ]]; then
            result="EN"
    else
            result="RU"
    fi
icon=""
printf " ^c#e4b371^ %s %s \\n"  "$icon" "$result"
}

dwm_keyboard
