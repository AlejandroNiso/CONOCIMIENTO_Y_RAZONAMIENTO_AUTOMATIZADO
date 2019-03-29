%consult('/Users/mr.blissfulgrin/Documents/UAH_2018_2019/RAZONAMIENTO/LAB/PECL2/4.pl').
:-consult(draw).
:-consult(oraciones).
:-consult(graphviz).

oracion(Input):-
    oracion(Output,Input,[]),
    with_output_to(atom(Atom),write(Output)),
    atom_string(Atom,String),
    split_string(String,"()","( ) ",List),
    write(List),nl,
    write(Output), draw(Output),!.

%Reglasgramaticales
oracion(Output,Input,[]):- oracion_simple(Output,Input,[]).
oracion(Output,Input,[]):- oracion_ccordinada(Output,Input,[]).
oracion_simple(o(GV))-->g_verbal(GV).
oracion_simple(o(GN,GV))-->g_nominal(GN),g_verbal(GV).
oracion_simple(o(GV,GN))-->g_verbal(GV),g_nominal(GN).

oracion_ccordinada(o(OS1,C,OS2))-->oracion_simple(OS1),conjuncion(C),oracion_simple(OS2).
oracion_ccordinada(o(OS1,C1,OS2,C2,OS3))-->oracion_simple(OS1),conjuncion(C1),oracion_simple(OS2),conjuncion(C2),oracion_simple(OS3).

oracion_subordinada(o(GN,GV))-->g_nominal_sub(GN),g_verbal(GV).

g_nom(gn(N))-->nombre(N).
g_nom(gn(PN))-->pronombre(PN).
g_nom(gn(N,A))-->nombre(N),adjetivo(A).
g_nom(gn(N1,N2))-->nombre(N1),nombre(N2).

g_nom(gn(A,N))-->adjetivo(A),nombre(N).
g_nom(gn(D,A,N))-->determinante(D),adjetivo(A),nombre(N).
g_nom(gn(D,N))-->determinante(D),nombre(N).
g_nom(gn(D,N,A))-->determinante(D),nombre(N),adjetivo(A).

g_nominal(GN)-->g_nom(GN).
g_nominal(gn(GN1,C,GN2))-->g_nom(GN1),conjuncion(C),g_nom(GN2).
%g_nominal(gn(GN1,C,GN2,A))-->g_nom(GN1),conjuncion(C),g_nom(GN2),adjetivo(A).
g_nominal(gn(GN1,GP))-->g_nom(GN1),g_preposicional(GP).
g_nominal(gn(GN1,GA))-->g_nom(GN1),g_adjetival(GA).
g_nominal(gn(GN1,OR))-->g_nom(GN1),o_relativo(OR).
g_nominal(gn(GN1,GA,OR))-->g_nom(GN1),g_adjetival(GA),o_relativo(OR).

o_relativo(or(PR,OS))-->p_relativo(PR),oracion_simple(OS).

g_verbal(gv(V))-->verbo(V).
g_verbal(gv(V,GN))-->verbo(V),g_nominal(GN).
g_verbal(gv(V,GN,GP))-->verbo(V),g_nominal(GN),g_preposicional(GP).
g_verbal(gv(V,GN,GA))-->verbo(V),g_nominal(GN),g_adjetival(GA).
g_verbal(gv(V,A))-->verbo(V),adjetivo(A).
g_verbal(gv(V,GP))-->verbo(V),g_preposicional(GP).
g_verbal(gv(V,GA))-->verbo(V),g_adverbial(GA).
g_verbal(gv(V,GA,GN))-->verbo(V),g_adverbial(GA),g_nominal(GN).
g_verbal(gv(V,GAD))-->verbo(V),g_adjetival(GAD).

g_preposicional(gp(P,GN))-->preposicion(P),g_nominal(GN).

g_adverbial(gad(AD1,AD2,GP))-->adverbio(AD1),adverbio(AD2),g_preposicional(GP).
g_adverbial(gad(AD1,AD2))-->adverbio(AD1),adverbio(AD2).
g_adverbial(gad(ADV))-->adverbio(ADV).

g_adjetival(gaj(AD,GP))-->adjetivo(AD),g_preposicional(GP).
g_adjetival(gaj(ADV,ADJ))-->adverbio(ADV),adjetivo(ADJ).

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
n(irene).
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
n(procesador).
n(texto).
n(herramienta).
n(escribir).
n(documento).
n(cafe).
n(mesa).
n(pantalon).
n(corbata).
n(hector).
n(patata).
n(cerveza).

n(raton).

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
n(procesadores).
n(textos).
n(herramientas).
n(documentos).
n(cafes).
n(mesas).
n(pantalones).
n(corbatas).
n(patatas).
n(cervezas).

n(ratones).

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
v(sirve).
v(recoge).
v(toma).
v(compre).
v(bebe).
v(salta).
v(sonrie).

v(saltan).
v(comen).
v(hacen).
v(cantan).
v(alzaron).
v(estan).
v(son).
v(hablan).
v(dependen).
v(vimos).
v(sirven).
v(recogen).
v(toman).
v(compraron).
v(beben).

adjetivo(a(X))-->[X],{a(X)}.
a(roja).
a(negro).
a(grande).
a(gris).
a(pequeno).
a(blanca).
a(lento).
a(delicado).
a(delicada).
a(potente).
a(moreno).
a(alta).
a(negro).
a(frita).
a(alegre).


a(grandes).
a(rojas).
a(blancas).
a(lentos).
a(delicados).
a(delicadas).
a(potentes).
a(morenos).
a(altas).
a(negros).
a(fritas).

preposicion(p(X))-->[X],{p(X)}.
p(con).
p(de).
p(en).
p(para).

p(a).

conjuncion(c(X))-->[X],{c(X)}.
c(y).
c(mientras).
c(pero).

p_relativo(pr(X))-->[X],{pr(X)}.
pr(que).

pronombre(pn(X))-->[X],{pn(X)}.
pn(ella).
pn(el).

adverbio(ad(X))-->[X],{ad(X)}.
ad(muy).
ad(lejos).
ad(claramente).
ad(solamente).
ad(bastante).