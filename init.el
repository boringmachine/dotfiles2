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

;;init-loader
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")

;;auto-install
(when(require 'auto-install nil t)
  (setq auto-install-directory "~/.emacs.d/elisp/")
  (auto-install-update-emacswiki-package-name t)
  (auto-install-compatibility-setup))

;;package.el
(require 'package)
(add-to-list 'package-archives
         '("marmalade" . "http://marmalade-repo.org/packages/")
         '("melpa" . "http://melpa.milkbox.net/packages/"))

;;auto-complete
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
	       "~/.emacs.d/elisp/ac-dict")
  (define-key ac-mode-map (kbd "C-TAB") 'auto-complete)
  (ac-config-default))