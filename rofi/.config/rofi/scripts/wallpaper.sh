#!/bin/zsh

WALLPAPER_DIR=${HOME}/.config/wallpapers
HYPRPAPER_PATH=${HOME}/.config/hypr/hyprpaper.conf
EXTENSION1="png"
EXTENSION2="jpg"

WALLPAPER_NAME=($(find $WALLPAPER_DIR -type f \( -name "*.${EXTENSION1}" -o -name "*.${EXTENSION2}" \)))

paper=($(for wallpaper in $WALLPAPER_NAME; do \
    name=($(echo $wallpaper | awk -F '/' '{print $NF}')); \
    echo -en "$name\0icon\x1f$wallpaper\n"; \
done | rofi -dmenu -p "Select wallpaper"))

paper_path=$WALLPAPER_DIR/$paper

FPS=60
STEP=255
#TYPE_LIST="any\nwipe\nfade\nwave\ngrow\nouter\n"
#TYPE=($(echo $TYPE_LIST | shuf -n 1))
TYPE="any"

#MONITOR=($(xrandr | grep connected | awk '{print $1}' | rofi -dmenu -p "Select monitor"))
#echo $MONITOR

if [ -n $paper ]; then
    awww img $paper_path --transition-fps $FPS --transition-step $STEP --transition-type $TYPE;
    old=($(grep "path" $HYPRPAPER_PATH))
    new="path = $paper_path" 
    sed -i "s|$old|$new|g" $HYPRPAPER_PATH
fi
