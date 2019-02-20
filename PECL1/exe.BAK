%consult('/Users/mr.blissfulgrin/Documents/UAH_2018_2019/RAZONAMIENTO/LAB/PECL1/exe.pl').
:-consult('./knoledge_base.pl').

akinator:-nl,write('Akinator!!!'), nl,nl,
    gameLoop,
    nl,write('Game Over!!!'),nl,!.

gameLoop:-question,nl,
    read(Answer),
    validate(Answer).

question:-write('pregunta').
validate(Answer):-write(Answer).

%Función que devuelve una lista con todos los lenguajes
lenguajes(Y):- lenguajes_aux([], Y).
lenguajes_aux(Z,Y):- lenguaje(X1,_), not(member(X1,Z)), lenguajes_aux([X1|Z], Y), !.
lenguajes_aux(X,X).

%Función que dada una caracteristica y su satisfación, devuelve una lista de los
%lenguajes que la cumplen

%Funcione que obtiene una pregunta dado un indice
obtenerPregunta(I, X):-caracteristicas(L), nth1(I, L, X).
