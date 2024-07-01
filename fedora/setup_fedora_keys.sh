# To see all keys, use `localectl list-x11-keymap-options`

gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:swapcaps']"

# make sure to restart the Gnome Shell once you're done with all the script parts
# gnome-session-quit --logout
