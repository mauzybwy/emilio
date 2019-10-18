;;;;;                          ;;
;;;;  Theming Configuration   ;;;
;;;           - mauzybwy -   ;;;;
;;                          ;;;;;

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)

(with-eval-after-load "zenburn-theme"
  (zenburn-with-color-variables
    (custom-theme-set-faces
     'zenburn
     ;; original `(default ((t (:foreground ,zenburn-fg :background ,zenburn-bg))))
     `(default ((t (:foreground ,zenburn-fg :background ,zenburn-bg-1))))
     `(variable-pitch ((t (:family "EtBembo" :width expanded)))))))
