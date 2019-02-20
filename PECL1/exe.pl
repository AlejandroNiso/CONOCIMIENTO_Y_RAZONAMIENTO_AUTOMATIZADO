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





















