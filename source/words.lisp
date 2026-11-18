(in-package #:prezdivka)

;;;; -- Words --

;;; Every word is lowercase ASCII letters, at most twelve of them, so a name
;;; fits wherever an identifier of some thirty characters does. The lists lean
;;; on Lisp: its vocabulary, its dialects and machines, its people, the hacker
;;; jargon that grew up beside it, and the cast of SICP's exercises.

(defparameter *adjectives*
  #("anaphoric" "applicative" "atomic" "baroque" "bogus" "bound" "canonical" "circular"
    "compiled" "consed" "crufty" "curried" "cuspy" "deferred" "dotted" "dynamic"
    "eager" "elegant" "elvish" "evaluated" "expanded" "flaky" "free" "frobbed"
    "functional" "generic" "gnarly" "grokked" "hairy" "homoiconic" "hygienic" "idempotent"
    "immutable" "improper" "inlined" "interned" "interpreted" "iterative" "kludgy" "lazy"
    "lexical" "literal" "magic" "memoized" "meta" "moby" "munged" "mutable"
    "nested" "nifty" "nontrivial" "nullary" "optional" "persistent" "polymorphic" "proper"
    "pure" "quoted" "recursive" "reentrant" "reflective" "robust" "shadowed" "snarfed"
    "special" "spliced" "strict" "symbolic" "terse" "thunked" "unbound" "uninterned"
    "unquoted" "variadic" "volatile" "winning" "wizardly" "wonky" "zen" "zippy")
  "The first words of names.")

(defparameter *nouns*
  #("abelson" "alist" "alyssa" "apply" "arc" "atom" "backquote" "bar"
    "barney" "bawden" "baz" "ben" "bignum" "bitdiddle" "cadr" "car"
    "cdr" "church" "clojure" "closure" "cond" "condition" "cons" "cruft"
    "curry" "cy" "defun" "dewey" "dylan" "elisp" "emacs" "eva"
    "eval" "felleisen" "fixnum" "foo" "format" "fred" "friedman" "frob"
    "frobnitz" "funarg" "gabriel" "garply" "genera" "gensym" "graham" "greenblatt"
    "gronk" "grue" "guru" "hack" "hacker" "handler" "hickey" "huey"
    "interlisp" "keyword" "kludge" "knight" "lambda" "landin" "lem" "lispm"
    "louie" "louis" "maclisp" "macro" "mccarthy" "mixin" "moon" "norvig"
    "oliver" "paren" "pitman" "plist" "plugh" "progn" "queinnec" "quine"
    "quote" "quux" "racket" "reasoner" "repl" "restart" "scheme" "setq"
    "sexp" "slot" "snark" "steele" "sussman" "symbol" "symbolics" "teco"
    "thunk" "tweakit" "warbucks" "weinreb" "wizard" "wombat" "xyzzy" "zetalisp"
    "zork")
  "The second words of names.")
