(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-source-correlate-method 'synctex)
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t)
 '(custom-safe-themes
   '("624f3b1e86a81d1873b93edc3cce0947f2042bfeebecc480b393ff1e0aa4abfd" "4c7228157ba3a48c288ad8ef83c490b94cb29ef01236205e360c2c4db200bb18" default))
 '(package-selected-packages
   '(treesit-auto counsel-jq fsharp-mode lsp-ui multiple-cursors org-roam flycheck-projectile wgrep-helm wgrep helm-ag lsp-pyright string-inflection sql-indent sqlup-mode elm-mode lsp-rescript rescript-mode yaml-mode csharp-mode auctex async dap-mode json-mode helm-xref which-key company projectile helm-lsp lsp-treemacs lsp-mode nord-theme nano-modeline helm-org exec-path-from-shell dumb-jump swift-mode flycheck-swift3 helm-core helm pylint docker dockerfile-mode company-quickhelp nyan-mode elpy jedi-core arduino-mode arduino-cli-mode writeroom-mode web-mode vlf use-package tide smooth-scrolling scad-mode rjsx-mode rainbow-mode org-plus-contrib org-bullets org ob-ipython magit highlight-indent-guides helm-projectile gdscript-mode fill-column-indicator ein counsel-projectile counsel-etags cmake-mode add-node-modules-path))
 '(safe-local-variable-values '((eval org-content 2)))
 '(swift-mode:basic-offset 2)
 '(warning-suppress-log-types '((lsp-mode) (lsp-mode) (emacs)))
 '(warning-suppress-types '((use-package) (lsp-mode) (emacs))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-date ((t (:inherit variable-pitch :height 1.1))))
 '(org-archived ((t (:foreground "#DCDCCC" :weight bold :height 0.5))))
 '(org-block ((t (:background "#1C001E" :height 0.9 :family "Monospace" :foreground "#fbf8ef"))))
 '(org-block-begin-line ((t (:background "#022" :height 0.6 :family "Monospace" :foreground "#8FA1B3"))))
 '(org-block-end-line ((t (:background "#022" :height 0.6 :family "Monospace" :foreground "#8FA1B3"))))
 '(org-code ((t (:inherit nil :background "#1C001E" :family "Monospace" :foreground "#fbf8ef" :height 0.7))))
 '(org-date ((t (:family "Monospace Regular" :height 0.8))))
 '(org-default ((t (:inherit nil :family et-font :height 1.0 :weight bold :slant normal :underline nil :foreground "#fbf8ef"))))
 '(org-document-info ((t (:slant italic :foreground "#fbf8ef" :height 1.0))))
 '(org-document-info-keyword ((t (:height 0.6 :family "Monospace" :foreground "#8FA1B3"))))
 '(org-document-title ((t (:inherit nil :family et-font :height 1.4 :foreground "#fbf8ef" :underline nil))))
 '(org-done ((t (:height 0.6))))
 '(org-ellipsis ((t (:underline nil :height 0.5 :foreground "#fbf8ef"))))
 '(org-headline-done ((t (:strike-through t :family "EtBembo"))))
 '(org-hide ((t (:foreground "#2b2b2b" :height 0.7 :underline nil))))
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 '(org-level-1 ((t (:inherit nil :family "EtBembo" :height 1.8 :weight bold :slant normal :underline nil :foreground "#fbf8ef"))))
 '(org-level-2 ((t (:inherit nil :family "EtBembo" :height 1.5 :slant normal :weight bold :underline nil :foreground "#fbf8ef"))))
 '(org-level-3 ((t (:inherit nil :family "EtBembo" :height 1.3 :weight bold :slant italic :underline nil :foreground "#fbf8ef"))))
 '(org-level-4 ((t (:inherit nil :family "EtBembo" :height 1.1 :weight bold :slant italic :underline nil :foreground "#fbf8ef"))))
 '(org-level-5 ((t (:inherit nil :family "EtBembo" :height 1.0 :weight bold :slant italic :underline nil :foreground "#fbf8ef"))))
 '(org-link ((t (:foreground "#fbf8ef"))))
 '(org-meta-line ((t (:background nil :height 0.6 :family "Monospace" :foreground "#8FA1B3"))))
 '(org-quote ((t (:background nil :slant italic))))
 '(org-special-keyword ((t (:family "Monospace Regular" :height 0.8))))
 '(org-src-block-faces ((t (:inherit nil :family "Monospace" :foreground "#525254" :height 0.7))))
 '(org-table ((t (:family "Monospace" :height 0.9 :background "#1c1e1f"))))
 '(org-tag ((t (:foreground "#727280"))))
 '(org-todo ((t (:height 0.6))))
 '(variable-pitch ((t (:family "EtBembo" :height 1.2 : foreground "#fbf8ef")))))

(load-file "~/.emacs.d/conf/packages.conf.el")
(load-file "~/.emacs.d/conf/macros.conf.el")
(load-file "~/.emacs.d/conf/general.conf.el")
(load-file "~/.emacs.d/conf/theme.conf.el")
(load-file "~/.emacs.d/conf/lang.conf.el")
(load-file "~/.emacs.d/conf/helm.conf.el")
(load-file "~/.emacs.d/conf/projectile.conf.el")
(load-file "~/.emacs.d/conf/org.conf.el")


(load-file "~/.emacs.d/conf/treesit.conf.el")
;; (load-file "~/.emacs.d/conf/eglot.conf.el")

(load-file "~/.emacs.d/conf/lsp.conf.el")
;; (load-file "~/.emacs.d/conf/webdev.conf.el")

(load-file "~/.emacs.d/conf/latex.conf.el")

