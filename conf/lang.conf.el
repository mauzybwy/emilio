;;;;
;;; General Programming
;;
(add-hook 'prog-mode-hook #'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      create-lockfiles nil) ;; lock files will kill `npm start'

(with-eval-after-load 'lsp-mode
  (push '(web-mode . web-mode-markup-indent-offset) lsp--formatting-indent-alist)
  (require 'dap-chrome)
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (yas-global-mode))

(use-package lsp-mode
  :hook
  ((python-mode . lsp)))

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

;;;;
;;; Python
;;
(add-hook 'python-mode-hook '(lambda () 
 (setq python-indent 4)))

(use-package elpy
  :init
  (elpy-enable)
  :config
  (setq python-shell-interpreter "ipython" ;require pip install ipython
	python-shell-interpreter-args "-i --simple-prompt")
  (add-hook 'python-mode-hook 'eldoc-mode)
  (setq elpy-rpc-python-command "python3")
  (setq elpy-shell-echo-output nil)
  (setq python-shell-completion-native-enable nil)
  (setq elpy-rpc-backend "jedi")
  (setq python-indent-offset 4
        python-indent 4)
  )
(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))


(use-package company-quickhelp
  :config
  (company-quickhelp-mode 1)
  (eval-after-load 'company
  '(define-key company-active-map (kbd "C-c h") #'company-quickhelp-manual-begin)))


;;;;
;;; Swift
;;
(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-swift3-setup))


;;;;
;;; JSON
;;
(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq tab-width 2)
            (setq js-indent-level 2)))
