{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
  };

  environment.etc."hyprland/hyprland.conf".source = ./hyprland.conf;
}
