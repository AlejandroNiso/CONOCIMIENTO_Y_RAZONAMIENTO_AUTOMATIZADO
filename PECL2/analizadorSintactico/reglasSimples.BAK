%Reglas Gramaticales Simples

oracion2(Output,Input,[]):- oracion2_simple(Output,Input,[]).
oracion2(Output,Input,[]):- oracion2_ccordinada(Output,Input,[]).
oracion2_simple(o(GV))-->g_verbal2(GV,_,_).
oracion2_simple(o(GN,GV))-->g_nominal2(GN,_,_),g_verbal2(GV,_,_).
oracion2_simple(o(GV,GN))-->g_verbal2(GV,_,_),g_nominal2(GN,_,_).

oracion2_ccordinada(o(OS1,C,OS2))-->oracion2_simple(OS1),conjuncion(C),oracion2_simple(OS2).
oracion2_ccordinada(o(OS1,C1,OS2,C2,OS3))-->oracion2_simple(OS1),conjuncion(C1),oracion2_simple(OS2),conjuncion(C2),oracion2_simple(OS3).

g_nom2(gn(N),_,_)-->nombre(N,_,_).
g_nom2(gn(PN),_,_)-->pronombre(PN,_,_).
g_nom2(gn(N,A),_,_)-->nombre(N,_,_),g_adjetival(A,_,_).
g_nom2(gn(N1,N2),_,_)-->nombre(N1,_,_),nombre(N2,_,_).

g_nom2(gn(A,N),_,_)-->g_adjetival(A,_,_),nombre(N,_,_).
g_nom2(gn(D,A,N),_,_)-->determinante(D,_,_),g_adjetival(A,_,_),nombre(N,_,_).
g_nom2(gn(D,N),_,_)-->determinante(D,_,_),nombre(N,_,_).
g_nom2(gn(D,N,A),_,_)-->determinante(D,_,_),nombre(N,_,_),g_adjetival(A,_,_).

g_nominal2(GN,_,_)-->g_nom2(GN,_,_).
g_nominal2(gn(GN1,C,GN2),_,p)-->g_nom2(GN1,_,_),conjuncion(C),g_nom2(GN2,_,_).
g_nominal2(gn(GN1,C,GN2,A),_,p)-->g_nom2(GN1,_,_),conjuncion(C),g_nom2(GN2,_,_),g_adjetival(A,_,p).
g_nominal2(gn(GN1,GP),_,_)-->g_nom2(GN1,_,_),g_preposicional2(GP,_,_).
g_nominal2(gn(GN1,GA),_,_)-->g_nom2(GN1,_,_),g_adjetival2(GA,_,_).
g_nominal2(gn(GN1,OR),_,_)-->g_nom2(GN1,_,_),o_relativo2(OR,_,_).
g_nominal2(gn(GN1,GA,OR),_,_)-->g_nom2(GN1,_,_),g_adjetival2(GA,_,_),o_relativo2(OR,_,_).

o_relativo2(or(PR,OS),_,_)-->p_relativo(PR),oracion2_simple(OS).

g_verbal2(gv(V),_,_)-->verbo(V,_,_).
g_verbal2(gv(V,GN),_,_)-->verbo(V,_,c),g_nominal2(GN,_,_).
g_verbal2(gv(V,GN),_,_)-->verbo(V,_,n),g_nominal2(GN,_,_).
g_verbal2(gv(V,GN,GP),_,_)-->verbo(V,_,_),g_nominal2(GN,_,_),g_preposicional2(GP,_,_).
g_verbal2(gv(V,GN,GA),_,_)-->verbo(V,_,_),g_nominal2(GN,_,_),g_adjetival2(GA,_,_).
g_verbal2(gv(V,A),_,_)-->verbo(V,_,_),g_adjetival(A,_,_).
g_verbal2(gv(V,GP),_,_)-->verbo(V,_,_),g_preposicional2(GP,_,_).
g_verbal2(gv(V,GA),_,_)-->verbo(V,_,_),g_adverbial2(GA,_,_).
g_verbal2(gv(V,GA,GN),_,_)-->verbo(V,_,c),g_adverbial2(GA,_,_),g_nominal2(GN,_,_).
g_verbal2(gv(V,GA,GN),_,_)-->verbo(V,_,n),g_adverbial2(GA,_,_),g_nominal2(GN,_,_).
g_verbal2(gv(V,GAD),_,_)-->verbo(V,_,_),g_adjetival2(GAD,_,_).

g_preposicional2(gp(P,GN),_,_)-->preposicion(P),g_nominal2(GN,_,_).

g_adverbial2(gad(AD1,AD2,GP),_,_)-->adverbio(AD1),adverbio(AD2),g_preposicional2(GP,_,_).
g_adverbial2(gad(AD1,AD2),_,_)-->adverbio(AD1),adverbio(AD2).
g_adverbial2(gad(ADV),_,_)-->adverbio(ADV).

g_adjetival2(gaj(AD,GP),_,_)-->adjetivo(AD,_,_),g_preposicional2(GP,_,_).
g_adjetival2(gaj(ADV,ADJ),_,_)-->adverbio(ADV),adjetivo(ADJ,_,_).
