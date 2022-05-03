#!/bin/bash
weather=''$(curl -s wttr.in/Novosibirsk?format=%t)''
printf "$weather"
