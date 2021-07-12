sxhkd &

my_laptop_external_monitor=$(xrandr --query | grep 'HDMI1')
if [[ $my_laptop_external_monitor = *connected* ]]; then
    polybar hdmi &
fi

polybar local &

exec bspwm
