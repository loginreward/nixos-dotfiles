{ config, pkgs, ... }:

{
    programs.emacs = {
        enable = true;
        package = pkgs.emacs;
        extraPackages = epkgs: [
            epkgs.evil
            epkgs.ivy
            epkgs.counsel
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
        (setq org-ellipsis " ")
        (setq org-hide-emphasis-markers t)
        (scroll-bar-mode -1)
        (tool-bar-mode -1)
        (tooltip-mode -1)
        (set-fringe-mode 10)
        (menu-bar-mode -1)
        (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
        (define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
        (require 'evil)
        (evil-mode 1)
        (set-face-attribute 'default nil :font "Maple Mono NL NF" :height 140)
        (load-theme 'modus-vivendi t)
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
        (add-hook 'org-mode-hook 'org-indent-mode)
        (setq org-roam-directory "~/OrgNotes")
        (keymap-global-set "C-c n f" #'org-roam-node-find)
        (keymap-global-set "C-c n i" #'org-roam-node-insert)
        (org-roam-db-autosync-mode)
        (org-roam-setup)
        (setq org-rom-completion-everywhere t)
        (recentf-mode 1)
        (setq history-length 25)
        (savehist-mode 1)
        (save-place-mode 1)
        (setq use-dialog-box nil)
        '';
    };
}
