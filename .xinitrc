# This can be also .xprofile for lightdm/gdm use

XKBMAP="$HOME/.Xkbmap"
XRESOURCES="$HOME/.Xresources"

if [ -e $XKBMAP ]; then
    setxkbmap $(cat $XKBMAP)
fi

if [ -e $XRESOURCES ]; then
    xrdb -merge $XRESOURCES
fi

setxkbmap -option ctrl:nocaps
setxkbmap us -option compose:ralt

# dwm stuf
wmname LG3D
#xrandr --output VGA1 --auto --primary --output HDMI1 --auto --right-of VGA1
xrandr --output eDP1 --mode 1920x1200

# dwm status bar
# requires the file .conkyrc and packages 'conky' and 'acpi'
conky | while read REPLY; do xsetroot -name "$REPLY::$(acpi -b)"; done &
exec dwm

#while true; do
#xsetroot -name "$( date +"%F %R" )"
#sleep 1m    # Update time every minute
#done &
#xrandr --output eDP1 --mode 1680x1050
#xrandr --output eDP1 --mode 1920x1200
#exec dwm
#gnome-session
