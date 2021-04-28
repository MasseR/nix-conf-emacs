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
