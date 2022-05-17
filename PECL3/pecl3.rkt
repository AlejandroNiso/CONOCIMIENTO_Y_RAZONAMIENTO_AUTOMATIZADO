; Booleanos

(define true (lambda (x y) x))

(define false (lambda (x y) y))

(define neg (lambda (x) (x false true)))
                         
(define and (lambda (x y) (x y false)))

(define or (lambda (x y) (x true y)))

; Pares ordenados
              
(define par (lambda (x)
              (lambda (y)
                (lambda (f) (f x y)))))

(define primero (lambda (p) (p true)))

(define segundo (lambda (p) (p false)))

;;;;; Combinador de punto fijo

(define Y
  (lambda (f)
    ((lambda (x) (f (lambda (v) ((x x) v))))
     (lambda (x) (f (lambda (v) ((x x) v)))))))

;;;;;; Orden en naturales y test de nulidad

(define esmenoroigualnat (lambda (n)
                             (lambda (m)
                                (escero ((restanat n) m)))))
                         
(define esmayoroigualnat (lambda (n)
                            (lambda (m)
                               (escero ((restanat m) n)))))
                         
(define esmenornat (lambda (n)
                     (lambda (m)
                       (and ((esmenoroigualnat n) m) (noescero ((restanat m) n))))))

(define esmayornat (lambda (n)
                     (lambda (m)
                       (and ((esmayoroigualnat n) m) (noescero ((restanat n) m))))))

(define esigualnat (lambda (n)
                     (lambda (m)
                       (and ((esmayoroigualnat n) m) ((esmenoroigualnat n) m)))))

(define escero (lambda (n)
                 ((n (lambda (x) false)) true)))

(define noescero (lambda (n)
                    (neg (escero n))))

; Aritmética natural. Se define también comprobar para verificar que la cosa va bien. Defino algunos naturales para hacer comprobaciones.
; Los escribo en francés para distinguirlos de los enteros que escribiré en español.

(define zero (lambda (f)
               (lambda (x) x)))

(define sucesor (lambda (n)
                  (lambda (f)
                    (lambda (x)
                     (f((n f) x))))))

(define un (sucesor zero))

(define deux (sucesor un))

(define trois (sucesor deux))

(define quatre (sucesor trois))

(define cinq (sucesor quatre))

(define six (sucesor cinq))

(define sept (sucesor six))

(define huit (sucesor sept))

(define neuf (sucesor huit))

(define dix (sucesor neuf))

(define onze (sucesor dix))

(define douze (sucesor onze))

(define treize (sucesor douze))

(define quatorze (sucesor treize))

(define quinze (sucesor quatorze))

(define seize (sucesor quinze))

(define dix-sept (sucesor seize))

(define dix-huit (sucesor dix-sept))

(define dix-neuf (sucesor dix-huit))

(define vingt (sucesor dix-neuf))

(define comprobar (lambda (n)
                    ((n (lambda (x) (+ 1 x))) 0)))

(define sumnat (lambda (n)
                 (lambda (m)
                  ((n (lambda (x) (sucesor x))) m))))

(define prodnat (lambda (n)
                   (lambda (m)
                     (lambda (f)
                       (lambda (x) ((m (n f)) x))))))
                     
(define prefn (lambda (f)
                (lambda (p)
                  ((par (f (primero p))) (primero p)))))

(define predecesor (lambda (n)
                     (lambda (f)
                       (lambda (x)
                            (segundo ((n ((lambda (g)
                                             (lambda (p) ((prefn g) p))) f)) ((par x) x)))))))
                         
(define restanat (lambda (n)
                     (lambda (m)
                        ((m (lambda (x) (predecesor x))) n))))                                                 

(define restonataux
    (lambda (n)
        (lambda (m)
            ((Y (lambda (f)
                 (lambda (x)
                    ((((esmayoroigualnat x) m)  
                        (lambda (no_use)
                            (f ((restanat x) m))
                        )
                        (lambda (no_use)
                            x
                        )
                    )
                        zero)    ; Pasa zero como argumento de no_use
                )
            ))
                n)  ; Pasa n como el valor inicial de x.
        )
))

(define restonat
    (lambda (n)
        (lambda (m)
            ((escero m) false ((restonataux n) m))
        )
    )
 )

(define cocientenataux
    (lambda (n)
        (lambda (m)
            ((Y (lambda (f)
                (lambda (x)
                    ((((esmayoroigualnat x) m)  
                        (lambda (no_use)
                            (sucesor (f ((restanat x) m)))  
                        )
                        (lambda (no_use)
                            zero
                        )
                    )
                        zero)    ; Pasa zero como argumento de no_use
                )
            ))
                n)  ; Pasa n como el valor inicial de x.
        )
    )
)

