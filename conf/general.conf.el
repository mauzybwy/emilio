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

(use-package nyan-mode
  :ensure t
  :init
  (nyan-mode))

(use-package which-key
  :init
  (which-key-mode))

;; (add-hook 'eshell-load-hook 'nyan-prompt-enable)
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
(desktop-save-mode 0)

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
(setq make-backup-files nil) ; stop creating ~ files
;; (setq backup-directory-alist '(("." . "/Users/mauzy/.emacs.d/.saves")))
;; (setq delete-old-versions t
;;   kept-new-versions 6
;;   kept-old-versions 2
;;   version-control t)

;;;;
;;; Keybindings
;;
(global-set-key (kbd "M-RET e b") 'eval-buffer)
(global-set-key (kbd "M-RET r b") 'revert-buffer)
;; (global-set-key (kbd "C-c j") 'previous-multiframe-window)
;; (global-set-key (kbd "C-c k") 'next-multiframe-window)
(global-set-key (kbd "C-c j q") 'counsel-jq)

;;;;
;;; Search etc.
;;
(use-package swiper
  :bind (("C-s" . swiper)
         ("C-r" . swiper))
  :init
  (setq ivy-height 30))

;;;;
;;; Safe local variables
;;
(custom-set-variables
 '(safe-local-variable-values (quote ((eval org-content 2)))))

;;;;
;;; No tabs
;;
(setq-default indent-tabs-mode nil)

;;;;
;;; Smooth Scrolling
;;
(use-package smooth-scrolling
  :init
  (smooth-scrolling-mode 1)
  (setq smooth-scroll-margin 1))

;;;;
;;; PATH
;;
;; (when (memq window-system '(mac ns x))
;;   (exec-path-from-shell-initialize))
(use-package exec-path-from-shell
  :ensure t
  :if (memq window-system '(mac ns x))
  :config
  (setq exec-path-from-shell-variables '("PATH" "HOME"))
  (exec-path-from-shell-initialize))

;; (add-to-list 'exec-path "/opt/homebrew/bin")
;; (add-to-list 'exec-path "/Users/mauzy/.local/bin")
;; (add-to-list 'exec-path "/Users/mauzy/.nvm/versions/node/v16.18.1/bin")
;; (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))


;;;;
;;; Mac
;;
(setq mac-command-modifier 'meta)

;;;;
;;; Jumping
;;
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

;;;;
;;; Grep
;;
(eval-after-load 'grep
  '(progn
     (add-to-list 'grep-find-ignored-directories "tmp")
     (add-to-list 'grep-find-ignored-directories "node_modules")
     (add-to-list 'grep-find-ignored-directories ".bundle")
     (add-to-list 'grep-find-ignored-directories "auto")
     (add-to-list 'grep-find-ignored-directories "elpa")))
(setq wgrep-enable-key (kbd "C-c C-c"))
(add-hook 'grep-mode-hook (lambda () (toggle-truncate-lines 1)))
