#lang racket/base

(provide step%
         step?)

(require racket/class
         racket/contract
         (file "environment.rkt"))

(define step%
  (class object%
    (class/c [evaluate (->m environment? environment?)])
    (super-new)
    (abstract evaluate
              render)))

(define/contract (step? x)
  (any/c . -> . boolean?)
  (and (object? x)
       (is-a? x step%)))