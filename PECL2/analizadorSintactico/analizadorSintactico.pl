%consult('/Users/mr.blissfulgrin/Documents/UAH_2018_2019/RAZONAMIENTO/LAB/PECL2/4.pl').
:-consult(draw).
:-consult(diccionario).
:-consult(oraciones).
:-consult(reglasSimples).
:-consult(reglasConcordancia).

analisis:-
    write("Ponga entrada (numero/lista/q): "),
    read(Input),
    (Input==q -> nl,write("FIN DEL ANALISIS"),nl,nl,!;
    (number(Input)->oracion(n,Input);oracion(l,Input)),
    analisis).

oracion(n,Numero):-
     o(Numero,Input),
     oracion(l,Input).

oracion(l,Input):-
    (oracion2(Output1,Input,[])->
        (oracion(Output2,Input,[])->
            nl,write("*** ORACION CORRECTA ***"),nl,draw(Output2),
            nl,write("*** ORACION CORRECTA ***"),nl,nl,!;
            nl,write("*** FALTA CONCORDANCIA ***"),nl,draw(Output1),
            nl,write("*** FALTA CONCORDANCIA ***"),nl,nl,!);
        nl, write("*** NO HAY VOCABULARIO ***"),nl,nl,!).