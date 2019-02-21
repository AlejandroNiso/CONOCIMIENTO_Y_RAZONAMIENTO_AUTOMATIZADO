%consult('/Users/mr.blissfulgrin/Documents/UAH_2018_2019/RAZONAMIENTO/LAB/PECL1/exe.pl').
:-consult('./knoledge_base.pl').

akinator:-nl,write('Akinator!!!'), nl,nl,caracteristicas(Lista_caracteristicas),
    %length(Lista_caracteristicas, Longitud_car), %build(n,Longitud_car,Lista_Respuestas),
    gameLoop(Lista_caracteristicas,[],0),
    nl,write('Game Over!!!'),nl,!.

gameLoop(Lista_caracteristicas,Lista_Respuestas,Indice):-question(Lista_caracteristicas,Lista_Respuestas,Indice),nl.

question(Lista_caracteristicas,Lista_Respuestas, Indice):-write('Su lenguaje '),
    [Cabeza|Cola]=Lista_caracteristicas,write($Cabeza),write('?'),
    read(Answer),nth0(Indice,Nueva_ListaRespuestas,Answer,Lista_Respuestas),write($Nueva_ListaRespuestas),
    Indice1 is Indice+1, gameLoop(Cola,Nueva_ListaRespuestas,Indice1).

build(X, N, List)  :-
    length(List, N),
    maplist(=(X), List).
    

%validate(Lista_caracteristicas,Answer):-write(Answer),gameLoop(Lista_caracteristicas).

%Función que devuelve una lista con todos los lenguajes
lenguajes(Y):- lenguajes_aux([], Y).
lenguajes_aux(Z,Y):- lenguaje(X1,_), not(member(X1,Z)), lenguajes_aux([X1|Z], Y), !.
lenguajes_aux(X,X).

%Función que dada una caracteristica y su satisfación, devuelve una lista de los
%lenguajes que la cumplen
%lenguajesCar (X,I,Y):-lenguajesCar_aux(X, I, Y, []).
%lenguajesCar_aux (X,I,Y,Z):-

%Funcione que obtiene una pregunta dado un indice
obtenerPregunta(I, X):-caracteristicas(L), nth1(I, L, X).

%Funcion para contar caracteristicas

%Funcion para generar vector con tantos 0 como caract hay

%Dado un indice y una lista, pone dicho elemento a 1
