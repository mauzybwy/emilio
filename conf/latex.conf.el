;; AucTeX settings
(setq TeX-PDF-mode t)

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (push
             '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
               :help "Run latexmk on file")
             TeX-command-list)))
(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))

(setq TeX-view-program-list
      '(("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b"))
      TeX-view-program-selection '((output-pdf "Skim")))

(custom-set-variables
 '(TeX-source-correlate-method 'synctex)
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t))
