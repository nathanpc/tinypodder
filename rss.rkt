#lang racket

;; rss.rkt
;; XML parsing shit.
;;
;; Author: Nathan Campos <nathanpc@dreamintech.net>

(require xml)
(require xml/path)

(provide get-doc get-channel-header get-items
         display-channel display-items)

;;
;; XML Parsing.
;;

;; Create a root X-Expression.
(define get-doc
  (lambda (url)
    (xml->xexpr (document-element
                  (read-xml (open-input-file url))))))

;; Get the channel information.
(define get-channel-header
  (lambda (doc)
    (hash 'title (se-path* '(title) doc)
          'link (se-path* '(link) doc)
          'description (se-path* '(description) doc)
          'thumbnail (se-path* '(image url) doc))))

;; Get the episodes.
(define get-items
  (lambda (doc)
    (remove* (list (void))
             (map (lambda (item)
                    (cond
                      [(equal? 'item (list-ref item 0))
                       (hash 'title (se-path* '(title) item)
                             'link (se-path* '(link) item)
                             'published (se-path* '(pubDate) item)
                             'summary (se-path* '(itunes:summary) item)
                             'description (se-path* '(content:encoded) item)
                             'duration (se-path* '(itunes:duration) item))]))
                  (filter pair?
                          (se-path*/list '(channel) doc))))))

;;
;; Displaying Information.
;;

;; Display the channel information.
(define display-channel
  (lambda (channel)
    (printf "Title: ~a~n" (hash-ref channel 'title))
    (printf "Link: ~a~n" (hash-ref channel 'link))
    (printf "Thumbnail: ~a~n" (hash-ref channel 'thumbnail))
    (printf "Description: ~a~n" (hash-ref channel 'description))))

;; Display all the episodes.
(define display-items
  (lambda (items)
    (for-each
      (lambda (item)
        (printf "~n~n")
        (printf "Title: ~a~n" (hash-ref item 'title))
        (printf "Link: ~a~n" (hash-ref item 'link))
        (printf "Date: ~a~n" (hash-ref item 'published))
        (printf "Duration: ~a~n" (hash-ref item 'duration))
        (printf "Summary: ~a~n" (hash-ref item 'summary)))
        ;(printf "Description: ~a~n" (hash-ref item 'description)))
      items)))
