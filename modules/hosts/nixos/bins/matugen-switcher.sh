wallpaper=$(ls $HOME/wallpapers | rofi -dmenu)

matugen image $HOME/wallpapers/$wallpaper --source-color-index 0
