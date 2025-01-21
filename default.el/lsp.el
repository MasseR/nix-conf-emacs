(use-package lsp-mode
  :after evil evil-leader
  :hook ((prog-mode . lsp-deferred))  ;; Enable for all programming modes
  :commands (lsp lsp-deferred)
  :custom
  (lsp-auto-guess-root t)  ;; Detect project root
  (lsp-log-io nil)        ;; Don't log everything
  (lsp-keymap-prefix "C-c l")  ;; Set prefix for lsp-command-keymap
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
  
  ;; Your evil keybindings
  (evil-define-key 'normal lsp-mode-map
    "gd" 'xref-find-definitions
    "]n" 'flycheck-next-error
    "[n" 'flycheck-previous-error
    "K" 'lsp-ui-doc-glance)
  
  (evil-leader/set-key
    "ca" 'lsp-execute-code-action
    "cl" 'lsp-avy-lens
    "dd" 'lsp-treemacs-errors-list))

(use-package lsp-ui
  :custom
  (lsp-ui-doc-position 'bottom)
  (lsp-ui-doc-show-with-cursor t)
  (lsp-ui-sideline-show-code-actions t)
  (lsp-ui-sideline-delay 0.05))
