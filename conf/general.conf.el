;;;;;                           ;;
;;;;  General Configuration    ;;;
;;;           - mauzybwy -    ;;;;
;;                           ;;;;;

;;;;
;;;  System Constants
;;
(setq ido-max-directory-size 100000)

;;;;
;;;  General Aesthetics
;;
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(disable-proxy)
(nyan-mode 1)
(add-hook 'eshell-load-hook 'nyan-prompt-enable)
;; (setq-default mode-line-format nil)
(setq-default cursor-type '(bar . 1))

(setq c-default-style "linux"
      c-basic-offset 4)

(defun my-c-setup ()
  (c-set-offset 'innamespace [0]))
(add-hook 'c++-mode-hook 'my-c-setup)

;; (add-to-list 'default-frame-alist
;; 	     '(font . "DejaVu Sans Mono-13"))

;;;;
;;; Save Sessions
;;
(desktop-save-mode 1)

;;;;
;;;  General Editing Settings
;;
(setq-default fill-column 80)

;;;;
;;;  Alarm Bell
;;
(setq visible-bell nil
      ring-bell-function 'flash-mode-line)
(defun flash-mode-line ()
  (invert-face 'mode-line)
  (run-with-timer 0.1 nil #'invert-face 'mode-line))

;;;;
;;;  Backups
;;
(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;;;;
;;; Keybindings
;;
(global-set-key (kbd "M-RET e b") 'eval-buffer)
(global-set-key (kbd "M-RET r b") 'revert-buffer)
(global-set-key (kbd "C-c j") 'previous-multiframe-window)
(global-set-key (kbd "C-c k") 'next-multiframe-window)

;;;;
;;; Search etc.
;;
(use-package swiper
  :bind (("C-s" . swiper)
         ("C-r" . swiper))
  :init
  (setq ivy-height 30))
