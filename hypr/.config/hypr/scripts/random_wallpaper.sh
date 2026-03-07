#!/bin/bash

WALLPAPER_PATH="${HOME}/.config/wallpapers"
random_wallpaper="$(ls ${WALLPAPER_PATH} | shuf -n 1)"
img_path=${WALLPAPER_PATH}/${random_wallpaper}

FPS=60
STEP=255
TYPE="any"


if [ -n $random_wallpaper ]; then
    swww img $img_path --transition-fps $FPS --transition-step $STEP --transition-type $TYPE;
fi

