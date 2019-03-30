%consult('/Users/mr.blissfulgrin/Documents/UAH_2018_2019/RAZONAMIENTO/LAB/PECL2/4.pl').
:-consult(draw).
:-consult(oraciones).

oracion(n,Numero):-
     o(Numero,Input),
     oracion(l,Input).

oracion(s,String):-
    split_string(String," "," ",List),
    write(List),
    oracion(l,List).

oracion(l,Input):-
    (oracion2(Output1,Input,[])->
        (oracion(Output2,Input,[])->
            write("Oracion correcta"),draw(Output2),!;
            write("Falta de concordancia"),draw(Output1),!);
        write("No hay vocabulario"),!).

%Reglasgramaticales
oracion2(Output,Input,[]):- oracion2_simple(Output,Input,[]).
oracion2(Output,Input,[]):- oracion2_ccordinada(Output,Input,[]).
oracion2_simple(o(GV))-->g_verbal2(GV,_,_).
%oracion2_simple(o(GN))-->g_nominal2(GN,_,_).
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

%Reglasgramaticales
oracion(Output,Input,[]):- oracion_simple(Output,Input,[]).
oracion(Output,Input,[]):- oracion_ccordinada(Output,Input,[]).
oracion_simple(o(GV))-->g_verbal(GV,_,_).
%oracion_simple(o(GN))-->g_nominal(GN,_,_).
oracion_simple(o(GN,GV))-->g_nominal(GN,Gen,Num),g_verbal(GV,Gen,Num).
oracion_simple(o(GV,GN))-->g_verbal(GV,Gen,Num),g_nominal(GN,Gen,Num).

oracion_ccordinada(o(OS1,C,OS2))-->oracion_simple(OS1),conjuncion(C),oracion_simple(OS2).
oracion_ccordinada(o(OS1,C1,OS2,C2,OS3))-->oracion_simple(OS1),conjuncion(C1),oracion_simple(OS2),conjuncion(C2),oracion_simple(OS3).

g_nom(gn(N),Gen,Num)-->nombre(N,Gen,Num).
g_nom(gn(PN),Gen,Num)-->pronombre(PN,Gen,Num).
g_nom(gn(N,A),Gen,Num)-->nombre(N,Gen,Num),g_adjetival(A,Gen,Num).
g_nom(gn(N1,N2),Gen,_)-->nombre(N1,Gen,_),nombre(N2,Gen,_).

g_nom(gn(A,N),Gen,Num)-->g_adjetival(A,Gen,Num),nombre(N,Gen,Num).
g_nom(gn(D,A,N),Gen,Num)-->determinante(D,Gen,Num),g_adjetival(A,Gen,Num),nombre(N,Gen,Num).
g_nom(gn(D,N),Gen,Num)-->determinante(D,Gen,Num),nombre(N,Gen,Num).
g_nom(gn(D,N,A),Gen,Num)-->determinante(D,Gen,Num),nombre(N,Gen,Num),g_adjetival(A,Gen,Num).

g_nominal(GN,Gen,Num)-->g_nom(GN,Gen,Num).
g_nominal(gn(GN1,C,GN2),_,p)-->g_nom(GN1,_,_),conjuncion(C),g_nom(GN2,_,_).
g_nominal(gn(GN1,C,GN2,A),_,p)-->g_nom(GN1,_,_),conjuncion(C),g_nom(GN2,_,_),g_adjetival(A,_,p).
g_nominal(gn(GN1,GP),_,Num)-->g_nom(GN1,_,Num),g_preposicional(GP,_,_).
g_nominal(gn(GN1,GA),Gen,Num)-->g_nom(GN1,Gen,Num),g_adjetival(GA,Gen,Num).
g_nominal(gn(GN1,OR),Gen,Num)-->g_nom(GN1,Gen,Num),o_relativo(OR,_,_).
g_nominal(gn(GN1,GA,OR),Gen,Num)-->g_nom(GN1,Gen,Num),g_adjetival(GA,Gen,Num),o_relativo(OR,_,_).

