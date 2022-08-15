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
