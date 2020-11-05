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
     
     ;; Change make the background slightly darker, fix mark region color
     `(default ((t (:foreground ,zenburn-fg :background ,zenburn-bg-1))))
     `(region ((,class (:background ,zenburn-bg+1 :extend t))
	       (t :inverse-video t)))

     ;; For some reason, this is necessary to fix comment highlighting with
     ;; the above fix...
     `(font-lock-comment-delimiter-face ((t (:foreground ,zenburn-green))))

     ;; When using EtBembo, make sure its known as a variable-pitch font
     `(variable-pitch ((t (:family "EtBembo" :width expanded)))))))
