%consult('/Users/mr.blissfulgrin/Documents/UAH_2018_2019/RAZONAMIENTO/LAB/PECL2/4.pl').
:-consult(draw).
:-consult(oraciones).

oracion(Input):-
    oracion(Output,Input,[]),
    with_output_to(atom(Atom),write(Output)),
    atom_string(Atom,String),
    split_string(String,"()","( ) ",List),
    write(List),nl,
    write(Output), draw(Output).

%Reglasgramaticales
oracion(Output,Input,[]):- oracion_simple(Output,Input,[]).
oracion(Output,Input,[]):- oracion_subordinada(Output,Input,[]).
oracion_simple(o(GN,GV))-->g_nominal(GN),g_verbal(GV).
oracion_simple(o(GV,GN))-->g_verbal(GV),g_nominal(GN).
oracion_simple(o(GV))-->g_verbal(GV).

oracion_subordinada(o(GN,GV))-->g_nominal(GN),g_verbal(GV).

g_nominal(gn(N1,C,N2))-->nombre(N1),conjuncion(C),nombre(N2).
g_nominal(gn(N))-->nombre(N).
g_nominal(gn(PN))-->pronombre(PN).
g_nominal(gn(N,A))-->nombre(N),adjetivo(A).
g_nominal(gn(A,N))-->adjetivo(A),nombre(N).
g_nominal(gn(D,A,N))-->determinante(D),adjetivo(A),nombre(N).
g_nominal(gn(D,N))-->determinante(D),nombre(N).
g_nominal(gn(D,N,A))-->determinante(D),nombre(N),adjetivo(A).
g_nominal(gn(D,N,GP))-->determinante(D),nombre(N),g_preposicional(GP).

g_nominal(gn(D,N,C,O))-->determinante(D),nombre(N),conjuncion(C),oracion_simple(O).

g_verbal(gv(V))-->verbo(V).
g_verbal(gv(V,GN))-->verbo(V),g_nominal(GN).
g_verbal(gv(V,GN,GP))-->verbo(V),g_nominal(GN),g_preposicional(GP).
g_verbal(gv(V,A))-->verbo(V),adjetivo(A).
g_verbal(gv(V,GP))-->verbo(V),g_preposicional(GP).
g_verbal(gv(V,GA))-->verbo(V),g_adverbial(GA).
g_verbal(gv(V,GAD))-->verbo(V),g_adjetival(GAD).

g_preposicional(gp(P,G1,C,G2))-->preposicion(P),g_nominal(G1),conjuncion(C),g_nominal(G2).
g_preposicional(gp(P,GN))-->preposicion(P),g_nominal(GN).
g_preposicional(gp(P,GN,GP))-->preposicion(P),g_nominal(GN),g_preposicional(GP).

g_adverbial(gad(AD1,AD2,GP))-->adverbio(AD1),adverbio(AD2),g_preposicional(GP).
g_adverbial(gad(AD1,AD2))-->adverbio(AD1),adverbio(AD2).

g_adjetival(gaj(AD,GP))-->adjetivo(AD),g_preposicional(GP).

%Diccionario
determinante(det(X))-->[X],{det(X)}.
det(el).
det(la).
det(los).
det(las).
det(un).
det(una).
det(unos).
det(unas).
det(su).
det(sus).
det(mi).

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
n(tenedor).
n(cuchillo).
n(practica).
n(canario).
n(paloma).
n(vuelo).
n(madrid).
n(reflejo).
n(esperanza).
n(vida).
n(nino).
n(lugar).
n(nacimiento).
n(profesor).

n(hombres).
n(tenedores).
n(cuchillos).
n(practicas).
n(canarios).
n(palomas).
n(vuelos).
n(reflejos).
n(esperanzas).
n(vidas).
n(ninos).
n(lugares).
n(profesores).
n(universidades).

verbo(v(X))-->[X],{v(X)}.
v(ama).
v(come).
v(estudia).
v(era).
v(cazo).
v(hace).
v(canta).
v(alzo).
v(esta).
v(es).
v(habla).
v(depende).
v(vi).

v(comen).
v(hacen).
v(cantan).
v(alzaron).
v(estan).
v(son).
v(hablan).
v(dependen).
v(vimos).

adjetivo(a(X))-->[X],{a(X)}.
a(roja).
a(negro).
a(grande).
a(gris).
a(pequeno).
a(blanca).
a(lento).

a(grandes).
a(rojas).
a(blancas).
a(lentos).

preposicion(p(X))-->[X],{p(X)}.
p(con).
p(de).
p(en).

conjuncion(c(X))-->[X],{c(X)}.
c(y).
c(que).

pronombre(pn(X))-->[X],{pn(X)}.
pn(ella).
pn(el).

adverbio(ad(X))-->[X],{ad(X)}.
ad(muy).
ad(lejos).
ad(claramente).