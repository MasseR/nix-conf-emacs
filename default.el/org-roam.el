(use-package org-roam
  :after evil evil-leader
  :config
  (setq
   org-roam-directory (file-truename "~/org-roam")
   ;; org-roam-completion-system 'helm
   ;; org-roam-db-update-method 'immediate
   org-roam-v2-ack t
   org-roam-node-display-template (concat "${title:*} "
                                          (propertize "${tags:10}" 'face 'org-tag))
   org-roam-capture-templates '(("d" "default" plain "%?"
                                 :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                                                    "#+title: ${title}\n")
                                 :unnarrowed t)
                                ("m" "meeting" plain "%?"
                                 :target (file+head  "%<%Y%m%d%H%M%S>-${slug}.org"
                                                     "#+project:\n#+title: ${title}\n* Attendees\n* Agenda\n* Goals\n* Discussion notes\n* Action items\n")
                                 :unnarrowed t)
                                ("c" "Contact" plain "%?"
                                 :target (file+head  "%<%Y%m%d%H%M%S>-${slug}.org"
                                                     "#+name: ${title}\n#+team:")
                                 :unnarrowed t)
                                ("p" "Project" plain "%?"
                                 :target (file+head  "%<%Y%m%d%H%M%S>-${slug}.org"
                                                     "#+title: ${title}\n\n* Project description\n* Project information\n\n** Design\n** Epic\n* Resources\n\n** Shepherd\n** Architect")
                                 :unnarrowed t)
                                ("i" "Issue" plain "%?"
                                 :target (file+head  "%<%Y%m%d%H%M%S>-${slug}.org"
                                                     "#+title: ${title}\n#+author:\n#+project:\n")
                                 :unnarrowed t)
                                )
   )
  (org-roam-db-autosync-mode)
  ; (add-hook 'after-init-hook 'org-roam-mode)
  (evil-define-key 'insert org-roam-mode-map (kbd "C-c r i") 'org-roam-node-insert)
  (evil-define-key 'insert org-roam-mode-map (kbd "C-c r") 'org-roam-node-insert)
  (evil-leader/set-key ; or for roam
    "orf" 'org-roam-node-find
    "ori" 'org-roam-node-insert
    "orc" 'org-roam-capture
    "orb" 'org-roam-buffer-toggle
    ;; "orr" 'org-roam
    ;; "ord" 'org-roam-dailies-capture-today
    ;; "org" 'org-roam-graph
    )
  )
; (use-package org-roam-protocol)
