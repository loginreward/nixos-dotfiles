{ pkgs, ... }:

{
  programs.niri = {
    enable = true;
  };

  services.gnome.gnome-keyring.enable = true;
  security.polkit.enable = true;

  # xdg.portal = {
  #   enable = true;
  #   extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
  #   config.common.default = "gnome";
  # };

  environment.etc."niri/config.kdl".source = ./config.kdl;
}
