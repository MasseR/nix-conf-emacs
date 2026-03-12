(use-package agent-shell
  :after evil
  :config
  ;; Make RET context-aware in evil mode
  (evil-define-key 'insert agent-shell-mode-map (kbd "RET") #'newline)
  (evil-define-key 'normal agent-shell-mode-map (kbd "RET") #'comint-send-input)
  ;; Start diff buffers in Emacs state for easy y/n/p/q responses
  (add-hook 'diff-mode-hook
    (lambda ()
      (when (string-match-p "\\*agent-shell-diff\\*" (buffer-name))
        (evil-emacs-state)))))
(use-package acp)
