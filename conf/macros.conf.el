;;;;;                    ;;
;;;;  General Macros    ;;;
;;;    - mauzybwy -    ;;;;
;;                    ;;;;;


;;;;
;;; Proxy Stuff
;;
(defun enable-proxy ()
  (interactive)
  (setq url-proxy-services '(("no_proxy" . "ti\\.com")
			     ("http" . "webproxy.ext.ti.com:80")
			     ("https" . "webproxy.ext.ti.com:80"))))

(defun disable-proxy ()
  (interactive)
  (setq url-proxy-services '(("no_proxy" . "")
			     ("http" . "")
			     ("https" . ""))))

(defun runpy ()
  (interactive)
  "Silently run python on the current buffer"
  (when (eq major-mode 'python-mode)
    (shell-command-to-string (format "python3 %s" buffer-file-name))))

;;;;
;;; Copy Filename to Clipboard
;;
(defun copy-filename-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

(defun my-load-all-in-directory (dir)
  "`load' all elisp libraries in directory DIR which are not already loaded."
  (interactive "D")
  (let ((libraries-loaded (mapcar #'file-name-sans-extension
                                  (delq nil (mapcar #'car load-history)))))
    (dolist (file (directory-files dir t ".+\\.elc?$"))
      (let ((library (file-name-sans-extension file)))
        (unless (member library libraries-loaded)
          (load library nil t)
          (push library libraries-loaded))))))

(defmacro temporary-invisible-change (&rest forms)
  "Executes FORMS with a temporary buffer-undo-list, undoing on return.
The changes you make within FORMS are undone before returning.
But more importantly, the buffer's buffer-undo-list is not affected.
This allows you to temporarily modify read-only buffers too."
  `(let* ((buffer-undo-list)
          (modified (buffer-modified-p))
          (inhibit-read-only t))
     (save-excursion
       (unwind-protect
           (progn ,@forms)
         (primitive-undo (length buffer-undo-list) buffer-undo-list)
         (set-buffer-modified-p modified)))
     nil))

;;;;
;;; Comment Blocks
;;
(defun comment-section-block ()
  (interactive)
  (if (member major-mode '(web-mode js-mode c-mode))
      (progn
	(insert "/*****************************************************************************")
	(newline-and-indent)
	(insert "*")
	(newline-and-indent)
	(insert "*****************************************************************************/")
	(forward-line -1)
	(indent-according-to-mode)
	(forward-line 1)
	(indent-according-to-mode)
	(forward-line -1)
	(move-end-of-line 1)
	(insert " "))
    (message "flymake-mode is off")))
(global-set-key (kbd "C-c ;") 'comment-section-block)

(defun comment-section-line ()
  (interactive)
  (if (member major-mode '(web-mode js-mode c-mode))
      (progn
	(insert "/****************************************************************************/")
        (newline-and-indent))
    (message "flymake-mode is off")))
(global-set-key (kbd "C-c C-;") 'comment-section-line)
