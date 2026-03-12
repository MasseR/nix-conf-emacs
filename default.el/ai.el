(use-package agent-shell
  :after evil evil-leader
  :config
  ;; Make RET context-aware in evil mode
  (evil-define-key 'insert agent-shell-mode-map (kbd "RET") #'newline)
  (evil-define-key 'normal agent-shell-mode-map (kbd "RET") #'comint-send-input)
  ;; Start diff buffers in Emacs state for easy y/n/p/q responses
  (add-hook 'diff-mode-hook
    (lambda ()
      (when (string-match-p "\\*agent-shell-diff\\*" (buffer-name))
        (evil-emacs-state))))
  ;; Evil leader keybindings for agent-shell
  (evil-leader/set-key
    "AA" 'agent-shell              ; Start/reuse agent shell
    "An" 'agent-shell-new-shell    ; New session
    "At" 'agent-shell-toggle       ; Show/hide agent shell
    "Ao" 'agent-shell-other-buffer ; Switch to associated buffer
    "Ar" 'agent-shell-rename-buffer ; Rename buffer
    "Am" 'agent-shell-set-session-model)) ; Change model
(use-package acp)
