;;;;;                           ;;
;;;;  Packages Configuration   ;;;
;;;            - mauzybwy -   ;;;;
;;                           ;;;;;

;; Set up package managers
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

;; Set up use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Start use-package
(eval-when-compile
  (require 'use-package))
;; (require 'diminish)
;; (require 'bind-key)

