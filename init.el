(load-file "~/.emacs.d/conf/packages.conf.el")
(load-file "~/.emacs.d/conf/macros.conf.el")
(load-file "~/.emacs.d/conf/general.conf.el")
(load-file "~/.emacs.d/conf/theme.conf.el")
(load-file "~/.emacs.d/conf/org.conf.el")
(load-file "~/.emacs.d/conf/helm.conf.el")
(load-file "~/.emacs.d/conf/projectile.conf.el")
(load-file "~/.emacs.d/conf/webdev.conf.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (add-node-modules-path company tide counsel-etags counsel-projectile helm-projectile projectile writeroom-mode web-mode use-package swiper scad-mode rjsx-mode org-plus-contrib org ob-ipython nyan-mode magit helm fill-column-indicator ein cmake-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-date ((t (:inherit variable-pitch :height 1.1))))
 '(org-block ((t (:background "#1c1e1f" :height 0.9 :family "Monospace" :foreground "#fbf8ef"))))
 '(org-block-end-line ((t (:background nil :height 0.8 :family "Monospace" :foreground "#8FA1B3"))))
 '(org-code ((t (:inherit nil :family "Monospace" :foreground "#525254" :height 0.9))))
 '(org-date ((t (:family "Monospace Regular" :height 0.8))))
 '(org-default ((t (:inherit nil :family et-font :height 1.0 :weight bold :slant normal :foreground "#fbf8ef"))))
 '(org-document-info ((t (:slant italic :height 1.2))))
 '(org-document-info-keyword ((t (:height 0.8 :foreground "#bbb"))))
 '(org-document-title ((t (:inherit nil :family et-font :height 1.8 :foreground "#fbf8ef" :underline nil))))
 '(org-ellipsis ((t (:underline nil :height 0.7 :foreground "#fbf8ef"))))
 '(org-headline-done ((t (:strike-through t :family "EtBembo"))))
 '(org-hide ((t (:foreground "#1c1e1f" :height 0.7))))
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 '(org-level-1 ((t (:inherit nil :family "EtBembo" :height 1.6 :weight bold :slant normal :foreground "#fbf8ef"))))
 '(org-level-2 ((t (:inherit nil :family "EtBembo" :height 1.3 :weight bold :slant italic :foreground "#fbf8ef"))))
 '(org-level-3 ((t (:inherit nil :family "EtBembo" :height 1.2 :weight bold :slant italic :foreground "#fbf8ef"))))
 '(org-level-4 ((t (:inherit nil :family "EtBembo" :height 1.1 :weight bold :slant italic :foreground "#fbf8ef"))))
 '(org-level-5 ((t (:inherit nil :family "EtBembo" :height 1.0 :weight bold :slant italic :foreground "#fbf8ef"))))
 '(org-link ((t (:foreground "#fbf8ef"))))
 '(org-meta-line ((t (:background nil :height 0.8 :family "Monospace" :foreground "#8FA1B3"))))
 '(org-special-keyword ((t (:family "Monospace Regular" :height 0.8))))
 '(org-src-block-faces ((t (:inherit nil :family "Monospace" :foreground "#525254" :height 0.9))))
 '(org-table ((t (:family "Monospace" :height 0.9 :background "#1c1e1f"))))
 '(org-tag ((t (:foreground "#727280"))))
 '(tide-hl-identifier-face ((t (:inherit tide :background "dim gray" :weight bold))))
 '(variable-pitch ((t (:family et-font : foreground "#fbf8ef"))))
 '(web-mode-current-element-highlight-face ((t nil))))
