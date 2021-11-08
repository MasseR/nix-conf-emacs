(use-package org-roam
  :after evil evil-leader
  :config
  (setq
   org-roam-directory "~/org-roam"
   org-roam-completion-system 'helm
   org-roam-db-update-method 'immediate
   org-roam-v2-ack t
   )
  ; (add-hook 'after-init-hook 'org-roam-mode)
  (evil-define-key 'insert org-roam-mode-map (kbd "C-c r i") 'org-roam-insert)
  (evil-leader/set-key ; or for roam
    "orf" 'org-roam-find-file
    "orr" 'org-roam
    "ord" 'org-roam-dailies-capture-today
    "org" 'org-roam-graph
    )
  )
; (use-package org-roam-protocol)
