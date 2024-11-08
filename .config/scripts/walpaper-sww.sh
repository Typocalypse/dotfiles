#!/bin/bash
#
selected=$(ls -1 ~/wallpaper | grep "jpg" | rofi -dmenu -p "Wallpapers")

if [ "$selected" ]; then

    echo "Changing theme..."
    wal -q -i ~/wallpaper/$selected
    source "$HOME/.cache/wal/colors.sh"

    # ----------------------------------------------------- 
    # Copy color file to waybar folder
    # ----------------------------------------------------- 
    cp ~/.cache/wal/colors-waybar.css ~/.config/waybar/
    cp $wallpaper ~/.cache/current_wallpaper.jpg   

    newwall=$(echo $wallpaper | sed "s|$HOME/wallpaper/||g")

    # ----------------------------------------------------- 
    # Set the new wallpaper
    # ----------------------------------------------------- 
    swww img $wallpaper --transition-step 20 --transition-fps=20
    ~/.config/waybar/launch.sh

    # ----------------------------------------------------- 
    # Send notification
    # ----------------------------------------------------- 
    notify-send "Theme and Wallpaper updated" "With image $newwall"

    echo "Done."
fi
