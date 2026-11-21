(defpackage #:prezdivka/tests
  (:documentation "Regression tests for prezdivka.")
  (:use #:cl)
  (:export #:run-tests))

(in-package #:prezdivka/tests)

(defvar *test-count* 0
  "The number of assertions executed by the current test run.")

(defun test-assert (condition description)
  "Record and require CONDITION for DESCRIPTION."
  (incf *test-count*)
  (unless condition
    (error "prezdivka test failed: ~A" description))
  t)
