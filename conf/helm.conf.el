;;;;;                            ;;
;;;;  Helm Mode Configuration   ;;;
;;;            - mauzybwy -    ;;;;
;;                            ;;;;;

(use-package helm
  :bind (("M-x"     . helm-M-x)
	 ("C-x C-b" . helm-buffers-list)
         ("C-x C-f" . helm-find-files)
         ([S-f10]   . helm-recentf))
  
  :init
  (require 'helm)
  (require 'helm-config)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-i")   'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-z")   'helm-select-action)
  (setq helm-split-window-in-side-p         t ; open helm buffer inside current window,
					      ; not occupy whole other window
      
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when
					      ; reaching top or bottom of source.
      
      helm-ff-search-library-in-sexp        t ; search for library in `require' and
					      ; `declare-function' sexp.
      
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      
      helm-ff-file-name-history-use-recentf t))
