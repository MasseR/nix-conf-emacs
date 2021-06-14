(use-package org
  :after evil evil-leader
  :config
  (setq
   ;; Set this manually in each environments .emacs
   ;; org-agenda-files '("~/orgmode/" "~/personal_orgmode")
   org-todo-keywords '("TODO(t)" "PROJECT(p)" "WAIT(w@/!)" "REVIEWING(r)" "MAYBE(m)" "|" "DONE(d!)" "CANCELED(c@)" "DELEGATED(e@)")
   org-log-done 'time
   org-refile-use-outline-path nil
   org-agenda-todo-ignore-scheduled t ; Filter scheduled tasks from the *global todo list*
   org-stuck-projects '("/PROJECT" ("TODO") nil "")
   ;; Set this in each environments ~/.emacs
   ;; org-default-notes-file "~/personal_orgmode/inbox.org"
   org-refile-targets '((org-agenda-files :maxlevel . 3))
   org-agenda-start-on-weekday nil ; Agenda always starts on the current day
   org-agenda-overriding-columns-format "%40ITEM(Task) %17Effort(Estimated Effort){:} %CLOCKSUM %TODO" ; Have the same agenda for all
   org-global-properties '(("Effort_ALL" . "0 0:15 0:30 1:00 2:00 4:00 7:30"))
   org-duration-format 'h:mm
   )
  (evil-leader/set-key
                                        ; Allows using capture in any buffer, not just in org-mode
    "cc" 'org-capture)
  (evil-leader/set-key-for-mode 'org-mode
    "a" 'org-agenda
    "t" 'org-todo
    "s" 'org-schedule
    "d" 'org-deadline
    )
  )
(use-package org-protocol)
