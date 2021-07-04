; I want to encrypt to myself by default. For custom exceptions put
; (not tried) something like this in the file header:
;; -*- epa-file-select-keys: t -*
(setq
 epa-file-encrypt-to '("mats.rauhala@iki.fi")
 ;; See https://superuser.com/a/1561209
 epa-file-select-keys 1
 )
