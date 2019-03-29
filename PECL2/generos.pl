
g(m, ["el","los","un","unos","mi","mis","su","sus","hombre","juan","gato","naranja","naranjas","raton","ratones","alumno","colegio","tenedor",
           "trabajo","cuchillo","canario","vuelo","madrid","reflejo","nino","lugar","naciminetio","profesor","hombres",
           "tenedores","cuchillos","canarios","vuelos","reflejos","ninos","lugares","profesores","negro","grande","gris",
           "peque�o","lento","grandes","lentos","deseo","vivo","trabajos","deseos","vivos","colegios","rojo","peque�o","blanco",
           "grandes","rojos","bancos","ellos","el","procesador","texto","documento","cafe","pantalon","hector","delicado","potente","moreno","alegre",
           "pepe","utensilio","taburete","taburetes","","traje","tuberculo","tuberculos","wisky","alto","altos"]).

g(f, ["la","las","una","unas","mi","mis","su","sus","mujer","maria","gata","manzana","manzanas","rata","ratas","alumna","universidad","cuchara",
          "practica","navaja","paloma","travesia","madrid","refleja","nina","plaza","celebracion","profesora","mujeres",
          "cucharas","navajas","palomas","travasias","reflejas","ninas","plazas","profesoras","negra","peque�a","gis",
          "peque�a","lenta","grandes","lentas","esperanza","vida","practicas","esperanzas","vidas","universidades","roja","grande","blanca",
          "grandes","rojas","blancas","ellas","ella","procesadora","revista","redaccion","leche","ropa","victoria","delicada","potente","morena","alegre",
          "irene","herramienta","mesa","mesas","corbata","patata","patatas","cerveza","alta","altas"]).

g(s, ["el","un","la","una","su","mi","naranjas","hombre","mujer","juan","maria","manzana","gato","raton","alumno","universidad",
          "tenedor","cuchillo","practica","canario","paloma","vuelo","madrid","reflejo","esperanza","vida","nino","nino","lugar","nacimiento",
          "profesor","ama","come","estudia","era","cazo","hace","canta","alzo","esta","es","habla","depende","vi","roja","negro",
          "grande","gris","pequeno","blanca","lento","ella","el","procesador","procesadora","texto","revista","documento","cafe","pantalon","hector",
          "redaccion","leche","ropa","victoria","sirve","recoge","toma","compre","bebe","salta","sonrie","delicado","delicada","potente",
          "moreno","morena","alegre","herramienta","utensilio","mesa","taburete","corbata","traje","patata","tuberculo","cerveza","wisky","alta","alto"]).

g(p, ["los","unos","las","unas","sus","mis","manzanas","hombres","mujeres","juanes","marias","gatos","ratones","alumnos","universidades",
        "tenedores","cuchillos","practicas","canarios","palomas","vuelos","sevillas","reflejos","esperanzas","vidas","ninos","lugares","nacimientos",
        "profesores","amas","comen","estudian","eran","cazaron","hacen","cantan","alzaron","estan","son","hablan","dependen","vimos","rojas","negros",
        "grandes","grises","pequenos","blancas","lentos","ellas","los","procesadores","procesadoras","textos","revistas","documentos","cafes","pantalones","hectors",
        "redacciones","leches","ropas","victorias","sirven","recogen","toman","toman","compren","beben","saltan","sonrien","delicados","delicadas","potentes",
        "morenos","morenas","alegres","herramientas","utensilios","mesas","taburetes","corbatas","trajes","patatas","tuberculos","cervezas","wiskys","altas","altos"]).

validate([Elemento|Lista],E,[],R):-
    write("").
validate(_,R,R).

validate_inicio(Input,Output):-validatem(Input,[],R),reverse(R,Output).

validatem([Elemento|List],Genero,R) :-
    (g(m,Listado),member(Elemento,Listado)->
         validatef([Elemento|List],[m|Genero],R);validatef([Elemento|List],Genero,R)).
validatem(_,R,R).
validatef([Elemento|List],Genero,R) :-
    (g(f,Listado),member(Elemento,Listado)->
         validates([Elemento|List],[f|Genero],R);validates([Elemento|List],Genero,R)).
validates([Elemento|List],Numero,R) :-
    (g(s,Listado),member(Elemento,Listado)->
         validatep([Elemento|List],[s|Numero],R);validatep([Elemento|List],Numero,R)).
validatep([Elemento|List],Numero,R) :-
    (g(p,Listado),member(Elemento,Listado)->
         validatem(List,[p|Numero],R);validatem(List,Numero,R)).

