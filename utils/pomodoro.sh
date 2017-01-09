#!/bin/bash

interval=1
pom_stop=0
work_interval=1500
break_interval=300
min=0
sec=0

trap ctrl_c INT

ctrl_c() {
    echo -e "\n\033c\e[1mPomodoro timer paused at \e[92m$min:$sec \e[0m\n"
    echo "[c]ontinue or [q]uit?"

    read answer

    if [ "${answer:0:1}" == "c" ]; then
        pom_stop=0
    elif [ "${answer:0:1}" == "q" ]; then
        pom_stop=1
    fi
}

while [ $pom_stop -ne 1 ]; do

    for s in $(eval echo {1..$work_interval}); do
        if [ $pom_stop -eq 1 ]; then
            break
        fi

        if [ $(($s%$interval)) -eq 0 ] || [ $s -eq 1 ]; then
            min=$((($work_interval-$s) / 60))
            sec=$((($work_interval-$s) % 60))
            echo -ne "\033c\e[1mPomodoro timer\e[0m\n\n" # Clear screen
            printf "Time till break: %02d:%02d\n" $min $sec
        fi
        sleep 1
    done
    
    if [ $pom_stop -eq 0 ]; then notify-send "Break!"; fi

    for s in $(eval echo {1..$break_interval}); do
        if [ $pom_stop -eq 1 ]; then
            break
        fi

        if [ $(($s%$interval)) -eq 0 ] || [ $s -eq 1 ]; then
            min=$((($break_interval-$s) / 60))
            sec=$((($break_interval-$s) % 60))
            printf "\033c\e[1mBreak timer\e[0m\n\n" # Clear screen
            printf "Time till break: %02d:%02d\n" $min $sec
        fi
        sleep 1
    done

    if [ $pom_stop -eq 0 ]; then notify-send "Work!"; fi

done
