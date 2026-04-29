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
	  pyright
	  alvr
	  bluez
	  kdePackages.kdenlive
	  yt-dlp
	  tmux
	  jack2
	  btop
	  nwg-look
	  nemo
	  zsh
	  clang
	  tree-sitter
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
	  wine
	  vulkan-tools
	  protonup-qt
	  playerctl
	  qt6.qtmultimedia
	  qt6.qtwayland
	  kdePackages.qt5compat
	  qmk
	  obsidian
	  pulseaudio
	  element-desktop
	  portaudio
	  cmake
	  sqlite
	  unzip
	  jq
	  bun
	  ly
	  nil
	  fastfetch
	  gh
	  zls
	  zig
	  foot
	  starship
	  rofi
	  librewolf
	  ripgrep
	  libinput
	  alsa-utils
	  fzf
	  zip
	  waybar
	  swww
	  mumble
	  pyright
	  thunderbird
	  polybar
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
      mpc
      gnome-boxes
      niri
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
