{ config, pkgs, pkgs-unstable, ... }:

{
    imports =
        [
        ./hardware-configuration.nix
            ./pkgs.nix
        ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    services.xserver.displayManager.startx.enable = true;

    virtualisation.libvirtd.enable = true;

    systemd.targets.sleep.enable = false;
    systemd.targets.suspend.enable = false;
    systemd.targets.hibernate.enable = false;
    systemd.targets.hybrid-sleep.enable = false;

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
        providers = [ "jellyfin" "hass" "opensubsonic" ];
    };

    services.wyoming.satellite = {
        enable = true;
        user = "zynith";
        group = "users";
        name = "nixos-satellite";
        uri = "tcp://0.0.0.0:10700";

        extraArgs = [
            "--wake-word-name" "hey_jarvis"
            "--wake-word-name" "hey_mycroft"
            "--wake-uri" "tcp://0.0.0.0:10400"
        ];

        vad.enable = false;

        microphone.command = "arecord -q -r 16000 -c 1 -f S16_LE -t raw";
        sound.command = "aplay -q -r 22050 -c 1 -f S16_LE -t raw";

        sounds = {
            awake = "/home/zynith/nixos-dotfiles/modules/hosts/server/voice_assistant/awake_correct_bit.wav";
            done = "/home/zynith/nixos-dotfiles/modules/hosts/server/voice_assistant/done_correct_bit.wav";
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
            "assist_pipeline"
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
            assist_pipeline = {};
            "script ui" = "!include scripts.yaml";
            "scene" = "!include scenes.yaml";
        };
    };

    services.wyoming = {
        faster-whisper.servers."default" = {
            enable = true;
            uri = "tcp://0.0.0.0:10300";
            model = "medium";
            language = "en";
        };

        piper.servers."default" = {
            enable = true;
            uri = "tcp://0.0.0.0:10200";
            voice = "en_US-lessac-medium";
        };

        openwakeword = {
            enable = true;
            uri = "tcp://0.0.0.0:10400";
        };
    };

    services.glance = {
        enable = true;
        openFirewall = true;
        settings = {
            server.host = "0.0.0.0";
            pages = [
            {
                name = "Homelab";
                columns = [
                {
                    size = "full";
                    widgets = [
                    {
                        type = "search";
                        search-engine = "startpage";
                        bangs = [
                        {
                            title = "YouTube";
                            shortcut = "!y";
                            url = "https://www.youtube.com/results?search_query={QUERY}";
                        }
                        {
                            title = "Wikipedia";
                            shortcut = "!w";
                            url = "https://en.wikipedia.org/wiki/{QUERY}";
                        }
                        ];
                    }
                    {
                        type = "calendar";
                    }
                    ];
                }
                ];
            }
            ];
        };
    };

    services.navidrome = {
        enable = true;
        settings = {
            Address = "0.0.0.0";
            MusicFolder = "/navidrome_music";
        };
        openFirewall = true;
    };

    services.nextcloud = {
        enable = true;
        hostName = "0.0.0.0";
        config.adminpassFile = "/etc/nextcloud-admin-pass";
        config.dbtype = "sqlite";
        settings.trusted_domains = [
            "localhost"
            "192.168.0.43"
        ];
    };

    boot.kernelPackages = pkgs.linuxPackages_zen;
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "nixos";
    networking.hosts = {
        "127.0.1.1" = [ "nixos" ];
    };

    hardware.graphics = {
        enable = true;
        enable32Bit = true;
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

    services.openssh = {
        enable = true;
        settings.PasswordAuthentication = true;
    };

    nixpkgs.config.allowUnfree = true;

    networking.firewall.allowedTCPPorts = [ 10200 10300 10400 10700 8123 8096 8095 6600 80 ];
    networking.firewall.allowedUDPPorts = [ 2089 8080 1883 8123 9943 9944 4040 9942 8082 9001 9000 9999 20002 8095 ];

    system.stateVersion = "25.11";
}
