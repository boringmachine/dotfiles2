;; add ~/.emacs.d/elisp to load path
(add-to-list 'load-path "~/.emacs.d/elisp")

;; define user-emacs-directory
(when (< emacs-major-version 23)
  (defvar user-emacs-directory "~/emacs.d/"))

;; define load-pash addition function
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	            (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	        (normal-top-level-add-subdirs-to-load-path))))))

;; add the directory to load-path
(add-to-load-path "elisp" "conf" "public_repos")
