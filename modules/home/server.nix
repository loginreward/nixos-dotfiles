{ config, pkgs, ... }:

{
	home.username = "zynith";
	home.homeDirectory = "/home/zynith";

	home.stateVersion = "25.11";

	home.packages = [
	];

    services.mpd = {
        enable = true;
        musicDirectory = "/home/zynith/Music/";

        network.listenAddress = "0.0.0.0";
        network.port = 6600;

        extraConfig = ''
            audio_output {
                type "pipewire"
                name "Wyoming Satellite Pipewire"
                quality     "5.0"
                max_clients "0"

                format "44100:16:2"

                always_on       "yes"         
                tags            "yes"
            }
        '';
    };

	programs.home-manager.enable = true;
}