o_relativo(or(PR,OS),_,_)-->p_relativo(PR),oracion_simple(OS).

g_verbal(gv(V),_,Num)-->verbo(V,Num,_).
g_verbal(gv(V,GN),_,Num)-->verbo(V,Num,c),g_nominal(GN,_,Num).
g_verbal(gv(V,GN),_,Num)-->verbo(V,Num,n),g_nominal(GN,_,_).
g_verbal(gv(V,GN,GP),Gen,Num)-->verbo(V,Num,_),g_nominal(GN,Gen,_),g_preposicional(GP,Gen,Num).
g_verbal(gv(V,GN,GA),Gen,Num)-->verbo(V,Num,_),g_nominal(GN,Gen,_),g_adjetival(GA,Gen,Num).
g_verbal(gv(V,A),Gen,Num)-->verbo(V,Num,_),g_adjetival(A,Gen,Num).
g_verbal(gv(V,GP),_,Num)-->verbo(V,Num,_),g_preposicional(GP,_,_).
g_verbal(gv(V,GA),Gen,Num)-->verbo(V,Num,_),g_adverbial(GA,Gen,_).
g_verbal(gv(V,GA,GN),Gen,Num)-->verbo(V,Num,c),g_adverbial(GA,_,_),g_nominal(GN,Gen,Num).
g_verbal(gv(V,GA,GN),_,Num)-->verbo(V,Num,n),g_adverbial(GA,_,_),g_nominal(GN,_,_).
g_verbal(gv(V,GAD),Gen,Num)-->verbo(V,Num,_),g_adjetival(GAD,Gen,Num).

g_preposicional(gp(P,GN),Gen,Num)-->preposicion(P),g_nominal(GN,Gen,Num).

g_adverbial(gad(AD1,AD2,GP),Gen,Num)-->adverbio(AD1),adverbio(AD2),g_preposicional(GP,Gen,Num).
g_adverbial(gad(AD1,AD2),_,_)-->adverbio(AD1),adverbio(AD2).
g_adverbial(gad(ADV),_,_)-->adverbio(ADV).

g_adjetival(gaj(AD,GP),Gen,Num)-->adjetivo(AD,Gen,Num),g_preposicional(GP,_,_).
g_adjetival(gaj(ADV,ADJ),Gen,Num)-->adverbio(ADV),adjetivo(ADJ,Gen,Num).
g_adjetival(gaj(ADJ),Gen,Num)-->adjetivo(ADJ,Gen,Num).

%Diccionario
determinante(det(X),Gen,Num)-->[X],{det(X,Gen,Num)}.
det(el,m,s).
det(la,f,s).
det(los,m,p).
det(las,f,p).
det(un,m,s).
det(una,f,s).
det(unos,m,p).
det(unas,f,p).
det(su,f,s).
det(su,m,s).
det(sus,m,p).
det(sus,f,p).
det(mi,m,s).
det(mi,f,s).
det(mis,m,p).
det(mis,f,p).

nombre(n(X),Gen,Num)-->[X],{n(X,Gen,Num)}.
n(hombre,m,s).
n(mujer,f,s).
n(juan,m,s).
n(maria,f,s).
n(irene,f,s).
n(manzana,f,s).
n(manzanas,f,p).
n(gato,m,s).
n(raton,m,s).
n(alumno,m,s).
n(universidad,f,s).
n(tenedor,m,s).
n(cuchillo,m,s).
n(practica,f,s).
n(canario,m,s).
n(paloma,f,s).
n(vuelo,m,s).
n(madrid,f,s).
n(madrid,m,s).
n(reflejo,m,s).
n(esperanza,f,s).
n(vida,f,s).
n(nino,m,s).
n(lugar,m,s).
n(nacimiento,m,s).
n(profesor,m,s).
n(profesora,f,s).
n(procesador,m,s).
n(texto,m,s).
n(herramienta,f,s).
n(escribir,f,s).
n(escribir,m,s).
n(documento,m,s).
n(cafe,m,s).
n(mesa,f,s).
n(pantalon,m,s).
n(corbata,f,s).
n(hector,m,s).
n(patata,f,s).
n(cerveza,f,s).
n(raton,m,s).

