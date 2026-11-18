(in-package #:prezdivka)

;;;; -- Names --

(declaim (ftype (function (&key (:adjectives vector) (:nouns vector)) (integer 0)) name-count))
(defun name-count (&key (adjectives *adjectives*) (nouns *nouns*))
  "Return how many different names ADJECTIVES and NOUNS make."
  (* (length adjectives) (length nouns)))

(declaim (ftype (function ((integer 0) &key (:adjectives vector) (:nouns vector)) string) names--nth))
(defun names--nth (index &key (adjectives *adjectives*) (nouns *nouns*))
  "Return name number INDEX, counted modulo the number of names."
  (multiple-value-bind (noun adjective) (floor index (length adjectives))
    (format nil "~A-~A"
            (aref adjectives adjective)
            (aref nouns (mod noun (length nouns))))))

(declaim (ftype (function (string) (unsigned-byte 32)) names--hash))
(defun names--hash (key)
  "Return the 32-bit FNV-1a hash of KEY's characters, the same in every image."
  (let ((hash 2166136261))
    (loop for character across key
          do (setf hash (logand #xffffffff
                                (* 16777619 (logxor hash (logand #xff (char-code character)))))))
    hash))

(declaim (ftype (function (&key (:adjectives vector) (:nouns vector) (:random-state random-state)) string)
                random-name))
(defun random-name (&key (adjectives *adjectives*) (nouns *nouns*) (random-state *random-state*))
  "Return a name picked at random."
  (names--nth (random (name-count :adjectives adjectives :nouns nouns) random-state)
              :adjectives adjectives :nouns nouns))

(declaim (ftype (function (string &key (:adjectives vector) (:nouns vector)) string) name-for))
(defun name-for (key &key (adjectives *adjectives*) (nouns *nouns*))
  "Return the name that belongs to KEY, the same on every call and in every image."
  (names--nth (names--hash key) :adjectives adjectives :nouns nouns))

(declaim (ftype (function (integer integer) integer) names--stride))
(defun names--stride (hash count)
  "Return a step from HASH that visits every one of COUNT names before it repeats."
  (loop for stride from (1+ (mod (ash hash -16) (max 1 (1- count))))
        when (= 1 (gcd stride count))
          return stride))

(declaim (ftype (function (string function &key (:adjectives vector) (:nouns vector)) string) unique-name))
(defun unique-name (key taken-p &key (adjectives *adjectives*) (nouns *nouns*))
  "Return a name for KEY that the function TAKEN-P does not report as taken.

The name that belongs to KEY comes first. While TAKEN-P returns true, other
names follow in an order KEY fixes, each of them once. When every name is
taken, the name that belongs to KEY gets the lowest free number from 2."
  (let* ((count  (name-count :adjectives adjectives :nouns nouns))
         (hash   (names--hash key))
         (stride (names--stride hash count)))
    (or (loop repeat count
              for index = (mod hash count) then (mod (+ index stride) count)
              for name = (names--nth index :adjectives adjectives :nouns nouns)
              unless (funcall taken-p name)
                return name)
        (loop with base = (name-for key :adjectives adjectives :nouns nouns)
              for number from 2
              for name = (format nil "~A-~D" base number)
              unless (funcall taken-p name)
                return name))))
