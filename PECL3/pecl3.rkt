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

;;(define _lista-funciones ((par ((par primero) primero)) ((par ((par primero) segundo)) ((par ((par segundo) primero)) ((par ((par segundo) segundo)) nil)))))

(define lista-funciones ((par false) ((par ((par primero) primero)) ((par false) ((par ((par primero) segundo)) ((par false) ((par ((par segundo) primero)) ((par false) ((par ((par segundo) segundo)) nil)))))))))

(define _suma-matrices (lambda (m1)
                         (lambda (m2)
                           (lambda (mod)
                             (lambda (lista)
                               ((esnil lista) matriz ((((_suma-matrices m1) m2) mod) (segundo (segundo lista-funciones)))))))))

;;((((_suma-matrices m1) m2) mod) (segundo(segundo lista)))

(define suma-matrices (lambda (m1)
                        (lambda (m2)
                          (lambda (mod)
                            ((((_suma-matrices m1) m2) mod) lista-funciones)))))