{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    # config.common.default = "gnome";
  };

  environment.etc."hyprland/hyprland.conf".source = ./hyprland.conf;
}
