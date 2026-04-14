{ config, pkgs, ... }:

{
	home.username = "loginreward";
	home.homeDirectory = "/home/loginreward";

	home.stateVersion = "25.11";

	home.packages = [
	];

    # home.pointerCursor = {
    #     enable = true;
    #     gtk.enable = true;
    #     # x11.enable = true;
    #     package = pkgs.vanilla-dmz;
    #     name = "Vanilla-DMZ";
    #     size = 32;
    #     # hyprcursor = {
    #     #     enable = true;
    #     #     size = config.home.pointerCursor.size;
    #     # };
    # };

    home.pointerCursor = {
        gtk.enable = true;
        x11.enable = true;
        package = pkgs.vanilla-dmz;
        name = "Vanilla-DMZ";
        size = 24;
        hyprcursor.enable = true;
    };

	programs.bash = {
		enable = true;
		shellAliases = {
			btw = "echo test";
		};
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
		};
	};

	programs.fzf = {
		enable = true;
		enableZshIntegration = true;
	};

	programs.git = {
		enable = true;
		userName = "Zynith0";
		userEmail = "nolan.lessard.music@gmail.com";
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
	  ".config/niri".source = ./config/niri;
	  ".config/hypr".source = ./config/hypr;
	  ".config/nvim".source = ./config/nvim;
	  ".config/nvim".recursive = true;
	  ".config/sway".source = ./config/sway;
	};

	home.sessionVariables = {
		EDITOR = "nvim";
	};

	programs.home-manager.enable = true;
}
