% Reglas gramaticales
oracion --> g_nominal, g_verbal.
oracion --> oracionpreposicional.
oracionpreposicional --> g_nominal, preposicion, verbo, oracion.

g_nominal --> nombre.
g_nominal --> nombre, adjetivo.
g_nominal --> determinante, nombre.
g_nominal --> determinante, nombre,adjetivo.

g_verbal --> verbo.
g_verbal --> verbo, g_nominal.
g_verbal --> verbo, adjetivo.
g_verbal --> verbo, adjetivo.
g_verbal --> verbo, g_adjetival.
g_verbal --> verbo, g_preposicional.

g_preposicional --> preposicion,nombre.
g_preposicional --> preposicion,determinante,nombre.

g_adjetival --> determinante,nombre,adjetivo.

%Diccionario
determinante --> [el].
determinante --> [la].
determinante --> [un].
determinante --> [una].

nombre --> [hombre].
nombre --> [mujer].
nombre --> [juan].
nombre --> [maria].
nombre --> [manzana].
nombre --> [manzanas].
nombre --> [gato].
nombre --> [raton].
nombre --> [alumno].
nombre --> [universidad].

verbo --> [ama].
verbo --> [come].
verbo --> [estudia].
verbo --> [era].
verbo --> [cazo].

adjetivo --> [roja].
adjetivo --> [negro].
adjetivo --> [grande].
adjetivo --> [gris].
adjetivo --> [pequeno].

preposicion --> [que].