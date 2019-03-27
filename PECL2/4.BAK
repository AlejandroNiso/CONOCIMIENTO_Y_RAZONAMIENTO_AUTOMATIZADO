%consult('/Users/mr.blissfulgrin/Documents/UAH_2018_2019/RAZONAMIENTO/LAB/PECL2/4.pl').
:-consult(draw).

oracion(Input):-
    oracion(Output,Input,[]),
    with_output_to(atom(Atom),write(Output)),
    atom_string(Atom,String),
    split_string(String,"()","( ) ",List),
    write(List),nl,
    write(Output).

%Reglasgramaticales
oracion_simple(o(GN,GV))-->g_nominal(GN),g_verbal(GV).
oracion_simple(o(GV,GN))-->g_verbal(GV),g_nominal(GN).
oracion_subordinada(o(GV,GN))-->g_verbal(GV),g_nominal(GN).

g_nominal(gn(N))-->nombre(N).
g_nominal(gn(N,A))-->nombre(N),adjetivo(A).
g_nominal(gn(D,N))-->determinante(D),nombre(N).
g_nominal(gn(D,N,A))-->determinante(D),nombre(N),adjetivo(A).
g_nominal(gn(D,N,PR,O))-->determinante(D),nombre(N),preposicion(PR),oracion_simple(O).

g_verbal(gv(V))-->verbo(V).
g_verbal(gv(V,GN))-->verbo(V),g_nominal(GN).
g_verbal(gv(V,A))-->verbo(V),adjetivo(A).
g_verbal(gv(V,GA))-->verbo(V),g_adjetival(GA).
g_verbal(gv(V,GP))-->verbo(V),g_preposicional(GP).

g_preposicional(gp(P,N))-->preposicion(P),nombre(N).
g_preposicional(gp(P,D,N))-->preposicion(P),determinante(D),nombre(N).

g_adjetival(ga(D,N,A))-->determinante(D),nombre(N),adjetivo(A).

%Diccionario
determinante(det(X))-->[X],{det(X)}.
det(el).
det(la).
det(un).
det(una).

nombre(n(X))-->[X],{n(X)}.
n(hombre).
n(mujer).
n(juan).
n(maria).
n(manzana).
n(manzanas).
n(gato).
n(raton).
n(alumno).
n(universidad).

verbo(v(X))-->[X],{v(X)}.
v(ama).
v(come).
v(estudia).
v(era).
v(cazo).

adjetivo(a(X))-->[X],{a(X)}.
a(roja).
a(negro).
a(grande).
a(gris).
a(pequeno).

preposicion(p(X))-->[X],{p(X)}.
p(que).