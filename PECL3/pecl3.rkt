#lang racket
(require "enteros.rkt")

;; ********** ARTIMETICA MODULAR **********
(define representante-canonico (lambda (x)
                                 (lambda (mod)
                                   ((restoent x) mod))))

(define suma-mod (lambda (x1)
                   (lambda (x2)
                     (lambda (mod)
                       ((representante-canonico ((sument x1) x2)) mod)))))

(define prod-mod (lambda (x1)
                   (lambda (x2)
                     (lambda (mod)
                       ((representante-canonico ((prodent x1) x2)) mod)))))

;; ****************************************
(define esnil primero)

(define nil (lambda (z) z))

(define lista-funciones ((par ((par primero) primero)) ((par ((par primero) segundo)) ((par ((par segundo) primero)) ((par ((par segundo) segundo)) nil)))))

