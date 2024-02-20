;;;;;                           ;;
;;;;  Org Mode Configuration   ;;;
;;;            - mauzybwy -   ;;;;
;;                           ;;;;;

(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

;; (set-background-color "#fbf8ef")
;; (set-background-color "#2b2b2b")

(let
    ((et-font "EtBembo")
     (bg-dark "#fbf8ef")
     (bg-white "#1c1e1f")
     (comment "#525254")
     ;; (lite-code "#5E2750")
     (lite-code "#1C001E")
     ;; (lite-code "#2b2b2b")
     (doc "#727280")
     (slate "#8FA1B3")
     (gray "#bbb")
     (hidden "#2b2b2b")
     (serif-mono-font "Monospace")
     (sans-mono-font "Monospace Regular"))
  
  (custom-set-faces
   `(org-archived ((t (:foreground "#DCDCCC" :weight bold :height 0.5))))
   `(variable-pitch ((t (:family ,et-font
                                 :height 1.2
        			 : foreground ,bg-dark))))
   `(org-hide ((t (:foreground ,hidden
			       :height 0.7
			       :underline nil))))
   `(org-indent ((t (:inherit (org-hide fixed-pitch)))))
   `(org-document-title ((t (:inherit nil
				      :family et-font
				      :height 1.4
				      :foreground ,bg-dark
				      :underline nil))))
   `(org-document-info ((t (:slant italic
				   :foreground ,bg-dark
				   :height 1.0))))
   `(org-ellipsis ((t (:underline nil
				  :height 0.5
				  :foreground ,bg-dark))))
   `(org-default ((t (:inherit nil
			       :family et-font
			       :height 1.0
			       :weight bold
			       :slant normal
			       :underline nil
			       :foreground ,bg-dark))))
   `(org-level-1 ((t (:inherit nil
			       :family ,et-font
			       :height 1.8
			       :weight bold
			       :slant normal
			       :underline nil
			       :foreground ,bg-dark))))
   `(org-level-2 ((t (:inherit nil
			       :family ,et-font
			       :height 1.5
			       ;; :slant italic
			       :slant normal
			       :weight bold
			       :underline nil
			       :foreground ,bg-dark))))
   `(org-level-3 ((t (:inherit nil
			       :family ,et-font
			       :height 1.3
			       :weight bold
			       :slant italic
			       :underline nil
			       :foreground ,bg-dark))))
   `(org-level-4 ((t (:inherit nil
			       :family ,et-font
			       :height 1.1
			       :weight bold
			       :slant italic
			       :underline nil
			       :foreground ,bg-dark))))
   `(org-level-5 ((t (:inherit nil
			       :family ,et-font
			       :height 1.0
			       :weight bold
			       :slant italic
			       :underline nil
			       :foreground ,bg-dark))))
   `(org-quote ((t (:background nil
				:slant italic))))
   `(org-block ((t (:background ,lite-code
				:height 0.9
				:family ,serif-mono-font
				:foreground ,bg-dark))))
   `(org-meta-line ((t (:background nil
   				    :height 0.6
   				    :family ,serif-mono-font
   				    :foreground ,slate))))

   `(org-block-begin-line ((t (:background "#022"
					   :height 0.6
					   :family ,serif-mono-font
					   :foreground ,slate))))
   `(org-block-end-line ((t (:background "#022"
					   :height 0.6
					   :family ,serif-mono-font
					   :foreground ,slate))))
   `(org-document-info-keyword ((t (:height 0.6
					    :family ,serif-mono-font
					    :foreground ,slate))))
   `(org-link ((t (:foreground ,bg-dark))))
   `(org-special-keyword ((t (:family ,sans-mono-font
				      :height 0.8))))
   `(org-todo ((t (:height 0.6))))
   `(org-done ((t (:height 0.6))))
   ;; `(org-todo ((t (nil))))
   ;; `(org-done ((t (nil))))
   ;; `(org-agenda-current-time ((t (nil))))
   ;; `(org-time-grid ((t (nil))))
   ;; `(org-warning ((t (nil))))
   `(org-date ((t (:family ,sans-mono-font
			   :height 0.8))))
   ;; `(org-agenda-structure ((t (nil))))
   `(org-agenda-date ((t (:inherit variable-pitch
				   :height 1.1))))
   ;; `(org-agenda-date-today ((t (nil))))
   ;; `(org-agenda-date-weekend ((t (nil))))
   ;; `(org-scheduled ((t (nil))))
   ;; `(org-upcoming-deadline ((t (nil))))
   ;; `(org-scheduled-today ((t (nil))))
   ;; `(org-scheduled-previously ((t (nil))))
   ;; `(org-agenda-done ((t (nil))))
   `(org-tag ((t (:foreground ,doc))))
   `(org-table ((t (:family ,serif-mono-font
			    :height 0.9
			    :background ,bg-white))))
   `(org-code ((t (:inherit nil
			    :background ,lite-code
			    :family ,serif-mono-font
			    :foreground ,bg-dark
			    :height 0.7))))
   `(org-src-block-faces ((t (:inherit nil
				       :family ,serif-mono-font
				       :foreground ,comment
				       :height 0.7))))
   `(org-headline-done ((t (:strike-through t
					    :family ,et-font)))))
  )

(require 'org)
(require 'ox)

;; Startup mode hooks
(add-hook 'org-mode-hook 'visual-line-mode)
;; (add-hook 'org-mode-hook 'numbered-org-mode)
(add-hook 'org-mode-hook 'variable-pitch-mode)
(add-hook 'org-mode-hook 'my-set-margins)
(add-hook 'org-mode-hook 'org-bullets-mode)

;;;;
;;; Source Blocks
;;

;; (require 'ob-ipython)
;; (require 'ob-noweb)

(org-babel-do-load-languages
 'org-babel-load-languages '((python . t)))

(org-babel-do-load-languages
 'org-babel-load-languages '((js . t)))

(org-babel-do-load-languages
 'org-babel-load-languages '((shell . t)))

;; (org-babel-do-load-languages
 ;; 'org-babel-load-languages '((noweb . t)))

(setq org-confirm-babel-evaluate nil)   ; don't confirm everytime I want to evaluate

;; Source Block Appearance
;; (defface org-block-begin-line
;;   '((t (:underline "#A7A6AA" :foreground "#ACDCCC" :background "#4f4f4f")))
;;   "Face used for the line delimiting the begin of source blocks.")

;; (defface org-block-background
;;   '((t (:background "#353535")))
;;   "Face used for the source block background.")

;; (defface org-block-end-line
;;   '((t (:overline "#A7A6AA" :foreground "#ACDCCC" :background "#4f4f4f")))
;;   "Face used for the line delimiting the end of source blocks.")

;; display/update images in the buffer after I evaluate
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

;;;;
;;; Tweaks
;;

(defun my-set-margins ()
  "Set margins in current buffer."
  (text-scale-set 1.5)
  (setq left-margin-width 2
	right-margin-width 4
	left-fringe-width 0
        right-fringe-width 0))

(setq org-startup-indented t
      org-bullets-bullet-list '(" ") ;; no bullets, needs org-bullets package
      org-indent-indentation-per-level 2
      org-adapt-indentation nil
      org-ellipsis " ↴ " ;; folding symbol
      org-pretty-entities t
      org-hide-emphasis-markers t
      ;; show actually italicized text instead of /italicized text/
      org-agenda-block-separator ""
      org-fontify-whole-heading-line t
      ;; org-fontify-meta-lines-and-blocks t
      org-fontify-done-headline nil
      org-fontify-quote-and-verse-blocks t
      ;; syntax highlighting in src blocks
      org-src-fontify-natively t
      ; less shitty indentation in src blocks
      org-src-preserve-indentation t
      org-src-tab-acts-natively t
      org-clock-in-switch-to-state "ACTV"
      org-clock-out-switch-to-state "TODO"
      )

;;;;
;;; Org Todo Workflows
;;
(setq org-todo-keywords
      '((sequence "TODO" "ACTV" "BKLG" "REVW" "|"
		  "DONE" "ABRT")))

(setq org-todo-keyword-faces
 '(("ACTV" . "DarkSlateGray1") ("REVW" . "khaki1"))
 )

;;;;
;;; draw.io Org-Mode Integration
;;
(defun org-drawio (diagram-name &optional width)
  (let* ((diagram-root "./org-drawio-diagrams/")
	 (diagram-path-sans-type (concat diagram-root diagram-name))
	 (diagram-path (concat diagram-path-sans-type ".drawio"))
	 (diagram-out (concat diagram-path-sans-type ".png")))
    (shell-command (concat "mkdir " diagram-root))
    (shell-command (concat "drawio -c " diagram-path))
    (if width
	(shell-command (concat "drawio -x " diagram-path " -o " diagram-out " --width " width))
      (shell-command (concat "drawio -x " diagram-path " -o " diagram-out)))
    (org-redisplay-inline-images)
    
    (if width
	(format "#+attr_html: :width %s\n#+attr_latex: :width %s\n%s"
		width width (concat "[[" diagram-out "]]"))
      (concat "[[" diagram-out "]]"))))
    

(defun org-drawio-template (diagram-name)
  (interactive "sName of diagram: ")
  (insert
   (format "
#+BEGIN_SRC elisp :results raw :exports results :cache yes
(org-drawio \"%s\")
#+END_SRC" diagram-name)))

;;;;
;;; Use numbers in place of stars for all org-mode buffers
;;
(require 'cl)
(require 'dash)
(defun org-outline-numbering-overlay ()
  "Put numbered overlays on the headings."
  (interactive)
  (cl-loop for (p lv) in
           (let* ((info (org-combine-plists
                         (org-export--get-export-attributes)
                         (org-export--get-buffer-attributes)
                         (org-export-get-environment)
                         '(:section-numbers t)))                      
                  (tree (org-element-parse-buffer))
                  numberlist)
             (org-export--prune-tree tree info)
             (setq numberlist
                   (org-export--collect-headline-numbering tree info))
             (cl-loop for hl in numberlist
                      collect (cons
                               (org-element-property :begin (car hl))
                               (list (cdr hl)))))
           do
           (let ((ov (make-overlay p (+ (length lv) p))))
             (overlay-put ov 'display (concat (mapconcat 'number-to-string lv ".") ". "))
             (overlay-put ov 'numbered-heading t)
             (overlay-put ov 'face 'default))))

(define-minor-mode numbered-org-mode
  "Minor mode to number org headings."
  :init-value nil
  (if numbered-org-mode
      (progn
	(add-hook 'post-self-insert-hook 'org-outline-numbering-overlay)
	(setq line-spacing 0.1)
	(org-outline-numbering-overlay))
    (ov-clear 'numbered-heading)))


;; (defun my-show-doc-in-frame (buffer options)
;;   ;; Get the frame named 'Help' or create one if such a frame does not exist
;;   (let ((help-frame (select-frame (or (cdr (assoc-string "ORG" (make-frame-names-alist)))
;;                                       (make-frame '((name . "ORG")))))))
;;     ;; This assumes you want to display just one window in the dedicated frame
;;     (set-window-buffer (car (window-list help-frame))  buffer nil)
;;     (set-face-background 'default "#fbf8ef" (window-frame (frame-selected-window)))
;;     (disable-theme zenburn)
;;     (set-cursor-color "#000000")))

;; (add-to-list 'display-buffer-alist (cons "org" (cons #'my-show-doc-in-frame nil)))


;; Create Code Block
(defun org-insert-code-block ()
  (interactive)
  (if (member major-mode '(org-mode))
      (progn
	(insert "#+BEGIN_SRC")
	(newline)
	(newline)
	(insert "#+END_SRC")
	(forward-line -1))
    (message "org-mode is off")))
(add-hook 'org-mode-hook
          (lambda () (local-set-key (kbd "C-c c b") #'org-insert-code-block)))

;; Electric Indent in Code Block
(defun org-electric-indent-code-block ()
  (interactive)
  (if (org-in-src-block-p)
      (let* ((elt (org-element-at-point))
	     (poop (org-element-property :language elt))
	     (lang (intern (if poop poop "poop")))
	     (langs org-babel-load-languages))
	(if (alist-get lang langs)
	    (newline-and-indent)
	  (newline)))
    (newline)))

(add-hook 'org-mode-hook
          (lambda () (local-set-key (kbd "<return>") #'org-electric-indent-code-block)))

;; Tabs for Source Blocks with no language
(add-hook 'org-tab-first-hook
          (lambda ()
            (when (org-in-src-block-p t)
              (let* ((elt (org-element-at-point))
                     (poop (org-element-property :language elt))
		     (lang (intern (if poop poop "poop")))
                     (langs org-babel-load-languages))
                (unless (alist-get lang langs)
                  (insert (make-string 4 ?\s)))))))

(use-package org-roam
  :custom
  (org-roam-directory "/Users/mauzy/Logseq")
  (org-roam-dailies-directory "journals/")
  (org-roam-capture-templates
   '(("d" "default" plain
      "%?" :target
      (file+head "pages/${slug}.org" "#+title: ${title}\n")
      :unnarrowed t))))
