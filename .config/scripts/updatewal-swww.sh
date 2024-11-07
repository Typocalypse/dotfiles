wal -q -i ~/wallpaper/

source "$HOME/.cache/wal/colors.sh"

cp ~/.cache/wal/colors-waybar.css ~/.config/waybar/
cp $wallpaper ~/.cache/current_wallpaper.jpg

newwall=$(echo $wallpaper | sed "s|$HOME/wallpaper/||g")

swww img $wallpaper --transition-step 20 --transition-fps=20
~/.config/waybar/launch.sh

notify-send "Theme and Wallpaper updated" "With image $newwall"

echo "DONE!"
