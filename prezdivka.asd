(asdf:defsystem #:prezdivka
  :description "Readable two-word names with a Lisp accent: random, or the same one for the same key"
  :author      "Lukáš Hozda"
  :license     "COLL-Attribution"
  :version     "0.1.0"
  :serial      t
  :components  ((:module     "source"
                 :serial     t
                 :components ((:file "package")
                              (:file "words")
                              (:file "names"))))
  :in-order-to ((asdf:test-op (asdf:test-op #:prezdivka/tests))))

(asdf:defsystem #:prezdivka/tests
  :description "Tests for prezdivka"
  :depends-on  (#:prezdivka)
  :serial      t
  :components  ((:module     "tests"
                 :serial     t
                 :components ((:file "package")
                              (:file "tests"))))
  :perform     (asdf:test-op (operation component)
                 (declare (ignore operation component))
                 (uiop:symbol-call '#:prezdivka/tests '#:run-tests)))
