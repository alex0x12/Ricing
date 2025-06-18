#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar topbar &
polybar infobar_base &
polybar infobar_cpu &
polybar infobar_gpu &
polybar infobar_memory &
polybar infobar_kernel &
polybar infobar_datetime &
polybar infobar_fs &
polybar equalizerwidget &
polybar bottombar &
polybar bottombar_datetime &
polybar bottombar_lang &
polybar bottombar_cryptowallet &
polybar bottombar_currency &
polybar bottombar_netspeed &
polybar bottombar_ping &
polybar bottombar_weather &

echo "Polybar launched..."
