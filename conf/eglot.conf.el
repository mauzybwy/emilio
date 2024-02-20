;;; eglot.conf.el --- eglot config
;;; Commentary:
;;; Code:

;; (use-package eglot
;;   :ensure t
;;   :hook ((( clojure-mode clojurec-mode clojurescript-mode
;;             java-mode scala-mode)
;;           . eglot-ensure)
;;          ((cider-mode eglot-managed-mode) . eglot-disable-in-cider))
;;   :preface
;;   (defun eglot-disable-in-cider ()
;;     (when (eglot-managed-p)
;;       (if (bound-and-true-p cider-mode)
;;           (progn
;;             (remove-hook 'completion-at-point-functions 'eglot-completion-at-point t)
;;             (remove-hook 'xref-backend-functions 'eglot-xref-backend t))
;;         (add-hook 'completion-at-point-functions 'eglot-completion-at-point nil t)
;;         (add-hook 'xref-backend-functions 'eglot-xref-backend nil t))))
;;   :custom
;;   (eglot-autoshutdown t)
;;   (eglot-events-buffer-size 0)
;;   (eglot-extend-to-xref nil)
;;   (eglot-ignored-server-capabilities
;;    '(:hoverProvider
;;      :documentHighlightProvider
;;      :documentFormattingProvider
;;      :documentRangeFormattingProvider
;;      :documentOnTypeFormattingProvider
;;      :colorProvider
;;      :foldingRangeProvider))
;;   (eglot-stay-out-of '(yasnippet)))


(use-package
  flymake
  :demand)

(use-package flycheck
  :init
  (setq
   flycheck-javascript-eslint-executable "eslint_d")
  :config
  (global-flycheck-mode 1))

(use-package
  eglot
  :demand
  :hook
  ((js-ts-mode . eglot-ensure)
   (tsx-mode . eglot-ensure)
   (tsx-ts-mode . eglot-ensure)
   (typescript-ts-mode . eglot-ensure))

  :bind
  (:map eglot-mode-map)

  :init
  ;; (setq eglot-autoshutdown t) ; Optional: Automatically shutdown eglot when the last window displaying its buffer is closed.
  ;; (remove-hook 'eglot-managed-mode-hook #'eglot--load-corfu)
  ;; (setq completion-at-point-functions #'eglot-completion-at-point)
  (add-to-list
   'eglot-server-programs
   '((tsx-mode)
     "typescript-language-server" "--stdio"
     :initializationOptions
     (:preferences
      (:includeInlayParameterNameHints
       "all"
       :includeInlayParameterNameHintsWhenArgumentMatchesName t
       :includeInlayFunctionParameterTypeHints t
       :includeInlayVariableTypeHintsWhenTypeMatchesName t
       :includeInlayPropertyDeclarationTypeHints t
       :includeInlayFunctionLikeReturnTypeHints t
       :includeInlayEnumMemberValueHints nil
       )))))


(use-package company
  :hook (prog-mode . company-mode)
  :straight t
  :config
  (setq company-idle-delay 0.0
        company-minimum-prefix-length 1))

;; (use-package
;;   corfu-terminal
;;   :straight '(corfu-terminal :type git :repo "https://codeberg.org/akib/emacs-corfu-terminal.git")
;;   ;; :custom
;;   ;; (corfu-auto t)
;;   :config
;;   (global-corfu-mode))


;; (use-package
;;   corfu
;;   :straight t
;;   :custom
;;   (corfu-auto t)
;;   :config
;;   (global-corfu-mode))

;; (use-package corfu-candidate-overlay
;;   :straight (:type git
;;                    :repo "https://code.bsdgeek.org/adam/corfu-candidate-overlay"
;;                    :files (:defaults "*.el"))
;;   :after corfu
;;   :config
;;   ;; enable corfu-candidate-overlay mode globally
;;   ;; this relies on having corfu-auto set to nil
;;   (corfu-candidate-overlay-mode +1)
;;   ;; bind Ctrl + TAB to trigger the completion popup of corfu
;;   (global-set-key (kbd "C-<tab>") 'completion-at-point)
;;   ;; bind Ctrl + Shift + Tab to trigger completion of the first candidate
;;   ;; (keybing <iso-lefttab> may not work for your keyboard model)
;;   (global-set-key (kbd "C-<iso-lefttab>") 'corfu-candidate-overlay-complete-at-point))

(use-package
  flymake-eslint
  :straight t)

(defun duomacs/tsx-mode-hook ()
  "Internal function.  Hook to be run upon entering `tsx-mode'."
  (add-hook
   'eglot-managed-mode-hook
   (lambda ()
     (setq-local
      flymake-eslint-project-root
      (let* ((package-json
              (locate-dominating-file (buffer-file-name (current-buffer)) "package.json")))
        (when package-json
          (file-name-directory (expand-file-name package-json))))
      flymake-eslint-executable-name
      "eslint_d"
      eldoc-documentation-strategy
      'eldoc-documentation-compose)
     (flymake-eslint-enable))
   nil t))

;; (put 'eglot-node 'flymake-overlay-control nil)
;; (put 'eglot-warning 'flymake-overlay-control nil)
;; (put 'eglot-error 'flymake-overlay-control nil)))

;; format on save
(use-package
  apheleia
  :delight
  :straight t
  :config
  (add-to-list
   'apheleia-mode-alist
   '(tsx-ts-mode . prettier-typescript)))

;; code-coverage overlays
(use-package
  coverlay
  :delight coverlay-minor-mode
  :straight t)

;; CSS-in-JS support for tsx-mode
(use-package
  css-in-js-mode
  :delight
  :straight
  '(css-in-js-mode :type git :host github :repo "orzechowskid/tree-sitter-css-in-js" :branch "main" :post-build ((require 'css-in-js-mode) (css-in-js-mode-fetch-shared-library))))

;; linter adapter which doesn't use LSP
(use-package
  flymake-eslint
  :straight t)

;; code-folding
;; origami depends on some now-deprecated cl functions and there's not much we
;; can do about that
(let ((byte-compile-warnings '((not cl-functions))))
  (use-package
    origami
    :delight
    :straight t))

;; major-mode for JS/TS/JSX/TSX
(use-package
  tsx-mode
  :straight '(tsx-mode :type git :host github :repo "orzechowskid/tsx-mode.el" :branch "emacs29")
  :mode (("\\.[jt]s[x]?\\'" . tsx-mode)
         ("\\.[mc]js\\'" . tsx-mode))
  :config
  (add-hook
   'tsx-mode-hook
   #'duomacs/tsx-mode-hook))

 

(provide 'duomacs-javascript-typescript)
;;; duomacs-javascript-typescript.el ends here
