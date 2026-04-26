{ config, pkgs, pkgs-unstable, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../features/niri/niri.nix
      ../../features/hyprland/hyprland.nix
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

  programs.java = {
      enable = true;
  };

  services.emacs.enable = true;

  services.hardware.openrgb.enable = true;

  services.music-assistant = {
      enable = true;
      providers = [ "jellyfin" "hass" ];
  };

  services.xserver.videoDrivers = [ "amdgpu" ];

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
	  ];
	  config = {
          homeassistant = {
              media_dirs = {
                  "local" = "/var/lib/hass/media";
              };
          };
		  default_config = {};
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

  services.wivrn = {
	  enable = true;
	  openFirewall = true;
	  # defaultRuntime = true;
	  autoStart = true;

# If you're running this with an nVidia GPU and want to use GPU Encoding (and don't otherwise have CUDA enabled system wide), you need to override the cudaSupport variable.
# package = (pkgs.wivrn.override { cudaSupport = true; });

# You should use the default configuration (which is no configuration), as that works the best out of the box.
# However, if you need to configure something see https://github.com/WiVRn/WiVRn/blob/master/docs/configuration.md for configuration options and https://mynixos.com/nixpkgs/option/services.wivrn.config.json for an example configuration.
  };


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
  users.users.loginreward = {
    isNormalUser = true;
    description = "Zynith";
    extraGroups = [ "networkmanager" "wheel" "input" "wireshark" "docker" "dialout" "uucp" "libvirtd" "kvm" ];
    shell = pkgs.fish;
  };

  services.jellyfin = {
  	enable = true;
	openFirewall = true;
  };

  programs.firefox.enable = true;

  programs.wireshark.enable = true;
  
  environment.variables = {
		RUSTICL_ENABLE = "radeonsi";
  };

  programs.hyprland.enable = true;
  services.xserver.windowManager.xmonad.enable = true;

  xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
  };
  
  programs.sway.enable = true;

  programs.niri.enable = true;

  programs.steam.enable = true;

  programs.fish.enable = true;
  # programs.zsh.enable = true;
  programs.zsh = {
      enable = true;
      interactiveShellInit = ''
          fastfetch
      '';
  };

  programs.alvr.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = 
  	(with pkgs; [
	  vim
	  hyprland
	  hyprshot
	  discord
	  matugen
	  kitty
	  git
	  ghostty
	  swww
	  quickshell
	  nerd-fonts.jetbrains-mono
	  nerd-fonts._3270
	  nerd-fonts.roboto-mono
      nerd-fonts.recursive-mono
      nerd-fonts.space-mono
      nerd-fonts.iosevka
      nerd-fonts.iosevka-term
      maple-mono.NL-NF
	  reaper
	  pavucontrol
	  fish
	  obs-studio
	  krita
	  cargo
	  rust-analyzer
	  rustc
	  mpv
	  fd
	  prismlauncher
	  jre21_minimal
	  go
	  gopls
	  gcc
	  python313Packages.python
	  python313Packages.evdev
	  python313Packages.pygame
	  python313Packages.pygame-gui
	  pyright
	  alvr
	  bluez
	  kdePackages.kdenlive
	  yt-dlp
	  tmux
	  jack2
	  btop
	  feishin
	  jellyfin
	  jellyfin-web
	  jellyfin-ffmpeg
	  apple-cursor
	  nwg-look
	  brave
	  nemo
	  zsh
	  oh-my-zsh
	  bibata-cursors
	  clang
	  tree-sitter
	  everforest-gtk-theme
	  fzf
	  harper
	  blueberry
	  nodejs_24
	  astro-language-server
	  tailwindcss-language-server
	  gleam
	  hyprpicker
	  wl-clipboard
	  unrar
	  goverlay
	  android-tools
	  openssl_3
	  openvr
	  nmap
	  wireshark
	  lutris
	  heroic
	  wine
	  vulkan-tools
	  protonup-qt
	  godot
	  playerctl
	  qt6.qtmultimedia
	  qt6.qtwayland
	  kdePackages.qt5compat
	  qmk
	  dos2unix
	  mpvpaper
	  obsidian
	  pulseaudio
	  element-desktop
	  portaudio
	  freecad
	  cmake
  	  orca-slicer
	  plasticity
	  pkg-config
	  sqlite
	  zed-editor
	  vicinae
	  unzip
	  jq
	  bun
	  ly
	  nil
	  fastfetch
	  gh
	  zls
	  zig
	  # sdrpp
	  chirp
	  catppuccin-kde
	  foot
	  nushell
	  starship
	  sway
	  flameshot
	  rofi
	  i2pd
	  librewolf
	  ripgrep
	  libinput
	  alsa-utils
	  deadbeef
	  fzf
	  zip
	  mosquitto
	  vanilla-dmz
	  sxhkd
	  bspwm
	  picom
	  golangci-lint
	  waybar
	  swww
	  mumble
	  gruvbox-gtk-theme
	  gruvbox-plus-icons
	  openai-whisper
	  pyright
	  gnome-boxes
	  ncmpcpp
	  espeak
	  thunderbird
	  polybar
	  xwayland-satellite
      zoxide
      gnupg
      swaynotificationcenter
      odin
      jdt-language-server
      (pkgs.stdenv.mkDerivation {
       name = "jvrun";
       src = ./bins;
       dontUnpack = true;
       dontBuild = true;
       installPhase = ''
           mkdir -p $out/bin
           cp $src/jvrun $out/bin/jvrun
           chmod +x $out/bin/jvrun
       '';
       })
      (pkgs.stdenv.mkDerivation {
       name = "mvnit";
       src = ./bins;
       dontUnpack = true;
       dontBuild = true;
       installPhase = ''
           mkdir -p $out/bin
           cp $src/mvnit $out/bin/mvnit
           chmod +x $out/bin/mvnit
       '';
       })
      inkscape
      cmatrix
      maven
      clang-tools
      clang
      gnumake
      rmpc
      picard
      alacritty
      lazygit
  ])

  ++

  (with pkgs-unstable; [
	  noctalia-shell
	  dms-shell
	  neovim
	  ollama-vulkan
  ]);

  fonts.packages = with pkgs; [
	  monocraft
	  nerd-fonts._3270
  ];

  networking.firewall.allowedTCPPorts = [ 2089 8080 1883 8123 9943 9944 4040 9942 8082 9001 9000 ];
  networking.firewall.allowedUDPPorts = [ 2089 8080 1883 8123 9943 9944 4040 9942 8082 9001 9000 9999 20002 ];
  networking.firewall.allowedTCPPortRanges = [ 
	  { from = 8000; to = 8010; } 
  ];
  # networking.firewall.enable = false;

  system.stateVersion = "25.11";
}
