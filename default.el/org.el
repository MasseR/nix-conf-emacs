;; Reminders taken from
;; http://doc.norang.ca/org-mode.html
(defun bh/org-agenda-to-appt ()
  (interactive)
  ; Clear the appt list
  (setq appt-time-msg-list nil)
  ; Recreate it from org-agenda
  (org-agenda-to-appt))

;; appt notifications through notifications
;; https://emacs.stackexchange.com/questions/3844/good-methods-for-setting-up-alarms-audio-visual-triggered-by-org-mode-events
;; Use both the notifications system and the original value
(defun appt-notify (min-to-app new-time appt-msg)
  (notifications-notify :title "Appointment"
                        ; Doc says the time is a string
                        :body (format "Appointment in %s minutes: %s" min-to-app appt-msg)
                        :app-name "Emacs: Org"
                        :timeout 0
                        ; I don't seem to have this audio
                        :sound-name "alarm-clock-elapsed")
  (appt-disp-window min-to-app new-time appt-msg))


(use-package org
  :after evil evil-leader
  :config
  ; Add a hook for whenever the agenda is finalized to create the appointments
  (add-hook 'org-agenda-finalize-hook 'bh/org-agenda-to-appt 'append)
  (setq
   ;; Set this manually in each environments .emacs
   ;; org-agenda-files '("~/orgmode/" "~/personal_orgmode")
   org-todo-keywords '("TODO(t)" "NEXT(n)" "PROJECT(p)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")
   org-log-done 'time
   org-refile-use-outline-path nil
   org-agenda-todo-ignore-scheduled t ; Filter scheduled tasks from the *global todo list*
   org-stuck-projects '("/PROJECT" ("TODO") nil "")
   ;; Set this in each environments ~/.emacs
   ;; org-default-notes-file "~/personal_orgmode/inbox.org"
   org-refile-targets '((org-agenda-files :maxlevel . 3))
   org-agenda-start-on-weekday nil ; Agenda always starts on the current day
   org-agenda-overriding-columns-format "%40ITEM(Task) %17Effort(Estimated Effort){:} %CLOCKSUM %TODO" ; Have the same agenda for all
   org-global-properties '(("Effort_ALL" . "0 0:15 0:30 1:00 2:00 4:00 8:00"))
   org-duration-format 'h:mm
   org-agenda-sorting-strategy '((agenda habit-down time-up priority-down effort-up category-keep)
                                 (todo priority-down category-keep)
                                 (tags priority-down category-keep)
                                 (search category-keep))
   )
  (evil-leader/set-key
                                        ; Allows using capture in any buffer, not just in org-mode
    "cc" 'org-capture
    "a" 'org-agenda)
  (evil-leader/set-key-for-mode 'org-agenda-mode
    "t" 'org-agenda-filter-by-tag
    "v" 'org-agenda-log-mode
  )
  (evil-leader/set-key-for-mode 'org-mode
    "t" 'org-todo
    "s" 'org-schedule
    "d" 'org-deadline
    )
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((dot . t)))
  )
(use-package org-protocol)

(use-package appt
  :config
  (setq
   appt-message-warning-time 15
   appt-display-mode-line t
   appt-display-format 'window
   appt-disp-window-function 'appt-notify)
  (appt-activate t))
