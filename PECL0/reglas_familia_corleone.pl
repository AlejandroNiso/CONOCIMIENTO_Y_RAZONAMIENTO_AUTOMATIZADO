%consult('/Users/mr.blissfulgrin/Documents/UAH_2018_2019/RAZONAMIENTO/LAB/PECL0/reglas_familia_corleone.pl').
:-consult('/Users/mr.blissfulgrin/Documents/UAH_2018_2019/RAZONAMIENTO/LAB/PECL0/arbol_familia_corleone.pl').



ancestro(X, Y) :- progenitor(X, Y).
ancestro(X, Y) :- progenitor(X, Z), ancestro(Z, Y).

descendiente(X,Y) :- progenitor(Y, X).
descendiente(X,Y) :- progenitor(Z, X), descendiente(Z, Y).

descendientes(X, Y) :- descendientesx(X, [], Y).
descendientesx(X, Z, Y) :- descendiente(X1, X), not(member(X1, Z)), descendientesx(X, [X1|Z], Y),!.
% Produce la unificacion de las listas para terminar la recursion
descendientesx(_, X, X).

%Alguien no puede ser hernamo de si mismo.
hermano_de_madre(X, Y)  :- progenitor(Z,X), mujer(Z), progenitor(Z,Y), X\=Y.
hermano_de_padre(X, Y)  :- progenitor(Z,X), hombre(Z), progenitor(Z,Y), X\=Y.
hermano(X, Y) :- progenitor(Z,X), progenitor(Z,Y), X\=Y.

% Podria haberse definido solo abuelo o solo hermano y hacer a una
% depender de la otra, no obstante se ha decidido no hacerlo.
abuelo(X, Y) :-progenitor(X, Z), progenitor(Z,Y).
nieto(X, Y) :- progenitor(Z, X), progenitor(Y, Z).

% Podria haberse definido solo tio o solo sobrino y hacer a una
% depender de la otra, no obstante se ha decidido no hacerlo.
tio(X, Y) :- hermano(X, Z), progenitor(Z, Y).
sobrino(X, Y) :- progenitor(Z, X), hermano(Z, Y).

suegro(X, Y) :- esposos(Z, Y), progenitor(X, Z).
cuñado(X, Y) :- esposos(Z, Y), hermano(X, Z).

%La diferencia entre yerno y nuera es el genero del esposo.
yerno_o_nuera(X, Y) :- progenitor(Y, Z), esposos(X, Z).
yerno(X, Y) :- yerno_o_nuera(X, Y), hombre(X).
nuera(X, Y) :- yerno_o_nuera(X, Y), mujer(X).

relaciones([hermano, abuelo, tio, sobrino, suegro, cuñado, yerno, nuera, esposos, progenitor]).
relacion(X,Y,Z) :- relaciones(L), member(Z, L), N=..[Z, X, Y], call(N).
