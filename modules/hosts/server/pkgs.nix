{ config, pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = 
  	(with pkgs; [
        git
        wyoming-satellite
        yt-dlp
        nvim
    ])

  ++

  (with pkgs-unstable; [
  ]);
}
