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

(define lista-acciones ((par false) ((par ((par primero) primero)) ((par false) ((par ((par primero) segundo)) ((par false) ((par ((par segundo) primero)) ((par false) ((par ((par segundo) segundo)) nil)))))))))
(define (accion-siguiente acciones) (segundo (segundo acciones)))
(define (accion-actual acciones) (primero (segundo acciones)))
(define (elemento-actual accion matriz) ((segundo accion) ((primero accion)matriz)))

(define _suma-matrices (lambda (m1)
                         (lambda (m2)
                           (lambda (mod)
                             (lambda (lista-acciones)
                               ( ((esnil lista-acciones)
                                  (lambda (no_use) matriz)
                                  (lambda (no_use) (((((_suma-matrices m1) m2) mod) (accion-siguiente lista-acciones))
                                                    (((suma-mod (elemento-actual (accion-actual lista-acciones) m1)) (elemento-actual (accion-actual lista-acciones) m2)) mod)))
                                 ) zero) )))))

(define _prod-matrices (lambda (m1)
                         (lambda (m2)
                           (lambda (mod)
                             (lambda (lista-acciones)
                               ( ((esnil lista-acciones)
                                  (lambda (no_use) matriz)
                                  (lambda (no_use) (((((_suma-matrices m1) m2) mod) (accion-siguiente lista-acciones))
                                                    (((prod-mod (elemento-actual (accion-actual lista-acciones) m1)) (elemento-actual (accion-actual lista-acciones) m2)) mod)))
                                 ) zero) )))))


(define suma-matrices (lambda (m1)
                        (lambda (m2)
                          (lambda (mod)
                            ((((_suma-matrices m1) m2) mod) lista-acciones)))))

(define prod-matrices (lambda (m1)
                        (lambda (m2)
                          (lambda (mod)
                            ((((_prod-matrices m1) m2) mod) lista-acciones)))))

(define sumam (lambda (m1)
               (lambda (m2)
                 (lambda (mod)
                   ((((matriz ((representante-canonico ((sument (primero (primero m1))) (primero (primero m2)))) mod))
                      ((representante-canonico ((sument (segundo (primero m1))) (segundo (primero m2)))) mod))
                     ((representante-canonico ((sument (primero (segundo m1))) (primero (segundo m2)))) mod))
                    ((representante-canonico ((sument (segundo (segundo m1))) (segundo (segundo m2)))) mod))))))

                           