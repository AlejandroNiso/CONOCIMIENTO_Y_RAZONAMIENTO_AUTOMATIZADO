#lang racket
(require "enteros.rkt")

;; ********** ARTIMETICA MODULAR **********
(define (representante-canonico x mod)
  ((restoent x) mod))

(define (suma-mod n1 n2 mod)
  (representante-canonico ((sument n1) n2) mod))

;(testenteros (prod-mod tres cinco cuatro))
(define (prod-mod n1 n2 mod)
  (representante-canonico ((prodent n1) n2) mod))

;; ****************************************