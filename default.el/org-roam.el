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
                                                     "#+title: %<%Y-%m-%d> ${title}\n:#:filetags: :meeting-unrefined:\n\n* Project\n* Attendees\n* Agenda\n* Goals\n* Discussion notes\n* Action items\n")
                                 :unnarrowed t)
                                ("p" "Project" plain "%?"
                                 :target (file+head  "%<%Y%m%d%H%M%S>-${slug}.org"
                                                     "#+title: %<%Y-%m-%d> ${title}\n\n* Project description\n* Project information\n\n")
                                 :unnarrowed t)
                                )
   )
  (org-roam-db-autosync-mode)
  ; (add-hook 'after-init-hook 'org-roam-mode)
  (evil-define-key 'insert org-mode-map (kbd "C-c r i") 'org-roam-node-insert)
  (evil-leader/set-key ; or for roam
    "orf" 'org-roam-node-find
    "ori" 'org-roam-node-insert
    "orc" 'org-roam-capture
    "ordc" 'org-roam-dailies-capture-today
    "ordt" 'org-roam-dailies-goto-today
    "ordd" 'org-roam-dailies-goto-date
    "ord[" 'org-roam-dailies-goto-previous-note
    "ord]" 'org-roam-dailies-goto-next-note
    "orb" 'org-roam-buffer-toggle
    "orta" 'org-roam-tag-add
    "ortd" 'org-roam-tag-remove
    ;; "orr" 'org-roam
    ;; "ord" 'org-roam-dailies-capture-today
    ;; "org" 'org-roam-graph
    )
  )
; (use-package org-roam-protocol)

;; For now not enabling this. A quick test shows that it requires a
;; single emacs instance to be running because of webscoket ports.
;; (use-package org-roam-ui
;;   :after org-roam
;;   :config
;;   (setq org-roam-ui-sync-theme t
;;         org-roam-ui-follow t
;;         org-roam-ui-update-on-save t
;;         org-roam-ui-open-on-start t))