(define cocientenat
  (lambda (n)
    (lambda (m)
      ((escero m)  false ((cocientenataux n) m))
     )
   )
 )

(define mcdnat
    (lambda (n)
        (lambda (m)
            (((Y (lambda (f)
                   (lambda (x)
                     (lambda(y)
                      (((escero y)  
                       (lambda (no_use)
                            x
                        ) 
                       (lambda (no_use)
                            ((f y)((restonat x) y)) 
                        )
                        
                    )
                        zero)    ; Pasa zero como argumento de no_use
                ))
            ))
                n) ; Pasa n como el valor inicial de x.
          m)       ; Pasa m como el valor inicial de y.
    )
))

;;;;;; Definición de algunos enteros

(define cero ((par zero) zero))

(define -uno ((par zero) un))

(define -dos ((par zero) deux))

(define -tres ((par zero) trois))

(define -cuatro ((par zero) quatre))

(define -cinco ((par zero) cinq))

(define -seis ((par zero) six))

(define -siete ((par zero) sept))

(define -ocho ((par zero) huit))

(define -nueve ((par zero) neuf))

(define -diez ((par zero) dix))

(define -once ((par zero) onze))

(define -doce ((par zero) douze))

(define -trece ((par zero) treize))

(define -catorce ((par zero) quatorze))

(define -quince ((par zero) quinze))

(define -dieciseis ((par zero) seize))

(define -diecisiete ((par zero) dix-sept))

(define -dieciocho ((par zero) dix-huit))

(define -diecinueve ((par zero) dix-neuf))

(define -veinte ((par zero) vingt))

(define uno ((par un) zero))

(define dos ((par deux) zero))

(define tres ((par trois) zero))

(define cuatro ((par quatre) zero))

(define cinco ((par cinq) zero))

(define seis ((par six) zero))

(define siete ((par sept) zero))

(define ocho ((par huit) zero))

(define nueve ((par neuf) zero))

(define diez ((par dix) zero))

(define once ((par onze) zero))

(define doce ((par douze) zero))

(define trece ((par treize) zero))

(define catorce ((par quatorze) zero))

(define quince ((par quinze) zero))

(define dieciseis ((par seize) zero))

(define diecisiete ((par dix-sept) zero))

(define dieciocho ((par dix-huit) zero))

(define diecinueve ((par dix-neuf) zero))

(define veinte ((par vingt) zero))

;;;;; Orden, valor absoluto y tests de nulidad, positividad y negatividad. 
;;;
;;; m-n > m'-n' si y solo si m+n' > m'+n e igual con el resto

(define esmayoroigualent (lambda (r)
                           (lambda (s)
                             ((esmayoroigualnat ((sumnat (primero r)) (segundo s))) ((sumnat (primero s)) (segundo r)))))) 

(define esmenoroigualent (lambda (r)
                           (lambda (s)
                             ((esmenoroigualnat ((sumnat (primero r)) (segundo s))) ((sumnat (primero s)) (segundo r))))))

(define esmayorent (lambda (r)
                           (lambda (s)
                             ((esmayornat ((sumnat (primero r)) (segundo s))) ((sumnat (primero s)) (segundo r))))))

(define esmenorent (lambda (r)
                           (lambda (s)
                             ((esmenornat ((sumnat (primero r)) (segundo s))) ((sumnat (primero s)) (segundo r))))))

(define esigualent (lambda (r)
                           (lambda (s)
                             ((esigualnat ((sumnat (primero r)) (segundo s))) ((sumnat (primero s)) (segundo r))))))

(define absoluto (lambda (r)
                    (((esmayoroigualnat (primero r)) (segundo r)) ((par ((restanat (primero r)) (segundo r))) zero) ((par ((restanat (segundo r)) (primero r))) zero))))

(define negativo (lambda (r)
                   ((esmenorent r) cero)))

(define positivo (lambda (r)
                   ((esmayorent r) cero)))

(define esceroent (lambda (r)
                     ((esigualnat (primero r)) (segundo r))))
                      
(define noesceroent (lambda (r)
                       (neg (esceroent r))))

;;;;; Reducción a representante canónico de la clase de equivalencia.

(define reducir (lambda (r)
                  (((esmayoroigualnat (primero r)) (segundo r)) 
                        ((par ((restanat (primero r)) (segundo r))) zero)
                        ((par zero) ((restanat (segundo r)) (primero r))))))

