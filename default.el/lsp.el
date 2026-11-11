(use-package lsp-completion
  :config
  ;; shortcut: lsp-inline-completion-mode was removed from lsp-mode
  ;; upstream; upgrade if the auto-import completion feature returns
  (setq lsp-completion-enable-additional-text-edit t))  ; Enable auto-import for rust-analyzer

(use-package flycheck
  :custom
  (global-flycheck-mode))

(use-package lsp-treemacs
  :config
  (setq lsp-treemacs-error-list-expand-depth 5)
  )

(use-package lsp-mode
  :after evil general evil-collection
  :hook ((prog-mode . lsp-deferred))  ;; Enable for all programming modes
  :commands (lsp lsp-deferred)
  :custom
  (lsp-log-io nil)        ;; Don't log everything
  (lsp-keymap-prefix "C-c l")  ;; Set prefix for lsp-command-keymap
  (lsp-diagnostics-provider :flycheck)
  (lsp-idle-delay 1.0)
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
  (defun my/show-error-or-doc ()
    "Show the flycheck error at point in a popup, else LSP hover docs."
    (interactive)
    (let ((errors (flycheck-overlay-errors-at (point))))
      (if errors
          (display-message-or-buffer
           (mapconcat #'flycheck-error-format-message-and-id errors "\n\n")
           "*Flycheck error*")
        (lsp-ui-doc-glance))))
  (evil-global-set-key 'normal  "K" 'my/show-error-or-doc)
  (evil-define-key 'normal lsp-mode-map "gq" #'lsp-format-region)
  (evil-define-key 'normal lsp-mode-map "gr" #'xref-find-references)
  ;; Same keys as neovim's diagnostic goto_prev/goto_next
  (evil-define-key 'normal lsp-mode-map "]n" #'flycheck-next-error)
  (evil-define-key 'normal lsp-mode-map "[n" #'flycheck-previous-error)
  ;; Signature help (parameter hints) on demand
  (evil-define-key '(normal insert) lsp-mode-map (kbd "C-k") #'lsp-signature-activate)

  (defun my/lsp-execute-code-action-always-prompt ()
    "Like `lsp-execute-code-action' but always prompts, even with a single action."
    (interactive)
    (let ((actions (lsp-code-actions-at-point)))
      (if (seq-empty-p actions)
          (message "No code actions available")
        (lsp-execute-code-action
         (let* ((titles (mapcar (lambda (a) (gethash "title" a)) actions))
                (choice (completing-read "Code action: " titles nil t)))
           (seq-find (lambda (a) (string= (gethash "title" a) choice)) actions))))))

  (my/leader
    "E" 'my/show-error-or-doc
    "ca"'my/lsp-execute-code-action-always-prompt
    "cl" 'lsp-avy-lens
    "dd" 'lsp-treemacs-errors-list))

(use-package lsp-ui
  :after lsp-mode
  :custom
  (lsp-ui-doc-position 'bottom)
  ;; On-demand only: signs in the fringe, details via K (my/show-error-or-doc)
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-show-with-cursor nil)
  (lsp-ui-sideline-enable nil)
  (lsp-ui-flycheck-enable t)
  :config
  (add-hook 'lsp-mode-hook #'lsp-ui-mode))

(use-package flycheck
  :hook (lsp-mode . flycheck-mode)
  :custom
  (flycheck-indication-mode 'left-fringe)
  ;; idle-change is required: lsp-mode only pushes freshly received
  ;; diagnostics to flycheck while the buffer is modified if it is set,
  ;; otherwise stale errors stick around until the next save.
  (flycheck-check-syntax-automatically '(save mode-enabled idle-change))
  (flycheck-idle-change-delay 1.0)
  (flycheck-display-errors-function #'ignore) ; no echo-area errors; use K
  :config
  (define-fringe-bitmap 'flycheck-fringe-bitmap-double-arrow
    [0 0 0 0 0 4 12 28 60 124 252 124 60 28 12 4 0 0 0 0]))
