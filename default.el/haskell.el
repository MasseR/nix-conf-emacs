;; Haskell evil mode is broken
(defun haskell-evil-open-above ()
  (interactive)
  (evil-digit-argument-or-evil-beginning-of-line)
  (haskell-indentation-newline-and-indent)
  (evil-previous-line)
  (haskell-indentation-indent-line)
  (evil-append-line nil))
(defun haskell-evil-open-below ()
  (interactive)
  (evil-append-line nil)
  (haskell-indentation-newline-and-indent))

;; Haskell configuration
;; https://github.com/wbolster/emacs-direnv/issues/28
;; (define-advice direnv-update-directory-environment (:after (&rest x) haskell-after-direnv)
;;   (when (eq major-mode 'haskell-mode)
;; 	 (eglot)))

;; (eglot--code-action eglot-code-action-fill-hole "refactor.wingman.fillHole")
;; (eglot--code-action eglot-code-action-refine "refactor.wingman.refine")
;; (eglot--code-action eglot-code-action-import "quickfix.import.new.list.topLevel")

(use-package haskell-ts-mode
  :after evil
  :config
  (evil-define-key 'normal haskell-ts-mode-map "O" 'haskell-evil-open-above)
  (evil-define-key 'normal haskell-ts-mode-map "o" 'haskell-evil-open-below)
  ;; (evil-define-key 'normal haskell-mode-map "K" 'lsp-describe-thing-at-point)
  (evil-define-key 'normal haskell-ts-mode-map "]n" 'flymake-goto-next-error)
  (evil-define-key 'normal haskell-ts-mode-map "[n" 'flymake-goto-prev-error)

  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
  (evil-define-key 'normal haskell-ts-mode-map "gd" 'xref-find-definitions)
  (evil-define-key 'normal haskell-ts-mode-map "gr" 'xref-find-references)
  (evil-leader/set-key-for-mode 'haskell-ts-mode
    ;; "ca" 'eglot-code-actions
    ;; "ii" 'eglot-code-action-import
    ;; "ww" 'eglot-code-action-refine
    ;; "wf" 'eglot-code-action-fill-hole
    ;; "dd" 'flymake-show-buffer-diagnostics
    "hl" 'haskell-process-load-file
    ;; "hf" 'eglot-format-buffer
    )
  )
