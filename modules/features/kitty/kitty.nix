{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
        shell_integration = "disabled";
        font_family = "IosevkaTerm Nerd Font";
        font_size = "16";
        background = "#000000";
        foreground = "#fafff9";
        selection_foreground = "#000000";
        selection_background = "#F5E0DC";
        cursor = "#57e389";
        cursor_text_color = "#000000";
        color0 = "#000000";
        color8 = "#000000";
        color1 = "#1fe049";
        color9 = "#1fe049";
        color2 = "#57e389";
        color10 = "#57e389";
        color3 = "#1fe049";
        color11 = "#1fe049";
        color4 = "#57e389";
        color12 = "#57e389";
        color5 = "#159d33";
        color13 = "#159d33";
        color6 = "#57e389";
        color14 = "#57e389";
        color7 = "#fafff9";
        color15 = "#fafff9";
        background_opacity = "0.8";
    };
# # Kitty window border colors
# active_border_color     #B4BEFE
# inactive_border_color   #6C7086
# bell_border_color       #F9E2AF
# # Tab bar colors
# active_tab_foreground   #11111B
# active_tab_background   #CBA6F7
# inactive_tab_foreground #CDD6F4
# inactive_tab_background #181825
# tab_bar_background      #11111B
# # The 16 terminal colors
  };
}
