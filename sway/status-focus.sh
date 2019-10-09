# The Sway configuration file in ~/.config/sway/config calls this script.

date_formatted="$(date "+%H:%M")"
watson="$(watson status -p)"

echo "$watson "
