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

    programs.emacs = {
        enable = true;
        package = pkgs.emacs;
        extraPackages = epkgs: [
            epkgs.evil
            epkgs.ivy
            epkgs.counsel
            epkgs.doom-themes
            epkgs.lsp-mode
            epkgs.lsp-ui
            epkgs.rust-mode
            epkgs.go-mode
            epkgs.company
            epkgs.magit
            epkgs.org-roam
        ];
        extraConfig = ''
        (setq standard-indent 2)
        (setq inhibit-startup-message t)
        (setq visible-bell t)
        (scroll-bar-mode -1)
        (tool-bar-mode -1)
        (tooltip-mode -1)
        (set-fringe-mode 10)
        (menu-bar-mode -1)
        (require 'evil)
        (evil-mode 1)
        (set-face-attribute 'default nil :font "Maple Mono NL NF")
        (load-theme 'doom-gruvbox)
        (ivy-mode 1)
        (keymap-global-set "C-s" #'swiper-isearch)
        (keymap-global-set "C-c C-r" #'ivy-resume)
        (keymap-global-set "<f6>" #'ivy-resume)
        (keymap-global-set "M-x" #'counsel-M-x)
        (keymap-global-set "C-x C-f" #'counsel-find-file)
        (keymap-global-set "C-c g" #'counsel-git)
        (keymap-global-set "C-c j" #'counsel-git-grep)
        (keymap-global-set "C-c k" #'counsel-ag)
        (keymap-global-set "C-x l" #'counsel-locate)
        (require 'lsp-mode)
        (add-hook 'rust-mode-hook #'lsp)
        (add-hook 'go-mode-hook #'lsp)
        (add-hook 'after-init-hook 'global-company-mode)
        '';
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
