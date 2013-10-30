#!/bin/sh

setxkbmap us -option compose:ralt

if [ -f $HOME/.Xmodmap ]; then
	/usr/bin/xmodmap $HOME/.Xmodmap
fi

gnome-session
