wallpaper=$(awww query -j | jq -r '.""[0].displaying.image')
light_or_dark=$(echo -e "light\ndark" | rofi -dmenu)

matugen -m $light_or_dark image $wallpaper --source-color-index 0
