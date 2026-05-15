{ config, pkgs, pkgs-unstable, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./pkgs.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  home-manager.backupFileExtension = "backup";

  services.xserver.displayManager.startx.enable = true;

  virtualisation.libvirtd.enable = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
	  wayland
	  wayland-protocols
	  expat
	  fontconfig
	  freetype
	  freetype.dev
	  libGL
	  pkg-config
	  xorg.libX11
	  xorg.libXcursor
	  xorg.libXi
	  xorg.libXrandr
	  libxkbcommon
  ];

  services.music-assistant = {
      enable = true;
      providers = [ "jellyfin" "hass" ];
  };

  services.xserver.videoDrivers = [ "amdgpu" ];

  services.wyoming.satellite = {
      enable = true;
      user = "server";
      group = "users";

      microphone = {
          command = "arecord -r 16000 -c 1 -f S16_LE -t raw";
          autoGain = 5;
          noiseSuppression = 2;
      };

      sound = {
          command = "aplay -r 22050 -c 1 -f S16_LE -t raw";
      };
  };

  services.home-assistant = {
	  enable = true;
	  extraComponents = [
		  "analytics"
		  "google_translate"
		  "met"
		  "radio_browser"
		  "shopping_list"
		  "isal"
          "tplink"
          "ollama"
          "cast"
          "mpd"
          "open_meteo"
          "automation"
          "scene"
          "script"
          "music_assistant"
          "media_player"
          "assistant_pipeline"
          "whisper"
          "piper"
          "wake_word"
          "wyoming"
	  ];
	  config = {
          homeassistant = {
              media_dirs = {
                  "local" = "/var/lib/hass/media";
              };
          };
		  default_config = {};
          assistant_pipeline = {};
          "script ui" = "!include scripts.yaml";
          "scene" = "!include scenes.yaml";
	  };
  };

  # services.mosquitto = {
  #     enable = true;
  #     listeners = [{
  #         address = "192.168.0.67";
  #         port = 1883;
  #         users.iotdevice = {
  #             acl = [
  #                 "read IoT/device/action"
  #                 "write IoT/device/observations"
  #                 "write IoT/device/LW"
  #             ];
  #             password = "2548";
  #         };
  #     }];
  # };

  virtualisation.docker = {
	  enable = true;

	  daemon.settings = {
		  dns = [ "1.1.1.1" "8.8.8.8" ];
	  };
  };

#   virtualisation.oci-containers = {
# 	  backend = "podman";
# 	  containers.homeassistant = {
# 		  volumes = [ "home-assistant:/config" ];
# 		  environment.TZ = "Europe/Berlin";
# 		  image = "ghcr.io/home-assistant/home-assistant:stable";
# 		  extraOptions = [ 
# 			  "--network=host"
# # Pass devices into the container, so Home Assistant can discover and make use of them
# 			  # "--device=/dev/ttyACM0:/dev/ttyACM0"
# 		  ];
# 	  };
#   };

  services.i2pd = {
  	enable = true;
	address = "127.0.0.1";
	proto = {
		http.enable = true;
		socksProxy.enable = true;
		httpProxy.enable = true;
	};
  };

  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.hosts = {
  	"127.0.1.1" = [ "nixos" ];
  };
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  hardware.graphics = {
  	enable = true;
	enable32Bit = true;
	extraPackages = with pkgs; [
		mesa
	];
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.settings.General.Experimental = true;

  services.udev.packages = [
	pkgs.qmk-udev-rules
  ];

  networking.networkmanager.enable = true;

  time.timeZone = "America/Toronto";

  i18n.defaultLocale = "en_CA.UTF-8";

  services.xserver.enable = true;

  services.displayManager.ly.enable = true;

  services.desktopManager.plasma6.enable = true;

  console.keyMap = "us";

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zynith = {
    isNormalUser = true;
    description = "Zynith";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };

  services.jellyfin = {
  	enable = true;
	openFirewall = true;
  };

  programs.firefox.enable = true;

  environment.variables = {
		RUSTICL_ENABLE = "radeonsi";
  };

  
  programs.sway.enable = true;

  programs.fish.enable = true;
  # programs.zsh.enable = true;

  nixpkgs.config.allowUnfree = true;

  networking.firewall.allowedTCPPorts = [ 10200 10300 10400 10700 8123 8096 ];
  # networking.firewall.allowedUDPPorts = [ 2089 8080 1883 8123 9943 9944 4040 9942 8082 9001 9000 9999 20002 ];
  # networking.firewall.allowedTCPPortRanges = [ 
  #  { from = 8000; to = 8010; } 
  # ];
  # networking.firewall.enable = false;

  system.stateVersion = "25.11";
}
