;; Emacs wants the user to see the startup screen, so this value can
;; only be set in the .emacs or equivalent. Or we can cheat and set it
;; after the init hook
(add-hook 'after-init-hook
	  (lambda ()
	    (setq inhibit-startup-screen t)
	    ))


(setq default-tab-width 2)

(load-theme 'zenburn t)

(global-auto-revert-mode t)

;; This is needed when using emacsclient
(defun set-cursor-hook (frame)
  (modify-frame-parameters
   frame (list (cons 'cursor-color "White"))))
(add-hook 'after-make-frame-functions 'set-cursor-hook)

;; Backups
(setq
 backup-by-copying t
 backup-directory-alist '(("." . "~/.saves/"))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)
