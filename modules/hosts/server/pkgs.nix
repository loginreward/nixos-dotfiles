{ config, pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = 
  	(with pkgs; [
        git
        wyoming-satellite
        yt-dlp
        neovim
    ])

  ++

  (with pkgs-unstable; [
  ]);
}
