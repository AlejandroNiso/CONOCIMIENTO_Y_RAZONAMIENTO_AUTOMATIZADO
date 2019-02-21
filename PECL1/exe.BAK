%consult('/Users/mr.blissfulgrin/Documents/UAH_2018_2019/RAZONAMIENTO/LAB/PECL1/exe.pl').
:-consult('./knoledge_base.pl').

akinator:-nl,write('Akinator!!!'), nl,nl,caracteristicas(Lista_caracteristicas),
    length(Lista_caracteristicas, Longitud_car), build(n,Longitud_car,Lista_Respuestas),
    gameLoop(Lista_caracteristicas,Lista_Respuestas,0),
    nl,write('Game Over!!!'),nl,!.

gameLoop(Lista_caracteristicas,Lista_Respuestas,Indice):-question(Lista_caracteristicas,Lista_Respuestas,Indice),nl.

question(Lista_caracteristicas,Lista_Respuestas,Indice):-write('Su lenguaje '),
    [Cabeza|Cola]=Lista_caracteristicas,write(Cabeza),write('?'),
    read(Answer),reemplazar(Lista_Respuestas,Indice,Answer,NuevaListaRespuestas),
    write(NuevaListaRespuestas),Indice1 is Indice+1, gameLoop(Cola,NuevaListaRespuestas,Indice1).


%Mostrar elementos de dos listas a la vez
rlist(Lista1,Lista2):-[C1|Cola1]=Lista1,[C2|Cola2]=Lista2, write(C1), write(C2),rlist(Cola1,Cola2).

%Comparar caracteristicas y quitar lenguaje de la lista general
validarLeng(ListaRespuestas,ListaLenguajes,NombreLenguaje):-[C1|Cola1]=ListaRespuestas,
    lenguaje(NombreLenguaje,ListaCaract),[C2|Cola2]=ListaCaract, write(C1), write(C2),rlist(Cola1,Cola2).

%Reemplazar valor de una lista en una cierta posición
reemplazar([_|T], 0, X, [X|T]).
reemplazar([H|T], I, X, [H|R]):- I > -1, NI is I-1, reemplazar(T, NI, X, R), !.
reemplazar(L, _, _, L).
    
%Construir lista de longitud N con valor X en sus posiciones
build(X, N, List)  :-
    length(List, N),
    maplist(=(X), List).

%Función que devuelve una lista con nombres de los lenguajes
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
