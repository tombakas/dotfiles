#!/bin/bash

WORK_INTERVAL=25       # minutes
BREAK_INTERVAL=5       # minutes
LONG_BREAK_INTERVAL=15 # minutes

BOLD=$(tput bold)
NORMAL=$(tput sgr0)
GREEN=$(tput setaf 118)
CYAN=$(tput setaf 87)

break_count=0
long_break=4
min=0
sec=0

trap ctrl_c INT

get_work_interval() {
    echo $((WORK_INTERVAL * 60))
}

get_break_interval() {
    if [ break_count -lt $((long_break)) ]; then
        echo $((BREAK_INTERVAL * 60))
    elif [ $break_count -eq $((long_break)) ]; then
        echo $((LONG_BREAK_INTERVAL * 60))
    fi
}

run_break_timer() {
    break_count=$((break_count + 1))

    for s in $(eval echo {1..$(get_break_interval)}); do
        min=$(( ($(get_break_interval) - $s) / 60 ))
        sec=$(( ($(get_break_interval) - $s) % 60 ))

        clear
        printf "${BOLD}Break timer${NORMAL}\n\n"
        printf "Time till work: %02d:%02d\n" $min $sec

        sleep 1
    done

    break_count=$((break_count % long_break))
    notify-send "Work!"
}

run_work_timer() {
    for s in $(eval echo {1..$(get_work_interval)}); do
        min=$(( ($(get_work_interval) - $s) / 60 ))
        sec=$(( ($(get_work_interval) - $s) % 60 ))

        clear
        printf "${BOLD}Pomodoro timer${NORMAL}\n\n"
        printf "Time till break: ${BOLD}${CYAN}%02d:%02d${NORMAL}\n" $min $sec

        sleep 1
    done

    notify-send "Break!"
}

ctrl_c() {
    clear
    echo -e "${BOLD}Pomodoro timer paused at ${GREEN}$min:$sec${NORMAL}\n"
    echo "[c]ontinue or [q]uit?"

    while [[ "$answer" != "c"  &&  "$answer" != "q" ]]; do
        read -s -n1 answer
    done

    if [ "$answer" == "q" ]; then
        if which tmux; then
            tmux setw automatic-rename
        fi

        exit
    fi

    unset answer
}

rename_pane() {
    if which tmux; then
        tmux rename-window pomodoro;
    fi
}

while true; do
    rename_pane
    run_work_timer
    run_break_timer
done
