#!/usr/bin/env racket
#lang racket

;; tinypodder
;; A lightweight podcast manager.
;;
;; Author: Nathan Campos <nathanpc@dreamintech.net>

(require "config.rkt")
(require "rss.rkt")

;;
;; Configuration
;;

(define config (read-yaml
                 (open-input-file "config.yml")))

;;
;; Main
;;

; Get everything.
(define doc (get-doc "test.xml"))
(define channel (get-channel-header doc))
(define items (get-items doc))

; Display the parsed data.
(display-channel channel)
(display-items items)

