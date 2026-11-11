;; Completion popup only in code buffers. Prose (org, text) gets none:
;; the dabbrev-style backends were laggy and rarely useful there.
(use-package company
  :hook (prog-mode . company-mode)
  :config
  (setq company-minimum-prefix-length 2
        company-idle-delay 0.2))