n(hombres,m,p).
n(mujeres,f,p).
n(manzano,m,s).
n(manzanos,m,p).
n(gatos,m,p).
n(gata,f,s).
n(tenedores,m,p).
n(cuchillos,m,p).
n(practicas,f,p).
n(canarios,m,p).
n(palomas,f,p).
n(vuelos,m,p).
n(reflejos,m,p).
n(esperanzas,f,p).
n(vidas,f,p).
n(ninos,m,p).
n(lugares,m,p).
n(profesores,m,p).
n(profesoras,f,p).
n(universidades,f,p).
n(procesadores,m,p).
n(textos,m,p).
n(herramientas,f,p).
n(documentos,m,p).
n(cafes,m,p).
n(mesas,f,p).
n(pantalones,m,p).
n(corbatas,f,p).
n(patatas,f,p).
n(cervezas,f,p).
n(ratones,m,p).

verbo(v(X),Num,Cop)-->[X],{v(X,Num,Cop)}.
v(ama,s,n).
v(come,s,n).
v(estudia,s,n).
v(era,s,c).
v(cazo,s,n).
v(hace,s,n).
v(canta,s,n).
v(alzo,s,n).
v(esta,s,c).
v(es,s,c).
v(habla,s,n).
v(depende,s,n).
v(vi,s,n).
v(sirve,s,n).
v(recoge,s,n).
v(toma,s,n).
v(compre,s,n).
v(bebe,s,n).
v(salta,s,n).
v(sonrie,s,n).
v(somos,p,c).

v(saltan,p,n).
v(comen,p,n).
v(hacen,p,n).
v(cantan,p,n).
v(alzaron,p,n).
v(estan,p,c).
v(son,p,c).
v(hablan,p,n).
v(dependen,p,n).
v(vimos,p,n).
v(sirven,p,n).
v(recogen,p,n).
v(toman,p,n).
v(compraron,p,n).
v(beben,p,n).

adjetivo(a(X),Gen,Num)-->[X],{a(X,Gen,Num)}.
a(roja,f,s).
a(rojo,m,s).
a(negro,m,s).
a(negra,f,s).
a(grande,m,s).
a(grande,f,s).
a(gris,m,s).
a(gris,f,s).
a(pequeno,m,s).
a(pequena,f,s).
a(blanca,f,s).
a(lento,m,s).
a(lenta,f,s).
a(delicado,m,s).
a(delicada,f,s).
a(potente,f,s).
a(moreno,m,s).
a(alta,f,s).
a(alto,m,s).
a(frita,f,s).
a(frito,m,s).
a(alegre,f,s).
a(alegre,m,s).

a(grandes,f,p).
a(grandes,m,p).
a(rojas,f,p).
a(rojos,m,p).
a(blancas,f,p).
a(blancos,m,p).
a(lentos,m,p).
a(delicados,m,p).
a(delicadas,f,p).
a(potentes,m,p).
a(potentes,f,p).
a(morenos,m,p).
a(morenas,f,p).
a(altas,f,p).
a(altos,m,p).
a(negros,m,p).
a(negras,f,p).
a(fritas,f,p).

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

pronombre(pn(X),Gen,Num)-->[X],{pn(X,Gen,Num)}.
pn(ella,f,s).
pn(el,m,s).
pn(ellas,f,p).
pn(ellos,m,p).

adverbio(ad(X))-->[X],{ad(X)}.
ad(muy).
ad(lejos).
ad(claramente).
ad(solamente).
ad(bastante).