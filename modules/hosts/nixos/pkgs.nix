{ config, pkgs, pkgs-unstable, ... }:

{
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
}
