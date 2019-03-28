%consult('/Users/mr.blissfulgrin/Documents/UAH_2018_2019/RAZONAMIENTO/LAB/PECL2/generos.pl').
:-consult(draw).
:-consult(oraciones).

oracion(Input):-
    oracion(Output,Input,[]),
    with_output_to(atom(Atom),write(Output)),
    atom_string(Atom,String),
    split_string(String,"()","( ) ",List),
    write(List),nl,
    write(Output), draw(Output),
    validate(List).

%Reglasgramaticales
oracion(Output,Input,[]):- oracion_simple(Output,Input,[]).
oracion(Output,Input,[]):- oracion_subordinada(Output,Input,[]).
oracion_simple(o(GN,GV))-->g_nominal(GN),g_verbal(GV).
oracion_simple(o(GV,GN))-->g_verbal(GV),g_nominal(GN).
oracion_simple(o(GV))-->g_verbal(GV).

oracion_subordinada(o(GV,GN))-->g_verbal(GV),g_nominal(GN).

g_nominal(gn(N1,C,N2))-->nombre(N1),conjuncion(C),nombre(N2).
g_nominal(gn(N))-->nombre(N).
g_nominal(gn(PN))-->pronombre(PN).
g_nominal(gn(N,A))-->nombre(N),adjetivo(A).
g_nominal(gn(A,N))-->adjetivo(A),nombre(N).
g_nominal(gn(D,A,N))-->determinante(D),adjetivo(A),nombre(N).
g_nominal(gn(D,N))-->determinante(D),nombre(N).
g_nominal(gn(D,N,A))-->determinante(D),nombre(N),adjetivo(A).
g_nominal(gn(D,N,GP))-->determinante(D),nombre(N),g_preposicional(GP).

g_nominal(gn(D,N,PR,O))-->determinante(D),nombre(N),preposicion(PR),oracion_simple(O).

g_verbal(gv(V))-->verbo(V).
g_verbal(gv(V,GN))-->verbo(V),g_nominal(GN).
g_verbal(gv(V,GN,GP))-->verbo(V),g_nominal(GN),g_preposicional(GP).
g_verbal(gv(V,A))-->verbo(V),adjetivo(A).
g_verbal(gv(V,GP))-->verbo(V),g_preposicional(GP).
g_verbal(gv(V,GA))-->verbo(V),g_adverbial(GA).
g_verbal(gv(V,GAD))-->verbo(V),g_adjetival(GAD).

g_preposicional(gp(P,G1,C,G2))-->preposicion(P),g_nominal(G1),conjuncion(C),g_nominal(G2).
g_preposicional(gp(P,GN))-->preposicion(P),g_nominal(GN).

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

n(hombres).
n(tenedores).
n(cuchillos).
n(practicas).
n(canarios).
n(palomas).
n(vuelos).
n(reflejos).

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

v(comen).
v(hacen).
v(cantan).
v(alzaron).
v(estan).
v(son).
v(hablan).

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
p(que).
p(con).
p(de).

conjuncion(c(X))-->[X],{c(X)}.
c(y).

pronombre(pn(X))-->[X],{pn(X)}.
pn(ella).
pn(el).

adverbio(ad(X))-->[X],{ad(X)}.
ad(muy).
ad(lejos).
ad(claramente).

g(m, ["el","los","un","unos","mi","su","sus","hombre","juan","gato","naranja","naranjas","raton","alumno","colegio","tenedor","
           trabajo","cuchillo","canario","vuelo","madrid","reflejo","nino","lugar","naciminetio","profesor","hombres","
           tenedores","cuchillos","canarios","vuelos","reflejos","ninos","lugares","profesores","negro","grande","gris","
           peque�o","lento","grandes","lentos","deseo","vivo","trabajos","deseos","vivos","colegios","rojo","peque�o","blanco","
           grandes","rojos","bancos","ellos"]).

g(f, ["la","las","una","unas","mi","su","sus","mujer","maria","gata","manzana","manzanas","rata","alumna","universidad","cuchara","
          practica","navaja","paloma","travasia","madrid","refleja","nina","plaza","celebracion","profesora","mujeres","
          cucharas","navajas","palomas","travasias","reflejas","ninas","plazas","profesoras","negra","peque�a","gis","
          peque�a","lenta","grandes","lentas","esperanza","vida","practicas","esperanzas","vidas","universidades","roja","grande","blanca","
          grandes","rojas","blancas","ella"]).

g(s, ["el","un","la","una","su","mi","naranjas","hombre","mujer","juan","maria","manzana","gato","raton","alumno","universidad","
          tenedor","cuchillo","practica","canario","paloma","vuelo","madrid","reflejo","esperanza","vida","nino","nino","lugar","nacimiento","
          profesor","ama","come","estudia","era","cazo","hace","canta","alzo","esta","es","habla","depende","vi","roja","negro","
          grande","gris","pequeno","blanca","lento","ella","el"]).

g(p, ["los","unos","las","unas","sus","mis","manzanas","hombres","mujeres","juanes","marias","gatos","ratones","alumnos","universidades","
        tenedores","cuchillos","practicas","canarios","palomas","vuelos","sevillas","reflejos","esperanzas","vidas","ninos","lugares","nacimientos","
        profesores","amas","comen","estudian","eran","cazaron","hacen","cantan","alzaron","estan","son","hablan","dependen","vimos","rojas","negros","
        grandes","grises","pequenos","blancas","lentos","ellas","los"]).

validate([Elemento|List]) :-
    (g(Value,Listado),member(Elemento,Listado)->
    write(Elemento),write("-->"),write(Value),nl,validate(List);validate(List)),
validate(_).
