#!/bin/bash 

mem="$(free -m | awk 'NR==2{printf "%s", $3,$2,$3*100/$2 }')"
icon=" "
printf "$icon""$mem"
