#lang racket

;; config.rkt
;; Handles the configuration stuff.
;;
;; Author: Nathan Campos <nathanpc@dreamintech.net>

(require yaml)

(define config (read-yaml
                 (open-input-file "config.yml")))
