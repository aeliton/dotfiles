#!/bin/sh

if [ -f $HOME/.Xmodmap ]; then
	/usr/bin/xmodmap $HOME/.Xmodmap
fi

gnome-session
