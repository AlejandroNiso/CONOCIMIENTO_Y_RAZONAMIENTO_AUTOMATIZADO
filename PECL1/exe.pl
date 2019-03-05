%consult('/Users/mr.blissfulgrin/Documents/UAH_2018_2019/RAZONAMIENTO/LAB/PECL1/exe.pl').
:-consult('./knoledge_base.pl').
:-consult('./preguntas.pl').

%Inicio del programa
jugar:-
    caracteristicas(ListaPreguntas),length(ListaPreguntas,LongitudPreguntas),
    crearListaRespuestas(n,LongitudPreguntas,ListaRespuestas),lenguajes(ListaLenguajes),
    nl,write('Akinator!!!'), nl,nl,
    gameLoop(ListaPreguntas,ListaRespuestas,ListaLenguajes,0),
    nl,write('Game Over!!!'),nl,!.

%Bucle del juego
gameLoop([PrimeraPregunta|RestoPreguntas],ListaRespuestas,ListaLenguajes,Indice):-
    write('¿Su lenguaje '),write(PrimeraPregunta),write('?'),
    read(Answer),
    (Answer==e -> write('exit'),! ;
                 reemplazar(ListaRespuestas,Indice,Answer,NuevaListaRespuestas),
                 write(NuevaListaRespuestas),nl,
                 Indice1 is Indice+1,
                 validar(NuevaListaRespuestas,ListaLenguajes,[],NuevaListaLenguajes),
                 write(NuevaListaLenguajes),nl,
                 length(NuevaListaLenguajes,LongitudLenguajes),
                 (LongitudLenguajes=:=1 ->
                          write('Su lenguaje es '),[Solucion|_]=NuevaListaLenguajes,
                          write(Solucion),!;
                          (LongitudLenguajes=:=0 ->
                                    write('No se ha podido encontrar su lenguaje'),nl,
                                    write('¿Quiere introducir un lenguaje nuevo?'),
                                    read(IntroducirL),
                                    (IntroducirL=:=1 ->
                                                      write('Escriba el nombre del lenguaje'),
                                                      read(NombreNuevo),
                                                      caracteristicas(ListaPreguntas),
                                                      nl,write('Deberá contestar unas respuestas extra!'),nl,
                                                      rellenarRespuestas(ListaPreguntas,NuevaListaRespuestas,NuevaListaRespuestas,0,ListaGuardar),
                                                      meterLenguaje(NombreNuevo, ListaGuardar),!;
                                                      write('Habría sido bueno colaborar!!!'),!);
                          gameLoop(RestoPreguntas,NuevaListaRespuestas,NuevaListaLenguajes,Indice1)))).

gameLoop(_,_,_,_):-write('No quedan preguntas').

%Función para rellenar la lista de respuestas al introducir un nuevo lenguaje
rellenarRespuestas([PrimeraPregunta|RestoPreguntas],[PrimeraRespuesta|RestoRespuestas],ListaRespuestas,Indice,ListaRetorno):-
    (PrimeraRespuesta==n-> write('¿Su lenguaje '),write(PrimeraPregunta),write('?'),
                           read(Respuesta),
                           reemplazar(ListaRespuestas,Indice,Respuesta,ListaGuardar),
                           write(ListaGuardar),nl,
                           Indice2 is Indice +1,
                           rellenarRespuestas(RestoPreguntas,RestoRespuestas,ListaGuardar,Indice2,ListaRetorno);
                           Indice2 is Indice +1,
                           rellenarRespuestas(RestoPreguntas,RestoRespuestas,ListaRespuestas,Indice2,ListaRetorno)).
rellenarRespuestas(_,_,ListaGuardar,_,ListaGuardar).

%Comparar caracteristicas y quitar lenguaje de la lista general
validar(ListaRespuestas,[Lenguaje1|RestoLenguajes],FinalAnterior,Final):-
    lenguaje(Lenguaje1,ListaCaract),
    validarAux(ListaRespuestas,ListaCaract,Lenguaje1,FinalAnterior,Resultado),
    validar(ListaRespuestas,RestoLenguajes,Resultado,Final).

validar(_,_,FinalAnterior,FinalAnterior).

validarAux([Respuesta1|RestoRespuestas],[Caracteristica1|RestoCaracteristicas],Lenguaje1,FinalAnterior,Final):-
    ((Respuesta1==n;Caracteristica1==n)->
                      validarAux(RestoRespuestas,RestoCaracteristicas,Lenguaje1,FinalAnterior,Final);
                      (Respuesta1==Caracteristica1 ->
                                   validarAux(RestoRespuestas,RestoCaracteristicas,Lenguaje1,FinalAnterior,Final);
                                   validarAux([],[],FinalAnterior,Final))).

validarAux(_,_,Lenguaje1,FinalAnterior,[Lenguaje1|FinalAnterior]).
validarAux(_,_,FinalAnterior,FinalAnterior).

%Reemplazar valor de una lista en una cierta posición
reemplazar([_|Cola], 0, Valor, [Valor|Cola]).
reemplazar([Cabeza|Cola1], Indice, Valor, [Cabeza|Cola2]):-
    Indice > -1,
    NuevoIndice is Indice-1,
    reemplazar(Cola1, NuevoIndice, Valor, Cola2), !.
reemplazar(Lista, _, _, Lista).

%Construir lista de longitud N con valor X en sus posiciones
crearListaRespuestas(Valor, Longitud, ListaRespuestas)  :-
    length(ListaRespuestas, Longitud),
    maplist(=(Valor), ListaRespuestas).

%Función que devuelve una lista con nombres de los lenguajes
lenguajes(Lenguajes):- lenguajes_aux([], Lenguajes).
lenguajes_aux(Lenguajes,Resultado):-
    lenguaje(NuevoLenguaje,_),
    not(member(NuevoLenguaje,Lenguajes)),
    lenguajes_aux([NuevoLenguaje|Lenguajes], Resultado), !.
lenguajes_aux(X,X).

%Funcione que obtiene una pregunta dado un indice
obtenerPregunta(Indice, Pregunta):-
    caracteristicas(Lista),
    nth1(Indice, Lista, Pregunta).

%Funcion para insertar lenguaje en la base de conocimiento
meterLenguaje(NombreLenguaje, Caracteristicas):-
    nl,write('Guardando el lenguaje '),
    write(NombreLenguaje),
    write(' con las respuestas:'),nl,
    write(Caracteristicas),nl,
    assertz(lenguaje(NombreLenguaje,Caracteristicas)),
    tell('./knoledge_base.pl'),
    listing(lenguaje),
    told,
    write('Guardado!!!'),nl.

%Recibir datos del socket UDP
receive(Data) :-
        udp_socket(S),
        tcp_bind(S, 5009),
        udp_receive(S, Data, _, [as(atom)]),
        tcp_close_socket(S).

%Enviar datos al socket UDP
send(Message) :-
        udp_socket(S),
        udp_send(S, Message, localhost:5008, []),
        tcp_close_socket(S).
        
<<<<<<< HEAD
%:-jugar.
%completarRespuestas(ListaPreguntas,NuevaListaRespuestas,[],ListaGuardar),
=======
%:-akinator.

>>>>>>> 9241e8e882ce1f2207b0eae1ce963cdbf6dda50e
