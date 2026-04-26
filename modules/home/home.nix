{ config, pkgs, ... }:

{
	home.username = "loginreward";
	home.homeDirectory = "/home/loginreward";

	home.stateVersion = "25.11";

	home.packages = [
	];

    home.pointerCursor = {
        enable = true;
        gtk.enable = true;
        x11.enable = true;
        package = pkgs.banana-cursor;
        name = "Banana";
        size = 24;
        hyprcursor = {
            enable = true;
            size = config.home.pointerCursor.size;
        };
    };

    services.mpd = {
        enable = true;
        musicDirectory = "/home/loginreward/Music/";
        extraConfig = ''
            audio_output {
                type "pipewire"
                    name "My PipeWire Output"
            }
        '';
        dataDir = "/home/loginreward/Music/";
    };

	programs.bash = {
		enable = true;
	};

	programs.zsh = {
		enable = true;
		oh-my-zsh = {
			enable = true;
			theme = "robbyrussell";
			plugins = [ "git" "docker" ];
		};
		shellAliases = {
			nixrs = "sudo nixos-rebuild switch";
			vim = "nvim";
			emacs = "emacs -nw";
		};
	};

    programs.fish = {
        enable = true;
        shellAliases = {
			vim = "nvim";
        };
        shellInit = ''
        fastfetch
        set -U fish_greeting ""
        bind alt-w cdi repaint
        set -g fish_cursor_default block
        set -g fish_cursor_insert block
        set -g fish_cursor_replace_one block
        set -g fish_cursor_replace block
        set -g fish_cursor_external block
        set -g fish_cursor_visual block
        set -g fish_vi_force_cursor 1
        '';
    };

    programs.starship.enable = true;
    programs.starship.enableFishIntegration = true;

    programs.zoxide = {
        enable = true;
        enableFishIntegration = true;
        options = [ "--cmd cd" ];
    };

	programs.fzf = {
		enable = true;
		enableZshIntegration = true;
	};

	programs.git = {
		enable = true;
        settings = {
            user = {
                name = "Zynith0";
                email = "nolan.lessard.music@gmail.com";
            };
        };
	};

	programs.tmux =	{
		enable = true;

		baseIndex = 1;
		prefix = "C-o";

		plugins = with pkgs; [
			tmuxPlugins.catppuccin
		];
		extraConfig = ''
			set -g @catppuccin_flavour "mocha"
			set -g @catppuccin_window_status_style "rounded"
			set -g status-right-length 100
			set -g status-left-length 100
			set -g status-left ""
			set -g status-right "#{E:@catppuccin_status_application}"
			set -agF status-right "#{E:@catppuccin_status_cpu}"
			set -ag status-right "#{E:@catppuccin_status_session}"
			set -ag status-right "#{E:@catppuccin_status_uptime}"
			set -agF status-right "#{E:@catppuccin_status_battery}"
		'';
	};

	home.file = {
	#   ".config/niri".source = ./config/niri;
	  ".config/hypr".source = ../features/hyprland;
	  ".config/nvim".source = ../../config/nvim;
	  ".config/nvim".recursive = true;
	  ".config/waybar".source = ../../config/waybar;
	  ".config/alacritty".source = ../../config/alacritty;
	#   ".config/sway".source = ./config/sway;
	};

	home.sessionVariables = {
		EDITOR = "nvim";
	};

	programs.home-manager.enable = true;
}
