%consult('/Users/mr.blissfulgrin/Documents/UAH_2018_2019/RAZONAMIENTO/LAB/PECL2/4.pl').
:-consult(draw).
:-consult(diccionario).
:-consult(oraciones).
:-consult(reglasSimples).
:-consult(reglasConcordancia).
:-consult(sustituciones).

analisis:-
    write("Ponga entrada (numero/lista/q): "),
    read(Input),
    (Input==q -> nl,write("FIN DEL ANALISIS"),nl,nl,!;
    (number(Input)->oracion(n,Input);oracion(l,Input)),
    oracion).

oracion(n,Numero):-
     o(Numero,Input),
     oracion(l,Input).

oracion(l,Input):-
    (oracion2(Output1,Input,[])->
        (oracion(Output2,Input,[])->
            nl,write("*** ORACION CORRECTA ***"),nl,draw(Output2),
            nl,write("*** ORACION CORRECTA ***"),nl,nl,!;
            nl,write("*** FALTA CONCORDANCIA ***"),nl,draw(Output1),
            nl,write("*** FALTA CONCORDANCIA ***"),nl,nl,
            (recorrerFrase(Input,[],Resultado)-> write("* SUSTITUCION:"),
            write(Resultado),nl,!;nl,write("*** NO SUSTITUCION CORRECTA ***"),nl,!),!);
        nl, write("*** NO HAY VOCABULARIO ***"),nl,nl,!).
        
oracion(p,Input):-
    oracion(Output2,Input,[]),
    nl,write("*** ORACION CORRECTA ***"),nl,draw(Output2),!.
        
obtenerSustituciones(Palabra,Resultado):-
    sustitucion(X),member(Palabra,X),delete(X,Palabra,Resultado).
    
probarSustituciones([PrimeraSustitucion|RestoSustituciones],RestoFrase,NuevaFrase,PalabraResultado):-
    append(RestoFrase,[PrimeraSustitucion|NuevaFrase],FraseAnalizar),
    (oracion(p,FraseAnalizar)-> probarSustituciones(PrimeraSustitucion,PalabraResultado),!;
    probarSustituciones(RestoSustituciones,RestoFrase,NuevaFrase,PalabraResultado)).

probarSustituciones(PrimeraSustitucion,PrimeraSustitucion).
    
recorrerFrase([PalabraEvaluar|RestoFrase],NuevaFrase,Resultado):-
    obtenerSustituciones(PalabraEvaluar,Sustituciones),
    probarSustituciones(Sustituciones,NuevaFrase,RestoFrase,NuevaPalabra),
    append(NuevaFrase,[NuevaPalabra],FraseBien),
    append(RestoFrase,FraseBien,FraseResultado),
    recorrerFrase(FraseResultado,Resultado).
    
recorrerFrase([PalabraEvaluar|RestoFrase],NuevaFrase,Resultado):-
    append(NuevaFrase,[PalabraEvaluar],FraseR),
    recorrerFrase(RestoFrase, FraseR, Resultado).
    
recorrerFrase(NuevaFrase,NuevaFrase).