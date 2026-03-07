#!/bin/bash

WALLPAPER_PATH="${HOME}/.config/wallpapers"
random_wallpaper="$(ls ${WALLPAPER_PATH} | shuf -n 1)"
img_path=${WALLPAPER_PATH}/${random_wallpaper}

FPS=60
STEP=255
TYPE_LIST="any wipe fade"
TYPE=$(shuf -e ${TYPE_LIST} -n 1)

if [ -n $random_wallpaper ]; then
    swww img $img_path --transition-fps $FPS --transition-step $STEP --transition-type $TYPE;
fi

