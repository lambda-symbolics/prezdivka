(defpackage #:prezdivka
  (:documentation "Readable two-word names: an adjective and a noun, joined by a hyphen.")
  (:use #:cl)
  (:export #:*adjectives*
           #:*nouns*
           #:name-count
           #:name-for
           #:random-name
           #:base-name-exhausted
           #:unique-base-name
           #:unique-name))
