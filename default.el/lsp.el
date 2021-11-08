(use-package lsp-mode
  :after evil evil-leader
  :hook ((haskell-mode . lsp-deferred))
  :commands (lsp lsp-deferred)
  :config
  (lsp-register-client
   (make-lsp--client
    :new-connection (lsp-stdio-connection "dhall-lsp-server")
    :major-modes '(dhall-mode)
    :server-id 'lsp-dhall))
  (evil-define-key 'normal lsp-mode-map
    "gd" 'xref-find-definitions
    "]n" 'flycheck-next-error
    "[n" 'flycheck-previous-error
    )
  ;; I wasn't able to figure out how to make it work for lsp-mode
  ;; (evil-leader/set-key-for-mode 'lsp
  ;;   "a" 'lsp-execute-code-action
  ;;   "dd" 'lsp-treemacs-error-list
  ;;   )
  (evil-leader/set-key
    "ca" 'lsp-execute-code-action
    "cl" 'lsp-avy-lens
    "dd" 'lsp-treemacs-errors-list
    )
  )

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
(define-advice direnv-update-directory-environment (:after (&rest x) haskell-after-direnv)
  (when (eq major-mode 'haskell-mode)
    (lsp)))

(use-package lsp-haskell
  :after lsp-mode direnv-mode
  :config
  (add-hook 'haskell-mode-hook #'lsp)
  (add-hook 'haskell-literate-mode-hook #'lsp)
  )

(use-package avy)
(use-package lsp-treemacs
  :config
  (lsp-treemacs-sync-mode 1))
