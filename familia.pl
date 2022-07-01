/*==============================================================================================*/
 
/* Relação de pai */

pai(homer, bart).
pai(homer, lisa).
pai(homer, maggie).
pai(ab, homer).
pai(ab, herb).
pai(clancy, marge).
pai(clancy, patty).
pai(clancy, selma).

/*==============================================================================================*/

/* Relação de mãe */

mae(marge, bart).
mae(marge, lisa).
mae(marge, maggie).
mae(mona, homer).
mae(jackie, marge).
mae(jackie, patty).
mae(jackie, selma).
mae(selma, ling).

/*==============================================================================================*/

/* Relação de descendência */

antecessor(X, Y) :- pai(X, Y).
antecessor(X, Y) :- mae(X, Y).
antecessor(X, Y) :- pai(X, Z), antecessor(Z, Y).
antecessor(X, Y) :- mae(X, Z), antecessor(Z, Y).

/*==============================================================================================*/

/* Relação de avô */

avo_paterno(X, Y) :- pai(X, Z), pai(Z, Y).
avo_materno(X, Y) :- pai(X, Z), mae(Z, Y).

/*==============================================================================================*/

/* Relação de avó */

avoh_paterna(X, Y) :- mae(X, Z), pai(Z, Y).
avoh_materna(X, Y) :- mae(X, Z), mae(Z, Y).

/*==============================================================================================*/

/* Relação de irmão */

irmao(X, Y) :- pai(Z, X), pai(Z, Y), X \= Y.

/*==============================================================================================*/

/* tem filho? */

tem_filho(X) :- pai(X, _).
tem_filho(X) :- mae(X, _).

/*==============================================================================================*/

/* tem mesmo filho? */

tem_mesmo_filho(X, Y) :- pai(X, Z), mae(Y, Z).

/*==============================================================================================*/

/* Relação de irmão */

tio(X, Y) :- irmao(Z, X), pai(Z, Y), X \= Z.
tio(X, Y) :- irmao(Z, X), mae(Z, Y), X \= Z.

/*==============================================================================================*/

/* Relação de primo */

primo(X, Y) :- tio(Z, X), pai(Z, Y).
primo(X, Y) :- tio(Z, X), mae(Z, Y).

/*==============================================================================================*/

/* Relação de neto */

neto(X, Y) :- pai(Y, Z), pai(Z, X).
neto(X, Y) :- mae(Y, Z), pai(Z, X).
neto(X, Y) :- pai(Y, Z), mae(Z, X).
neto(X, Y) :- mae(Y, Z), mae(Z, X).

/*==============================================================================================*/
