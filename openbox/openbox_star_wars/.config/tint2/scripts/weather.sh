#!/bin/bash
weather=''$(curl -s wttr.in/Novosibirsk?format=%t)''
icon=" "
printf "$icon""$weather"
