# remmaping capslock to escape
if [ -s ~/.xmodmap ]; then
    xmodmap ~/.xmodmap
fi

# to auto-hide mouse
unclutter -idle 1 -jitter 2 -root &