;;;;; Aritmética entera. La respuesta está siempre dada por el representante canónico de la clase de equivalencia. 

(define testenteros (lambda (r)
                      (- (comprobar (primero r)) (comprobar (segundo r)))))

(define sument (lambda (r)
                  (lambda (s)
                    (reducir ((par ((sumnat (primero r)) (primero s))) ((sumnat (segundo r)) (segundo s)))))))

(define prodent (lambda (r)
                  (lambda (s)
                    (reducir ((par ((sumnat ((prodnat (primero r)) (primero s))) ((prodnat (segundo r)) (segundo s))))
                          ((sumnat ((prodnat (primero r)) (segundo s))) ((prodnat (segundo r)) (primero s))))))))                       

(define restaent (lambda (r)
                   (lambda (s)
                     (reducir ((par ((sumnat (primero r)) (segundo s))) ((sumnat (segundo r)) (primero s)))))))

;; Lo siguiente reduce la división de enteros a división de naturales. Si m \ge 0 y n> 0, y si q y r son cociente y resto de la división de m entre n, se tiene
;;  m  = q       * n        + r
;;  m  = (-q)    * (-n)     + r
;; -m  = (-(q+1))* n        + (n-r)
;; -m  = (q+1)   * (-n)     + (n-r),
;; siempre y cuando el resto no sea cero. Cuando el divisor es cero, la función cocienteent devuelve false.

(define cocienteent_aux (lambda (r)
                          (lambda (s)
                            ((cocientenat (primero (absoluto r))) (primero (absoluto s))))))

; Caso1: resto cero. Si m= q*n, entonces -m= (-q)*n, -m = q* (-n) y m= (-q)*(-n).

(define cocienteentaux-caso1 (lambda (r)
                               (lambda (s)
                                  ((or (and ((esmayoroigualent r) cero) (positivo s)) (and (negativo r) (negativo s))) ((par ((cocientenat (primero (absoluto r))) (primero (absoluto s)))) zero)
                                                                                                                       ((par zero) ((cocientenat (primero (absoluto r))) (primero (absoluto s))))))))
                              
; Caso 2: resto no nulo

(define cocienteentaux-caso2 (lambda (r)
                                (lambda (s)
                                    (((esmayoroigualent r) cero) ((positivo s) ((par ((cocienteent_aux r) s)) zero) ((par zero) ((cocienteent_aux r) s)))
                                                                 ((positivo s) ((par zero) (sucesor ((cocienteent_aux r) s))) ((par (sucesor ((cocienteent_aux r) s))) zero))))))
; Cociente cuando no hay división por cero

(define cocienteentaux (lambda (r)
                         (lambda (s)
                           ((escero ((restonat (primero (absoluto r))) (primero (absoluto s)))) ((cocienteentaux-caso1 r) s) ((cocienteentaux-caso2 r) s)))))

; Cociente considerando la división por cero

(define cocienteent (lambda (r)
                      (lambda (s)
                        (((esceroent s) (lambda (no_use) false) (lambda (no_use) ((cocienteentaux r) s))) zero))))

; Resto. Si se divide por cero, devuelve false

(define restoentaux1 (lambda (r)
                        (lambda (s)
                          ((or (and ((esmayoroigualent r) cero) (positivo s)) (and ((esmayoroigualent r) cero) (negativo s))) ((par ((restonat (primero (absoluto r))) (primero (absoluto s)))) zero)
                                                                                                           ((par ((restanat (primero (absoluto s)))((restonat (primero (absoluto r))) (primero (absoluto s))))) zero)))))

(define restoentaux (lambda (r)
                       (lambda (s)
                          ((escero ((restonat (primero (absoluto r))) (primero (absoluto s)))) cero ((restoentaux1 r) s)))))

(define restoent (lambda (r)
                      (lambda (s)
                        (((esceroent s) (lambda (no_use) false) (lambda (no_use) ((restoentaux r) s))) zero))))

;; Como mcd (r,s)=mcd(|r|,|s|), se tiene

(define mcdent (lambda (r)
                 (lambda (s)
                   ((par ((mcdnat (primero (absoluto r))) (primero (absoluto s)))) zero))))



;CÓDIGO ARITMETICA MODULAR

; Reduccion a representante canonico
(define reduccion-mod (lambda (num)
                        (lambda (mod)
                          ((restoent num) mod))))

; Suma Modular
(define suma-mod (lambda(n)
                   (lambda(m)
                     (lambda(mod)
                       ((reduccion-mod ((sument n)m))mod)))))

