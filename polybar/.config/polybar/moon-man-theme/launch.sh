#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

dir="~/.config/polybar/moon-man-theme"
# Launch Polybar, using default config location ~/.config/polybar/config
for m in $(xrandr --listmonitors | sed -n '/: +/p' | cut -d ' ' -f 6); do
    case $m in
        "DisplayPort-0")
            MONITOR=$m polybar --reload main --config=$dir/config.ini &
            ;;
        "DisplayPort-1")
            MONITOR=$m polybar --reload extended --config=$dir/config.ini &
            ;;

        *)
            ;;
    esac
done

echo "Polybar launched..."
