%consult('/Users/mr.blissfulgrin/Documents/UAH_2018_2019/RAZONAMIENTO/LAB/PECL1/exe.pl').
:-consult('./knoledge_base.pl').
:-consult('./preguntas.pl').

%Inicio del programa
akinator:-
    caracteristicas(ListaPreguntas),length(ListaPreguntas,LongitudPreguntas),
    crearListaRespuestas(n,LongitudPreguntas,ListaRespuestas),lenguajes(ListaLenguajes),
    write('Init'),
    nl,send('%'),send('Akinator!!!'), nl,nl,
    gameLoop(ListaPreguntas,ListaRespuestas,ListaLenguajes,0),
    nl,send('%'),send('Game Over!!!'),nl,!.

%Bucle del juego
gameLoop([PrimeraPregunta|RestoPreguntas],ListaRespuestas,ListaLenguajes,Indice):-
    send('@'),send('¿Su lenguaje '),send(PrimeraPregunta),send('?'),
    receive(Answer),
    (Answer==e -> send('%'), send('exit'),! ;
                 reemplazar(ListaRespuestas,Indice,Answer,NuevaListaRespuestas),
                 send('$'), send(NuevaListaRespuestas),nl,
                 Indice1 is Indice+1,
                 validar(NuevaListaRespuestas,ListaLenguajes,[],NuevaListaLenguajes),
                 send('#'),send(NuevaListaLenguajes),nl,
                 length(NuevaListaLenguajes,LongitudLenguajes),
                 (LongitudLenguajes=:=1 ->
                          send('%'),send('Su lenguaje es '),[Solucion|_]=NuevaListaLenguajes,
                          send(Solucion),!;
                          (LongitudLenguajes=:=0 ->
                                    send('%'),send('No se ha podido encontrar su lenguaje'),nl,
                                    send('@'),send('¿Quiere introducir un lenguaje nuevo?'),
                                    receive(IntroducirL),
                                    (IntroducirL=:=1 ->
                                                      send('@'),send('Escriba el nombre del lenguaje'),
                                                      receive(NombreNuevo),
                                                      caracteristicas(ListaPreguntas),
                                                      nl,send('%'),send('Deberá contestar unas respuestas extra!'),nl,
                                                      completarRespuestas(ListaPreguntas,NuevaListaRespuestas,[],ListaGuardar),
                                                      meterLenguaje(NombreNuevo, ListaGuardar),!;
                                                      send('%'),send('Habría sido bueno colaborar!!!'),!);
                          gameLoop(RestoPreguntas,NuevaListaRespuestas,NuevaListaLenguajes,Indice1)))).

gameLoop(_,_,_,_):-send('%'),send('No quedan preguntas').

%Función para rellenar la lista de respuestas al introducir un nuevo lenguaje
completarRespuestas([PrimeraPregunta|RestoPreguntas],[PrimeraRespuesta|RestoRespuestas],ListaGuardar,ListaRetorno):-
    (PrimeraRespuesta==n->
                           send('@'),send('¿Su lenguaje '),send(PrimeraPregunta),send('?'),
                           receive(Respuesta),
                           send('$'),send(ListaGuardar),nl,
                           completarRespuestas(RestoPreguntas,RestoRespuestas,[Respuesta|ListaGuardar],ListaRetorno);
                           completarRespuestas(RestoPreguntas,RestoRespuestas,[PrimeraRespuesta|ListaGuardar],ListaRetorno)).

completarRespuestas(_,_,ListaGuardar,ListaGuardar).

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
    nl,send('%'),send('Guaradando el lenguaje '),
    send(NombreLenguaje),
    send(' con las respuestas:'),nl,
    send(Caracteristicas),nl,
    assertz(lenguaje(NombreLenguaje,Caracteristicas)),
    tell('./knoledge_base.pl'),
    listing(lenguaje),
    told,
    send('Guardado!!!'),nl.

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

:-akinator.
