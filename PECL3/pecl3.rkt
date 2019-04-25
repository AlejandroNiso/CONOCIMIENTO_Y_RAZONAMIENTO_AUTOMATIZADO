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

(define _num-inverso (lambda (n)
                      (lambda (mod)
                        (lambda (mod_original)
                          ((((esigualent (((prod-mod n) mod) mod_original)) uno)
                                  (lambda (no_use) mod)
                                  (lambda (no_use)
                                    ((((esigualent mod) cero)
                                      (lambda (no_use) (print "** Numero sin inverso ** ")-uno)
                                      (lambda (no_use) (((_num-inverso n) ((restaent mod) uno)) mod_original))) zero))) zero)))))

(define num-inverso (lambda (n)
                      (lambda (mod)
                        (((_num-inverso n) ((restaent mod) uno)) mod))))

;; ****************************************
;; *************** MATRICES ***************
(define suma-matrices (lambda (m1)
               (lambda (m2)
                 (lambda (mod)
                   ((((matriz (((suma-mod (primero (primero m1))) (primero (primero m2))) mod))
                      (((suma-mod (segundo (primero m1))) (segundo (primero m2))) mod))
                     (((suma-mod (primero (segundo m1))) (primero (segundo m2))) mod))
                    (((suma-mod (segundo (segundo m1))) (segundo (segundo m2))) mod))))))

(define producto-matrices (lambda (m1)
               (lambda (m2)
                 (lambda (mod)
                   ((((matriz (((suma-mod ((prodent (primero (primero m1))) (primero (primero m2)))) ((prodent (segundo (primero m1))) (primero (segundo m2)))) mod))
                      (((suma-mod ((prodent (primero (primero m1))) (segundo (primero m2)))) ((prodent (segundo (primero m1))) (segundo (segundo m2)))) mod))
                     (((suma-mod ((prodent (primero (segundo m1))) (primero (primero m2)))) ((prodent (segundo (segundo m1))) (primero (segundo m2)))) mod))
                    (((suma-mod ((prodent (primero (segundo m1))) (segundo (primero m2)))) ((prodent (segundo (segundo m1))) (segundo (segundo m2)))) mod))))))


(define determinante (lambda (m1)
                       (lambda (mod)
                         ((representante-canonico ((restaent ((prodent (primero (primero m1))) (segundo (segundo m1))))
                                                            ((prodent (segundo (primero m1))) (primero (segundo m1))))) mod))))

(define producto_em (lambda (m1)
                      (lambda (n)
                        (lambda (mod)
                       ((((matriz (((prod-mod (primero (primero m1))) n) mod))
                      (((prod-mod (segundo (primero m1))) n) mod))
                     (((prod-mod (primero (segundo m1))) n) mod))
                    (((prod-mod (segundo (segundo m1))) n) mod))))))


(define adjunto (lambda (m1)
                  (lambda (mod)
                    ((((matriz ((representante-canonico (segundo (segundo m1))) mod))
                       ((representante-canonico ((restaent cero) (primero (segundo m1)))) mod))
                      ((representante-canonico ((restaent cero) (segundo (primero m1)))) mod))
                     ((representante-canonico (primero (primero m1))) mod )))))

(define transpuesta (lambda (m1)
                      ((((matriz (primero (primero m1)))
                         (primero (segundo m1)))
                        (segundo (primero m1)))
                        (segundo (segundo m1)))))

(define _inversa-matriz (lambda (m1)
                          (lambda (det)
                            (lambda (mod)
                              (((producto_em (transpuesta ((adjunto m1) mod))) ((determinante m1) mod)) mod)))))

(define inversa-matriz (lambda (m1)
                         (lambda (mod)
                           ((((inversa? m1) mod)
                              (lambda (no_use) (((_inversa-matriz m1) ((determinante m1) mod)) mod))
                              (lambda (no_use) (print "** Matriz sin inversa ** ")-uno)) zero))))

(define inversa? (lambda (m1)
                   (lambda (mod)
                     (noesceroent ((determinante m1) mod)))))

(define rango (lambda (matriz)
                (lambda (mod)
                (((noesceroent ((determinante matriz) mod))
                                  (lambda (no_use) dos)
                                  (lambda (no_use)
                                    (((todos-cero matriz)
                                      (lambda (no_use) cero)
                                      (lambda (no_use) uno)) zero))) zero))))

(define todos-cero (lambda (matriz)
                     (and (and ((esigualent (primero (primero matriz))) cero) ((esigualent (primero (segundo matriz))) cero))
                     (and ((esigualent (segundo (primero matriz))) cero) ((esigualent (segundo (segundo matriz))) cero)))))

(define parent? (lambda (n)
               (esceroent ((restoent n) dos))))

(define _potencia-matrices (lambda (matriz)
                             (lambda (z)
                               (lambda (potencia)
                                 (lambda (mod)
                                   (((noesceroent potencia)
                                     (lambda (no_use)
                                       (((parent? potencia)
                                         (lambda (no_use1) ((((_potencia-matrices (((producto-matrices matriz)matriz)mod)) z) ((cocienteent potencia)dos)) mod))
                                         (lambda (no_use1) ((((_potencia-matrices matriz) (((producto-matrices matriz) z) mod)) ((restaent potencia)uno)) mod))) zero))
                                     (lambda (no_use) z)) zero))))))

(define potencia-matriz (lambda (m1)
                          (lambda (potencia)
                            (lambda (mod)
                              ((((_potencia-matrices m1) identidad) potencia) mod)))))

;;(testmatrices (((suma-matrices matriz_prueba1) matriz_prueba2) tres))
;;(testmatrices (((producto-matrices matriz_prueba2) matriz_prueba1) tres))
;;(testmatrices (((potencia-matriz matriz_prueba1) dos) tres))
;;(testmatrices ((inversa-matriz matriz_prueba1) tres))