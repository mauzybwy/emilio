;;;;;                            ;;
;;;;  Projectile Configuration  ;;;
;;;            - mauzybwy -    ;;;;
;;                            ;;;;;

(use-package projectile
  :bind (("C-c b" . helm-projectile-switch-to-buffer)
	 ("C-c p" . helm-projectile-switch-project))
  
  :init
  (require 'projectile)
  (require 'helm-projectile)
  (projectile-mode)
  (projectile-clear-known-projects)
  (setq projectile-switch-project-action 'helm-projectile-switch-to-buffer))
