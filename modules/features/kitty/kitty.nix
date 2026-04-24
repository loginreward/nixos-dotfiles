{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = "IosevkaTerm Nerd Font";
    settings = ''
# The basic colors
foreground              #fafff9
background              #000000
selection_foreground    #000000
selection_background    #F5E0DC

# Cursor colors
cursor                  #57e389
cursor_text_color       #000000

# URL underline color when hovering with mouse
url_color               #F5E0DC

# Kitty window border colors
active_border_color     #B4BEFE
inactive_border_color   #6C7086
bell_border_color       #F9E2AF

# OS Window titlebar colors
wayland_titlebar_color system
macos_titlebar_color system

# Tab bar colors
active_tab_foreground   #11111B
active_tab_background   #CBA6F7
inactive_tab_foreground #CDD6F4
inactive_tab_background #181825
tab_bar_background      #11111B

# Colors for marks (marked text in the terminal)
mark1_foreground #1E1E2E
mark1_background #B4BEFE
mark2_foreground #1E1E2E
mark2_background #CBA6F7
mark3_foreground #1E1E2E
mark3_background #74C7EC

# The 16 terminal colors

# black
color0 #000000
color8 #000000

# red
color1 #1fe049
color9 #1fe049

# green
color2  #57e389
color10 #57e389

# yellow
color3  #1fe049
color11 #1fe049

# blue
color4  #57e389
color12 #57e389

# magenta
color5  #159d33
color13 #159d33

# cyan
color6  #57e389
color14 #57e389

# white
color7  #fafff9
color15 #fafff9
    '';
  };
}
