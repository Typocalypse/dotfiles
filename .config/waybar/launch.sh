killall waybar

if [[ $USER = "dip-esh" ]]
then
    waybar -c ~/.config/waybar/config.jsonc &
else
    waybar &
fi
