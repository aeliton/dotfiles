XKBMAP="$HOME/.Xkbmap"
XRESOURCES="$HOME/.Xresources"

if [ -e $XKBMAP ]; then
    setxkbmap $(cat $XKBMAP)
fi

if [ -e $XRESOURCES ]; then
    xrdb -merge $XRESOURCES
fi


# dwm stuf
wmname LG3D
xrandr --output VGA1 --auto --primary --output HDMI1 --auto --right-of VGA1

conky | while read REPLY; do xsetroot -name "$REPLY"; done &
exec dwm

#while true; do
#xsetroot -name "$( date +"%F %R" )"
#sleep 1m    # Update time every minute
#done &
