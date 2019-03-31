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
n(hombres,m,p).
n(mujeres,f,p).

n(juan,m,s).
n(hector,m,s).
n(maria,f,s).
n(irene,f,s).

n(platano,m,s).
n(platanos,m,p).
n(manzana,f,s).
n(manzanas,f,p).

n(gato,m,s).
n(gatos,m,p).
n(zebra,f,s).
n(zebras,f,p).

n(raton,m,s).
n(ratones,m,p).
n(rata,f,s).
n(ratas,f,p).

n(alumno,m,s).
n(alumnos,m,p).
n(alumna,f,s).
n(alumnas,f,p).

n(colegio,m,s).
n(colegios,m,p).
n(universidad,f,s).
n(universidads,f,p).

n(tenedor,m,s).
n(tenedores,m,p).
n(cuchara,f,s).
n(cucharas,f,p).

n(cuchillo,m,s).
n(cuchillo,m,p).
n(sierra,f,s).
n(sierras,f,p).

n(practica,f,s).
n(practicas,f,p).
n(trabajo,m,s).
n(trabajos,m,p).

n(canario,m,s).
n(canarios,m,p).
n(paloma,f,s).
n(palomas,f,p).

n(vuelo,m,s).
n(vuelos,m,p).
n(travesia,f,s).
n(travesias,f,p).

n(madrid,f,s).
n(madrid,m,s).

n(reflejo,m,s).
n(reflejos,m,p).
n(velocidad,f,s).
n(velocidades,f,p).

n(esperanza,f,s).
n(esperanzas,f,p).
n(deseo,m,s).
n(deseos,m,s).

n(entusiasmo,m,s).
n(entusiasmos,m,p).
n(vida,f,s).
n(vidas,f,p).

n(nino,m,s).
n(ninos,m,p).
n(nina,f,s).
n(ninas,f,p).

n(lugar,m,s).
n(lugares,m,p).
n(zona,f,s).
n(zonas,f,p).

n(nacimiento,m,s).
n(nacimientos,m,p).
n(salida,f,s).
n(salidas,f,s).

n(profesor,m,s).
n(profesores,m,p).
n(profesora,f,s).
n(profesoras,f,p).

n(procesador,m,s).
n(procesadores,m,p).
n(procesadora,f,s).
n(procesadoras,f,p).

n(texto,m,s).
n(textos,m,p).
n(documento,m,s).
n(documentos,m,p).
n(redaccion,f,s).
n(redacciones,f,p).

n(utensilio,m,s).
n(utensilios,m,p).
n(herramienta,f,s).
n(herramientas,f,p).

n(escribir,f,s).
n(escribir,m,s).

n(tomate,m,s).
n(tomates,m,s).
n(patata,f,s).
n(patata,f,p).

n(cafe,m,s).
n(cafes,m,p).
n(agua,f,s).
n(aguas,f,p).
n(cerveza,f,s).
n(cervezas,f,p).

n(mesa,f,s).
n(pantalon,m,s).
n(corbata,f,s).

n(manzano,m,s).
n(manzanos,m,p).
n(palmera,f,s).
n(palmeras,f,p).

n(taburete,m,s).
n(taburetes,m,p).
n(mesa,f,s).
n(mesas,f,p).

n(pantalon,m,s).
n(pantalones,m,p).
n(corbata,f,s).
n(corbatas,f,p).

verbo(v(X),Num,Cop)-->[X],{v(X,Num,Cop)}.
v(ama,s,n).
v(aman,p,n).  

v(come,s,n).
v(comen,p,n).

v(estudia,s,n).
v(estudian,p,n).

v(era,s,c).
v(eran,p,c).

v(cazo,s,n).
v(cazaron,p,n).

v(hace,s,n).
v(hacen,p,n).

v(canta,s,n).
v(cantan,p,n).

v(alzo,s,n).
v(alzaron,p,n).

v(esta,s,c).
v(estan,p,c).

v(es,s,c).
v(son,p,c).
v(somos,p,c).

v(habla,s,n).
v(hablan,p,n).

v(depende,s,n).
v(dependen,p,n).

v(vimos,p,n).
v(vi,s,n).

v(sirve,s,n).
v(sirven,p,n).

v(recoge,s,n).
v(recogen,p,n).

v(toma,s,n).
v(toman,p,n).

v(compre,s,n).
v(compraron,p,n).

v(bebe,s,n).
v(beben,p,n).

v(salta,s,n).
v(saltan,p,n).

v(sonrie,s,n).
v(sonrien,p,n).


adjetivo(a(X),Gen,Num)-->[X],{a(X,Gen,Num)}.
a(roja,f,s).
a(rojo,m,s).
a(rojas,f,p).
a(rojos,m,p).

a(negro,m,s).
a(negra,f,s).
a(negros,m,p).
a(negras,f,p).

a(grande,m,s).
a(grande,f,s).
a(grandes,m,p).
a(grandes,f,p).

a(gris,m,s).
a(gris,f,s).
a(grises,m,p).
a(grises,f,p).

a(pequeno,m,s).
a(pequena,f,s).
a(pequenos,m,p).
a(pequenas,f,p).

a(blanco,m,s).
a(blanca,f,s).
a(blancas,f,p).
a(blancos,m,p).

a(lento,m,s).
a(lenta,f,s).
a(lentos,m,p).
a(lentas,f,p).

a(delicado,m,s).
a(delicada,f,s).
a(delicados,m,p).
a(delicadas,f,p).

a(potente,m,s).
a(potente,f,s).
a(potentes,m,p).
a(potentes,f,p).

a(moreno,m,s).
a(morenos,m,p).
a(morena,f,s).
a(morenas,f,p).

a(alta,f,s).
a(alto,m,s).
a(altas,f,p).
a(altos,m,p).

a(frita,f,s).
a(frito,m,s).
a(fritos,m,p).  
a(fritas,f,p).

a(alegre,f,s).
a(alegre,m,s).
a(alegres,f,p).
a(alegres,m,p).


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