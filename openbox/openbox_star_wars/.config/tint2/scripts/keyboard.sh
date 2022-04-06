#!/bin/sh
    result=$(xset -q | grep LED)
    code=${t##*mask:  }

    if [[ $code -eq "00000002" ]]; then
            result="EN"
    else
            result="RU"
    fi
icon=" "
printf "$icon""$result"

