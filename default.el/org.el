
;; Reminders taken from
;; http://doc.norang.ca/org-mode.html
(defun bh/org-agenda-to-appt ()
  (interactive)
  ; Clear the appt list
  (setq appt-time-msg-list nil)
  ; Recreate it from org-agenda
  (org-agenda-to-appt))

(use-package org
  :after evil general
  :config
  ; Add a hook for whenever the agenda is finalized to create the appointments
  (add-hook 'org-agenda-finalize-hook 'bh/org-agenda-to-appt 'append)
  (setq
   ;; Set this manually in each environments .emacs
   ;; org-agenda-files '("~/orgmode/" "~/personal_orgmode")
   org-modules '(ol-doi ol-w3m ol-bbdb ol-bibtex ol-docview ol-gnus ol-info ol-irc ol-mhe ol-rmail ol-eww org-habit)
   org-todo-keywords '("TODO(t)" "NEXT(n!)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")
   org-log-done 'time
   org-refile-use-outline-path nil
   org-agenda-todo-ignore-scheduled t ; Filter scheduled tasks from the *global todo list*
   ;; Set this in each environments ~/.emacs
   ;; org-default-notes-file "~/personal_orgmode/inbox.org"
   org-refile-targets '((org-agenda-files :maxlevel . 3))
   org-agenda-start-on-weekday nil ; Agenda always starts on the current day
   org-agenda-overriding-columns-format "%40ITEM(Task) %17Effort(Estimated Effort){:} %CLOCKSUM %TODO" ; Have the same agenda for all
   org-global-properties '(("Effort_ALL" . "0 0:15 0:30 1:00 2:00 4:00 8:00"))
   org-duration-format 'h:mm
   org-habit-show-habits t
   org-agenda-sorting-strategy '((agenda habit-down time-up priority-down effort-up category-keep)
                                 (todo priority-down category-keep)
                                 (tags priority-down category-keep)
                                 (search category-keep))
   )
  (my/leader
                                        ; Allows using capture in any buffer, not just in org-mode
    "cc" 'org-capture
    "a" 'org-agenda)
  (my/leader :keymaps 'org-mode-map
    "t" 'org-todo
    "s" 'org-schedule
    "d" 'org-deadline
    "cU" 'org-update-all-dblocks  ; Update all clocktables in buffer
    )
  (org-babel-do-load-languages
   'org-babel-load-languages
    '((dot . t)
       (mermaid . t)
       (d2 . t)))
  )
(use-package org-protocol)

(use-package appt
  :config
  (setq
   appt-message-warning-time 15
   appt-display-mode-line t
   appt-display-format 'window)
  (appt-activate t))
