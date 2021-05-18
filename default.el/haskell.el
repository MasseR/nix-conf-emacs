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

(use-package haskell-mode
	     :after evil
	     :config
	     (evil-define-key 'normal haskell-mode-map "O" 'haskell-evil-open-above)
	     (evil-define-key 'normal haskell-mode-map "o" 'haskell-evil-open-below)
	     ;; (evil-define-key 'normal haskell-mode-map "K" 'lsp-describe-thing-at-point)
	     (evil-define-key 'normal haskell-mode-map "]n" 'flymake-goto-next-error)
	     (evil-define-key 'normal haskell-mode-map "[n" 'flymake-goto-prev-error)

	     (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
	     (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
	     (evil-define-key 'normal haskell-mode-map "gd" 'xref-find-definitions)
	     (evil-define-key 'normal haskell-mode-map "gr" 'xref-find-references)
	     (evil-leader/set-key-for-mode 'haskell-mode
	       "a" 'eglot-code-action-quickfix
	       "dd" 'flymake-show-diagnostics-buffer
	       "hl" 'haskell-process-load-file
	       "hf" 'eglot-format-buffer
	       "]]" 'sp-forward-slurp-sexp
	       "[[" 'sp-forward-barf-sexp
	       )
	     )
;; (use-package lsp-haskell
;; 	     :after haskell-mode lsp-mode
;; 	     :config
;; 	     (add-hook 'haskell-mode-hook #'lsp)
;; 	     (add-hook 'haskell-literate-mode-hook #'lsp)
;; 	     (evil-define-key 'normal haskell-mode-map "gd" 'lsp-find-definition)
;; 	     (evil-define-key 'normal haskell-mode-map "gr" 'lsp-find-references)
;; 	     (evil-leader/set-key-for-mode 'haskell-mode
;; 	       "a" 'lsp-execute-code-action
;; 	       "dd" 'flycheck-list-errors
;; 	       "hl" 'haskell-process-load-file
;; 	       )
;; 	     )
