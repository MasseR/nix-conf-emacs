(use-package general
  :demand t
  :config
  ;; <SPC> leader for evil states. Mode-specific bindings pass :keymaps
  ;; and take precedence over the global ones.
  ;; evil binds SPC (evil-forward-char) in the motion map; free it so it can
  ;; act as the leader prefix. Registered here so it runs before any
  ;; `:after evil` block defines leader keys.
  (with-eval-after-load (quote evil)
    (define-key evil-motion-state-map (kbd "SPC") nil))
  (general-create-definer my/leader
    :states '(normal visual motion)
    :prefix "SPC"))

;; Emacs wants the user to see the startup screen, so this value can
;; only be set in the .emacs or equivalent. Or we can cheat and set it
;; after the init hook
(add-hook 'after-init-hook
  (lambda ()
    (setq inhibit-startup-screen t)))


;; By default emacs detects sentences as ending with a period and
;; double space.
(setf sentence-end-double-space nil)

(setq default-tab-width 2)

;; load-theme only searches custom-theme-load-path; MELPA themes are
;; normally registered there by their autoloads, which package.el never
;; loads in this config. Find the theme file through load-path instead.
(let ((file (locate-library "zenburn-theme")))
  (when file
    (add-to-list 'custom-theme-load-path (file-name-directory file))))
(load-theme 'zenburn t)

(global-auto-revert-mode t)

;; This is needed when using emacsclient
(defun set-cursor-hook (frame)
  (modify-frame-parameters
   frame (list (cons 'cursor-color "White"))))
(add-hook 'after-make-frame-functions 'set-cursor-hook)

;; Whitespace
(setq-default
 indent-tabs-mode nil
 tab-width 2
 )

;; Backups
(setq
 backup-by-copying t
 backup-directory-alist '(("." . "~/.saves/"))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)


;; Clean the buffer list periodically every midnight
(midnight-mode t)