;Resta Modular
(define resta-mod (lambda (n)
                     (lambda (m)
                       (lambda (mod) ((reduccion-mod ((restaent n)m))mod)))))

; Producto Modular
(define prod-mod (lambda(n)
                   (lambda(m)
                     (lambda(mod)
                       ((reduccion-mod ((prodent n)m))mod)))))

;División Modular
(define div-mod (lambda (x)
                  (lambda (y)
                    ((par ((prodent (primero x)) (segundo y)))
                      ((prodent (segundo x)) (primero y))))))

; Puede ser inverso si y solo si n y mod son coprimos, es decir, que el mcd de ambos numeros sea el mismo
(define inverso? (lambda(n)
                     (lambda(mod)
                       (((esigualent((mcdent n)mod))uno)true false))))

;Comprueba si 'num-inverso' es el inverso del numero 'num' en modulo 'mod'
(define es-inverso? (lambda (num-inverso)
                      (lambda (num)
                      (lambda (mod)
                        ((esigualent (((prod-mod num-inverso) num)mod))uno)))))

;Calcular inverso             
(define inverso ; devuelve cero si el numero dado no tiene inverso en el modulo indicado
  (lambda (num)
    (lambda (mod)
      ((Y
        (lambda (f)
          (lambda (iteracion)
            ;Ambas opciones
            (
             (
              ((inverso? num) mod);condicion
              (lambda (empty) ;tiene inverso
                (((((es-inverso? iteracion) num) mod)
                 (lambda (empty0) ;es inverso
                   iteracion
                   )
                 (lambda (empty0);no es inverso
                   (f ((sument iteracion) uno))
                   )
                 );parentesis de condicion y opciones
                 zero);argumento de empty0 opcion si tiene inverso
                )
              (lambda (empty) ;no tiene inverso
                cero
                )
              )
            zero);argumento de empty
          )
        ))
       zero)
      )
    )
  )



;MATRICES

(define testmatrices (lambda (m)
                        (list (list (testenteros (primero (primero m))) (testenteros (segundo (primero m))))
                              (list (testenteros (primero (segundo m))) (testenteros (segundo (segundo m))))
                        )
                      )
)

(define matriz (lambda (a)
                         (lambda (b)
                           (lambda (c)
                             (lambda (d)
                               ((par ((par a) b)) ((par c) d)))))))

;Suma, producto y determinante
(define suma-matriz (lambda(matriz1)
                      (lambda(matriz2)
                        (lambda(mod)
                          ((((matriz
                              (((suma-mod (primero (primero matriz1))) (primero (primero matriz2)))mod))
                              (((suma-mod (primero (segundo matriz1))) (primero (segundo matriz2)))mod))
                              (((suma-mod (segundo (primero matriz1))) (segundo (primero matriz2)))mod))
                              (((suma-mod (segundo (segundo matriz1))) (segundo (segundo matriz2)))mod))))))


(define producto-matriz (lambda (matriz1)
                          (lambda (matriz2)
                            (lambda (mod)
                              ((((matriz (((suma-mod ((prodent (primero (primero matriz1))) (primero (primero matriz2)))) ((prodent (segundo (primero matriz1))) (primero (segundo matriz2)))) mod))
                                 (((suma-mod ((prodent (primero (primero matriz1))) (segundo (primero matriz2)))) ((prodent (segundo (primero matriz1))) (segundo (segundo matriz2)))) mod))
                                (((suma-mod ((prodent (primero (segundo matriz1))) (primero (primero matriz2)))) ((prodent (segundo (segundo matriz1))) (primero (segundo matriz2)))) mod))
                               (((suma-mod ((prodent (primero (segundo matriz1))) (segundo (primero matriz2)))) ((prodent (segundo (segundo matriz1))) (segundo (segundo matriz2)))) mod))))))
                               

(define determinante (lambda (matriz)
                (lambda (mod)
                  (((resta-mod (((prod-mod (primero (primero matriz))) (segundo (segundo matriz))) mod))
                               (((prod-mod (segundo (primero matriz))) (primero (segundo matriz))) mod)) mod))))
                               


(define identidad ((((matriz uno) cero) cero) uno))

(define matriz-nula ((((matriz cero) cero) cero) cero))

(define matriz-prueba1 ((((matriz dos) cuatro) -uno) cinco))

(define matriz-prueba2 ((((matriz uno) dos) dos) tres))

(define matriz-prueba3 ((((matriz dos) uno) -tres) dos))

(define matriz-prueba4 ((((matriz uno) -tres) cero) cuatro))

(define matriz-inv ((((matriz uno) dos) -dos) tres))


