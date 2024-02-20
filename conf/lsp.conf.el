;;;;;                           ;;
;;;;      LSP Configuration    ;;;
;;;           - mauzybwy -    ;;;;
;;                           ;;;;;

(add-hook 'prog-mode-hook #'lsp)

(with-eval-after-load 'lsp-mode
  (push '(web-mode . web-mode-markup-indent-offset) lsp--formatting-indent-alist)
  ;; (require 'dap-chrome)
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (yas-global-mode))

(use-package lsp-mode
  :hook
  ((prog-mode . lsp)))

(use-package lsp-ui
  :commands lsp-ui-mode
  :ensure t
  :custom
  (lsp-ui-doc-enable nil))

;;;;
;;; Rescript
;;
;; Tell `rescript-mode` how to run your copy of `server.js` from rescript-vscode
;; (you'll have to adjust the path here to match your local system):
(customize-set-variable
  'lsp-rescript-server-command
    '("node" "/Users/mauzy/.vscode/extensions/chenglou92.rescript-vscode-1.28.0/server/out/cli.js " "--stdio"))
(with-eval-after-load 'rescript-mode
  ;; Tell `lsp-mode` about the `rescript-vscode` LSP server
  (require 'lsp-rescript)
  ;; Enable `lsp-mode` in rescript-mode buffers
  (add-hook 'rescript-mode-hook 'lsp-deferred)
  ;; Enable display of type information in rescript-mode buffers
  ;; (require 'lsp-ui)
  ;; (add-hook 'rescript-mode-hook 'lsp-ui-doc-mode)
  )



;; vvvv AHHHHH ALL THIS SHOULD BE IN ITS OWN FILE WOO vvvvv

(use-package company
  :hook (prog-mode . company-mode)
  :straight t
  :config
  (setq company-idle-delay 0.0
        company-minimum-prefix-length 1))

;; format on save
(use-package
  apheleia
  :delight
  :straight t
  :hook
  (typescript-ts-mode . apheleia-mode)

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
  :hook
  (typescript-ts-mode . eglot-ensure)

  :delight
  :straight
  '(css-in-js-mode :type git :host github :repo "orzechowskid/tree-sitter-css-in-js" :branch "main" :post-build ((require 'css-in-js-mode) (css-in-js-mode-fetch-shared-library))))

;; linter adapter which doesn't use LSP
(use-package
  flymake-eslint
  :straight t)
