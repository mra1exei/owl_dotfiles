#!/usr/bin/bash
 
layout(){
    # Получаем значение LED для текущей раскладки
    # Запустите в терминале, чтобы посмотреть значения для каждой раскладки.
    # Значения в этом примере действительны для раскладки us,ru
    t=$(xset -q | grep LED)
    code=${t##*mask:  }
    if [[ $code -eq "00000002" ]]; then
            result="EN"
    else
            result="RU"
    fi
    echo $result
}


# Вывод даты в формате dd.MM.YYYY HH:MM
fdate(){
    date +"%H:%M"
}


# Текущая громкость
volume(){
    full_str=$(amixer sget Master | grep Left: )
    state=${full_str##*\[}
    if [[ $state == "off]" ]]; then
            echo off
    else
            state=${full_str#*\[}
            echo ${state%%\]*}
    fi
}
 

# генерируем строку для статусбара и украшаем ее с помощью эмодзи
generate_content(){
        echo "  |  VOL $(volume)  |  $(layout)  |  $(fdate)  |  "
}
 

# Выводим и обновляем статусбар раз в минуту
while true; do
    xsetroot -name "$(generate_content)"
    sleep 0,1m
done
