%consult('/Users/mr.blissfulgrin/Documents/UAH_2018_2019/RAZONAMIENTO/LAB/PECL1/exe.pl').
:-consult('./knoledge_base.pl').
:-consult('./preguntas.pl').

%Inicio del programa
jugar:-
    caracteristicas(ListaPreguntas),length(ListaPreguntas,LongitudPreguntas),
    crearListaRespuestas(2,LongitudPreguntas,ListaRespuestas),lenguajes(ListaLenguajes),
    nl,
    send('%'),send('Akinator!!!'),
    gameLoop(ListaPreguntas,ListaRespuestas,ListaLenguajes,0),
    send('Game Over!!!'),!.

%Bucle del juego
gameLoop([PrimeraPregunta|RestoPreguntas],ListaRespuestas,ListaLenguajes,Indice):-
    send('@'),send('�Su lenguaje '),send(PrimeraPregunta),send('?'),
    receive(Respuesta),write(Respuesta),
    (Respuesta==e -> send('%'), send('exit'),! ;
                 cambiarRespuesta(Respuesta,Answer),
                 reemplazar(ListaRespuestas,Indice,Answer,NuevaListaRespuestas),
                 Indice1 is Indice+1,
                 validar(NuevaListaRespuestas,ListaLenguajes,[],NuevaListaLenguajes),
                 length(NuevaListaLenguajes,LongitudLenguajes),
                 (LongitudLenguajes=:=1 ->
                          send('%'),send('Su lenguaje es '),[Solucion|_]=NuevaListaLenguajes,
                          send(Solucion),!;
                          (LongitudLenguajes=:=0 ->
                                    send('%'),send('No se ha podido encontrar su lenguaje'),
                                    send('@'),send('�Quiere introducir un lenguaje nuevo?'),
                                    receive(IntroducirLeng),
                                    cambiarRespuesta(IntroducirLeng,IntroducirL),
                                    (IntroducirL=:=1 ->
                                                      send('@'),send('Escriba el nombre del lenguaje'),
                                                      receive(NombreNuevo),
                                                      caracteristicas(ListaPreguntas),
                                                      send('%'),send('Deber� contestar unas respuestas extra!'),
                                                      rellenarRespuestas(ListaPreguntas,NuevaListaRespuestas,NuevaListaRespuestas,0,ListaGuardar),
                                                      meterLenguaje(NombreNuevo, ListaGuardar),!;
                                                      send('%'),send('Habr�a sido bueno colaborar!!!'),!);
                          gameLoop(RestoPreguntas,NuevaListaRespuestas,NuevaListaLenguajes,Indice1)))).

gameLoop(_,_,_,_):-send('%'),send('No quedan preguntas').

%Funci�n para rellenar la lista de respuestas al introducir un nuevo lenguaje
rellenarRespuestas([PrimeraPregunta|RestoPreguntas],[PrimeraRespuesta|RestoRespuestas],ListaRespuestas,Indice,ListaRetorno):-
    (PrimeraRespuesta=:=2-> send('@'),send('�Su lenguaje '),send(PrimeraPregunta),send('?: '),
                           receive(Answer),
                           cambiarRespuesta(Answer,Respuesta),
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
    ((Respuesta1==2;Caracteristica1==2)->
                      validarAux(RestoRespuestas,RestoCaracteristicas,Lenguaje1,FinalAnterior,Final);
                      (Respuesta1==Caracteristica1 ->
                                   validarAux(RestoRespuestas,RestoCaracteristicas,Lenguaje1,FinalAnterior,Final);
                                   validarAux([],[],FinalAnterior,Final))).

validarAux(_,_,Lenguaje1,FinalAnterior,[Lenguaje1|FinalAnterior]).
validarAux(_,_,FinalAnterior,FinalAnterior).

%Reemplazar valor de una lista en una cierta posici�n
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

%Funci�n que devuelve una lista con nombres de los lenguajes
lenguajes(Lenguajes):- lenguajes_aux([], Lenguajes).
lenguajes_aux(Lenguajes,Resultado):-
    lenguaje(NuevoLenguaje,_),
    not(member(NuevoLenguaje,Lenguajes)),
    lenguajes_aux([NuevoLenguaje|Lenguajes], Resultado), !.
lenguajes_aux(X,X).

%Funcion para insertar lenguaje en la base de conocimiento
meterLenguaje(NombreLenguaje, Caracteristicas):-
    send('%'),
    send('Guaradando el lenguaje '),
    send(NombreLenguaje),
    send(' con las respuestas:'),
    send(Caracteristicas),
    assertz(lenguaje(NombreLenguaje,Caracteristicas)),
    tell('./knoledge_base.pl'),
    listing(lenguaje),
    told,
    send('Guardado!!!').

%Recibir datos del socket UDP
receive(Data) :-
        udp_socket(S),
        tcp_bind(S, 5009),
        udp_receive(S, Data, _, [as(atom)]),
        write("Recivel: "),
        write(Data),nl,
        tcp_close_socket(S).

%Enviar datos al socket UDP
send(Message) :-
        udp_socket(S),
        write("Sent: "),
        write(Message),nl,
        udp_send(S, Message, localhost:5008, []),
        tcp_close_socket(S).


cambiarRespuesta(Respuesta,RespuestaTrans):-
    (Respuesta==si -> RespuestaTrans is 1;
    (Respuesta==no -> RespuestaTrans is 0;
    RespuestaTrans is 2)).
    
%Iniciar programa automaticamente al iniciar el Java
:-jugar.