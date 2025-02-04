(use-package lsp-completion
  :config
  (lsp-inline-completion-mode))

(use-package flycheck
  :custom
  (global-flycheck-mode))

(use-package lsp-treemacs
  :config
  (setq lsp-treemacs-error-list-expand-depth 5)
  )

(use-package lsp-mode
  :after evil evil-leader evil-collection
  :hook ((prog-mode . lsp-deferred))  ;; Enable for all programming modes
  :commands (lsp lsp-deferred)
  :custom
  (lsp-log-io nil)        ;; Don't log everything
  (lsp-keymap-prefix "C-c l")  ;; Set prefix for lsp-command-keymap
  (lsp-diagnostics-provider :flycheck)
  :config
  ;; Your existing client registrations
  (lsp-register-client
   (make-lsp--client
    :new-connection (lsp-stdio-connection "dhall-lsp-server")
    :major-modes '(dhall-mode)
    :server-id 'lsp-dhall))
  (lsp-register-client
   (make-lsp--client
    :new-connection (lsp-stdio-connection "nil")
    :major-modes '(nix-mode)
    :server-id 'lsp-nix))

  ; lsp-mode forcibly tries to install copilot, I'm not ready for it right now
  ;; (setq lsp-copilot-applicable-fn (-const nil))
  (setq lsp-copilot-enabled nil)


  ;; Your evil keybindings
  (evil-global-set-key 'normal "gd" 'xref-find-definitions)
  (evil-global-set-key 'normal  "]x" 'flycheck-next-error)
  (evil-global-set-key 'normal  "[x" 'flycheck-previous-error)
  (evil-global-set-key 'normal  "K" 'lsp-ui-doc-glance)
  (evil-define-key 'normal lsp-mode-map "gq" #'lsp-format-region)

  (evil-leader/set-key
    "ca" 'lsp-execute-code-action
    "cl" 'lsp-avy-lens
    "dd" 'lsp-treemacs-errors-list))

(use-package lsp-ui
  :after lsp-mode
  :custom
  (lsp-ui-doc-position 'bottom)
  (lsp-ui-doc-show-with-cursor t)
  (lsp-ui-sideline-show-code-actions t)
  (lsp-ui-sideline-delay 0.05)
  (lsp-ui-sideline-enable t)
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-flycheck-enable t)
  (lsp-ui-sideline-diagnostics-max-lines 3)  ;; Show multi-line errors
  (lsp-ui-doc-enable t)                      ;; Enable documentation
  :config
  (add-hook 'lsp-mode-hook #'lsp-ui-mode))

(use-package flycheck
  :hook (lsp-mode . flycheck-mode)
  :custom
  (flycheck-indication-mode 'left-fringe)
  (flycheck-check-syntax-automatically '(save mode-enabled))
  :config
  (define-fringe-bitmap 'flycheck-fringe-bitmap-double-arrow
    [0 0 0 0 0 4 12 28 60 124 252 124 60 28 12 4 0 0 0 0]))