;Inversibilidad y rango


(define es-nula (lambda (matriz)
                  (lambda (mod)
                    ((esceroent ((reduccion-mod (primero(primero matriz))) mod))
                     ((esceroent ((reduccion-mod (primero(segundo matriz))) mod))
                      ((esceroent ((reduccion-mod (segundo(primero matriz))) mod))
                       ((esceroent ((reduccion-mod (segundo(segundo matriz))) mod)) true false)false)false)false))))

(define rango (lambda (matriz)
                (lambda (mod)
                  (((es-nula matriz)mod)cero ((rango-aux matriz)mod)))))

(define rango-aux (lambda (matriz)
                   (lambda (mod)
                     ((esceroent ((determinante matriz)mod)) uno dos))))
                               



(define tiene-inversa? (lambda (matriz)
                     (lambda (mod)
                       ((esceroent ((determinante matriz) mod)) false true))))


(define traspuesta (lambda (matr)
                      ((((matriz (primero (primero matr)))
                         (primero (segundo matr)))
                        (segundo (primero matr)))
                        (segundo (segundo matr)))))

(define adjunto (lambda (matr)
                  (lambda (mod)
                    ((((matriz ((reduccion-mod (segundo (segundo matr))) mod))
                       ((reduccion-mod ((restaent cero) (primero (segundo matr)))) mod))
                      ((reduccion-mod ((restaent cero) (segundo (primero matr)))) mod))
                     ((reduccion-mod (primero (primero matr))) mod )))))


(define producto-inv (lambda (matr)
                      (lambda (n)
                        (lambda (mod)
                       ((((matriz (((prod-mod (primero (primero matr))) n) mod))
                      (((prod-mod (segundo (primero matr))) n) mod))
                     (((prod-mod (primero (segundo matr))) n) mod))
                    (((prod-mod (segundo (segundo matr))) n) mod))))))


;Potencia de matrices
     
(define calcular-inversa
  (lambda (matr)
    (lambda (mod)
      (neg((tiene-inversa? matr)mod))
      (lambda (empty) matriz-nula)zero
      (((producto-inv (traspuesta ((adjunto matr) mod))) ((determinante matr) mod)) mod)
      )
    )
  )


(define cuadrado-matriz (lambda (matr)
                            (lambda (mod)
                              ((((matriz (((suma-mod ((prodent (primero (primero matr))) (primero (primero matr)))) ((prodent (segundo (primero matr))) (primero (segundo matr)))) mod))
                                 (((suma-mod ((prodent (primero (primero matr))) (segundo (primero matr)))) ((prodent (segundo (primero matr))) (segundo (segundo matr)))) mod))
                                (((suma-mod ((prodent (primero (segundo matr))) (primero (primero matr)))) ((prodent (segundo (segundo matr))) (primero (segundo matr)))) mod))
                               (((suma-mod ((prodent (primero (segundo matr))) (segundo (primero matr)))) ((prodent (segundo (segundo matr))) (segundo (segundo matr)))) mod)))))




(define potencia-matriz
    (lambda (matriz)
      (lambda (exponente);guardamos aqui el exponente inicial deseado
          (lambda (mod)
            (
             (
              Y     ;aplicamos combinador de punto fijo para la recursion
              (lambda (f);funcion sobre la que se aplica la recursividad
                (lambda (exponente-rec);almacenamos el exponente pasado como parámetro en las funciones padre, en el caso de la primera se coge el exponente con el que se ha llamado por terminal
                  (
                     (
                      (esceroent exponente-rec);comprobamos si el exponente es igual a cero
                      (lambda (empty)
                            identidad;si es cero devolvemos la matriz identidad (es el caso base de esta función, ya que la finalidad de todas las llamadas es llegar a este paso)
                        )
                      (lambda (empty)
                          (
                           (;si el exponente no es 0
                            (esceroent ((restoent exponente-rec)dos));comprobamos si el exponente es par o impar
                            (lambda (empty0)
                              ((cuadrado-matriz (f ((cocienteent exponente-rec) dos))) mod);si es par, llamamos a la recursión, haciendo el cuadrado de la misma matriz elevada al exponente partido de 2
                             )
                            (lambda (empty0)
                             (((producto-matriz matriz)(f ((restaent exponente-rec) uno)))mod);si es impar, multiplicamos modularmente la matriz y la matriz elevada al exponente menos 1 (par)
                             )
                            )zero;argumento de empty0
                           )
                        )
                    )zero;argumento de empty
                     )
                  )
            )
              )exponente
             )
            )
          )
      )
)


