(use-package lsp-mode)
(use-package lsp-ui)

; https://github.com/wbolster/emacs-direnv/issues/28#issuecomment-500388468
(defun prepare-haskell-in-shell (&rest args)
  (setq tried-to-start-lsp t)
  ;; (when (eq major-mode 'haskell-mode)
  ;;   (setq tried-to-start-lsp t)
  ;;   (lsp))
  )

;; Haskell configuration
;; https://github.com/wbolster/emacs-direnv/issues/28
(define-advice direnv-update-directory-environment (:after (x) haskell-after-direnv)
  (when (eq major-mode 'haskell-mode)
	 (lsp)))
(use-package lsp-haskell
  :after lsp-mode direnv-mode
  :config
  (add-hook 'haskell-mode-hook #'lsp)
  (add-hook 'haskell-literate-mode-hook #'lsp)
  

  )
